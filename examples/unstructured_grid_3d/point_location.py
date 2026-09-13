"""Greedy affine point location using conservative Voronoi cell bounds."""

import time

import numpy as np


def locate(tree, x, y, z):
    if x is None or y is None or z is None:
        return None
    x, y, z = float(x), float(y), float(z)
    reference = 1
    while reference > 0:
        node = reference - 1
        wx, wy, wz = tree["weights"][node]
        above = wx * x + wy * y + wz * z >= tree["thresholds"][node]
        reference = tree["children"][node][0 if above else 1]
    return tree["values"][-reference - 1]


class PointLocationTree:
    def __init__(self, sites, cells, bounds):
        started = time.perf_counter()
        self.sites, self.cells = sites, cells
        self.cell_lo = np.array([cell.min(axis=0) for cell in cells])
        self.cell_hi = np.array([cell.max(axis=0) for cell in cells])
        self.corners = np.array([[x, y, z] for x in (0, 1) for y in (0, 1) for z in (0, 1)])
        self.pairs = {n: np.triu_indices(n, 1) for n in range(2, 9)}
        self.leaf_depths = []
        self.tree = {"weights": [], "thresholds": [], "children": [], "values": [None, *range(len(sites))]}
        for axis, limit in enumerate(bounds):
            for sign, threshold in [(1, 0), (-1, -limit)]:
                normal = [0.0, 0.0, 0.0]
                normal[axis] = float(sign)
                self.tree["weights"].append(normal)
                self.tree["thresholds"].append(float(threshold))
                self.tree["children"].append([len(self.tree["weights"]) + 1, -1])
        directions = np.array([[1, 0, 0], [0, 1, 0], [0, 0, 1],
                               [1, 1, 0], [1, 0, 1], [0, 1, 1],
                               [1, -1, 0], [1, 0, -1], [0, 1, -1]], dtype=float)
        self.directions = directions / np.linalg.norm(directions, axis=1)[:, None]
        self.next_progress = started + 5
        self.tree["children"][5][0] = self._build(np.arange(len(sites)), 6, np.zeros(3), np.array(bounds))
        self.build_seconds = time.perf_counter() - started

    def _classify(self, ids, a, b, lo, hi):
        points = self.sites[ids]
        normals = points[b] - points[a]
        normals /= np.linalg.norm(normals, axis=1)[:, None]
        thresholds = np.sum(normals * ((points[a] + points[b]) / 2), axis=1)
        vertices = np.concatenate([self.cells[i] for i in ids])
        offsets = np.cumsum([0] + [len(self.cells[i]) for i in ids[:-1]])
        distances = vertices @ normals.T - thresholds
        cell_lo = np.maximum(self.cell_lo[ids], lo)
        cell_hi = np.minimum(self.cell_hi[ids], hi)
        low_terms = np.minimum(cell_lo[:, :, None] * normals.T, cell_hi[:, :, None] * normals.T)
        high_terms = np.maximum(cell_lo[:, :, None] * normals.T, cell_hi[:, :, None] * normals.T)
        lower = np.maximum(np.minimum.reduceat(distances, offsets), low_terms.sum(axis=1) - thresholds)
        upper = np.minimum(np.maximum.reduceat(distances, offsets), high_terms.sum(axis=1) - thresholds)
        above, below = upper >= 0, lower <= 0
        columns = np.arange(len(a))
        # A cell lies on its own side of its site's bisector. Forcing these
        # entries also guarantees that both children eliminate a candidate.
        above[a, columns], below[a, columns] = False, True
        above[b, columns], below[b, columns] = True, False
        return normals, thresholds, above, below

    def _small_tree(self, ids, depth, lo, hi):
        """Classify each cell against each bisector once for this small subtree."""
        n = len(ids)
        if n == 1:
            self.leaf_depths.append(depth)
            return -(int(ids[0]) + 2)
        a, b = self.pairs[n]
        normals, thresholds, above, below = self._classify(ids, a, b, lo, hi)
        bits = 1 << np.arange(n)
        above_masks = (above * bits[:, None]).sum(axis=0).tolist()
        below_masks = (below * bits[:, None]).sum(axis=0).tolist()
        pairs = (bits[a] | bits[b]).tolist()
        pair_columns = dict(zip(pairs, range(len(pairs))))
        decisions = {}
        normals, thresholds = normals.tolist(), thresholds.tolist()
        leaves = [-(int(i) + 2) for i in ids]

        def build(mask, level):
            count = mask.bit_count()
            if count == 1:
                self.leaf_depths.append(level)
                return leaves[mask.bit_length() - 1]
            if count == 2:
                column = pair_columns[mask]
                self.leaf_depths.extend((level + 1, level + 1))
                self.tree["weights"].append(normals[column])
                self.tree["thresholds"].append(thresholds[column])
                self.tree["children"].append([leaves[int(b[column])], leaves[int(a[column])]])
                return len(self.tree["weights"])
            if mask not in decisions:
                best = None
                for column, pair in enumerate(pairs):
                    if mask & pair != pair:
                        continue
                    upper_mask, lower_mask = mask & above_masks[column], mask & below_masks[column]
                    na, nb = upper_mask.bit_count(), lower_mask.bit_count()
                    largest, total = max(na, nb), na + nb
                    key = largest + total - count, largest, total, column
                    if best is None or key < best:
                        best, chosen = key, (column, upper_mask, lower_mask)
                decisions[mask] = chosen
            column, upper_mask, lower_mask = decisions[mask]
            reference = len(self.tree["weights"]) + 1
            self.tree["weights"].append(normals[column])
            self.tree["thresholds"].append(thresholds[column])
            self.tree["children"].append(None)
            upper = build(upper_mask, level + 1)
            lower = build(lower_mask, level + 1)
            self.tree["children"][reference - 1] = [upper, lower]
            return reference

        try:
            return build((1 << n) - 1, depth)
        finally:
            # Break the recursive closure's cycle so its temporary arrays are
            # released immediately, rather than waiting for cyclic collection.
            build = None

    def _split(self, ids, lo, hi):
        n = len(ids)
        cell_lo = np.maximum(self.cell_lo[ids], lo)
        cell_hi = np.minimum(self.cell_hi[ids], hi)
        choices = []
        centers = (cell_lo + cell_hi) / 2
        medians = np.median(centers, axis=0)
        for axis in range(3):
            for threshold in ((lo[axis] + hi[axis]) / 2, medians[axis]):
                if not lo[axis] < threshold < hi[axis]:
                    continue
                above = cell_hi[:, axis] >= threshold
                below = cell_lo[:, axis] <= threshold
                na, nb = int(above.sum()), int(below.sum())
                if 0 < na < n and 0 < nb < n:
                    normal = np.eye(3)[axis]
                    choices.append((max(na, nb) + na + nb - n, axis, float(threshold), above, below, normal))
        if choices:
            _, _, threshold, above, below, normal = min(choices, key=lambda choice: choice[:3])
            return (normal, threshold), ids[above], ids[below]
        points = self.sites[ids]
        centered = points - points.mean(axis=0)
        _, axes = np.linalg.eigh(centered.T @ centered)
        pairs = set()
        for direction in np.vstack((self.directions, axes.T)):
            order = np.argsort(points @ direction, kind="stable")
            for low, high in [(n // 4, 3 * n // 4), (n // 2 - 1, n // 2)]:
                pairs.add(tuple(sorted((int(order[low]), int(order[high])))))
        pairs = sorted(pairs)
        a, b = np.array(pairs).T
        normals, thresholds, above, below = self._classify(ids, a, b, lo, hi)
        columns = np.arange(len(pairs))
        na, nb = above.sum(axis=0), below.sum(axis=0)
        largest, total = np.maximum(na, nb), na + nb
        score = largest + (total - n)
        best = np.lexsort((columns, total, largest, score))[0]
        return (normals[best], thresholds[best]), ids[above[:, best]], ids[below[:, best]]

    @staticmethod
    def _child_box(lo, hi, normal, threshold):
        maximum_terms = np.maximum(normal * lo, normal * hi)
        maximum = maximum_terms.sum()
        lower, upper = lo.copy(), hi.copy()
        for axis, coefficient in enumerate(normal):
            if coefficient > 0:
                lower[axis] = max(lower[axis], (threshold - (maximum - maximum_terms[axis])) / coefficient)
            elif coefficient < 0:
                upper[axis] = min(upper[axis], (threshold - (maximum - maximum_terms[axis])) / coefficient)
        return lower, upper

    def _build(self, ids, depth, lo, hi):
        fallback = ids[0]
        ids = ids[np.all((self.cell_hi[ids] >= lo) & (self.cell_lo[ids] <= hi), axis=1)]
        if not len(ids) or np.any(lo > hi):
            # This branch has no reachable point in its ancestor region.
            self.leaf_depths.append(depth)
            return -(int(fallback) + 2)
        if 2 < len(ids) <= 32:
            corners = lo + self.corners * (hi - lo)
            distance = np.sum((self.sites[ids, None, :] - corners) ** 2, axis=2)
            # Distance differences are affine. If another site is closer at
            # every box corner, this site cannot win anywhere in the box.
            dominated = np.all(distance[:, None, :] < distance[None, :, :], axis=2).any(axis=0)
            ids = ids[~dominated]
        if len(ids) <= 8:
            return self._small_tree(ids, depth, lo, hi)
        (normal, threshold), above, below = self._split(ids, lo, hi)
        reference = len(self.tree["weights"]) + 1
        self.tree["weights"].append(normal.tolist())
        self.tree["thresholds"].append(float(threshold))
        self.tree["children"].append(None)
        now = time.perf_counter()
        if now >= self.next_progress:
            print(f"  {reference:,} decision nodes constructed...", flush=True)
            self.next_progress = now + 5
        upper_box = self._child_box(lo, hi, normal, threshold)
        lower_box = self._child_box(lo, hi, -normal, -threshold)
        self.tree["children"][reference - 1] = [self._build(above, depth + 1, *upper_box), self._build(below, depth + 1, *lower_box)]
        return reference

    def locate(self, x, y, z):
        return locate(self.tree, x, y, z)
