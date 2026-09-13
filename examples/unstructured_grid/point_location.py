"""Greedy affine point location for a rectangular Voronoi grid.

Split clipped polygons using a small set of candidate bisectors and export the
chosen tree directly. Geometry and point queries use ordinary double precision.
"""

from __future__ import annotations

import math
import time

import numpy as np


def area(polygon):
    if len(polygon) < 3:
        return 0.0
    p = polygon - polygon[0]
    q = np.roll(p, -1, axis=0)
    return abs(float(np.sum(p[:, 0] * q[:, 1] - q[:, 0] * p[:, 1]))) / 2


def centroid(polygon):
    origin = polygon[0]
    p = polygon - origin
    q = np.roll(p, -1, axis=0)
    cross = p[:, 0] * q[:, 1] - q[:, 0] * p[:, 1]
    return origin + np.sum((p + q) * cross[:, None], axis=0) / (3 * cross.sum())


def clip(polygon, normal, threshold):
    """Clip a convex polygon to normal @ point >= threshold for planning."""
    distances = polygon @ normal - threshold
    result = []
    for i, current in enumerate(polygon):
        previous = polygon[i - 1]
        dc, dp = distances[i], distances[i - 1]
        if (dc >= 0) != (dp >= 0):
            result.append(previous + (dp / (dp - dc)) * (current - previous))
        if dc >= 0:
            result.append(current)
    return np.asarray(result, dtype=float).reshape(-1, 2)


def bisector(sites, a, b):
    """The above branch is closer to b; the below branch is closer to a."""
    normal = sites[b] - sites[a]
    normal = normal / np.linalg.norm(normal)
    return normal, float(normal @ ((sites[a] + sites[b]) / 2))


def locate(tree, x, y):
    """Query a saved tree using the same double coefficients as the SQL export."""
    if x is None or y is None:
        return None
    x, y = float(x), float(y)
    reference = 1
    while reference > 0:
        node = reference - 1
        wx, wy = tree["weights"][node]
        above = wx * x + wy * y >= tree["thresholds"][node]
        reference = tree["children"][node][0 if above else 1]
    return tree["values"][-reference - 1]


class PointLocationTree:
    """Build a greedy BSP, optionally choosing among deterministic variants."""

    def __init__(self, sites, polygons, width, height, *, attempts=1):
        started = time.perf_counter()
        self.sites = np.asarray(sites, dtype=float)
        if self.sites.ndim != 2 or self.sites.shape[1] != 2 or not len(self.sites):
            raise ValueError("sites must be a nonempty N by 2 array")
        if not np.isfinite(self.sites).all() or not (math.isfinite(width) and math.isfinite(height)):
            raise ValueError("coordinates must be finite")
        if width <= 0 or height <= 0 or np.any(self.sites < 0) or np.any(self.sites > [width, height]):
            raise ValueError("sites must lie inside the positive rectangle")
        if len(np.unique(self.sites, axis=0)) != len(self.sites):
            raise ValueError("sites must be distinct")
        polygons = [np.asarray(p, dtype=float) for p in polygons]
        if len(polygons) != len(self.sites) or any(
            p.ndim != 2 or p.shape[1] != 2 or len(p) < 3 or not np.isfinite(p).all() or area(p) <= 0
            for p in polygons
        ):
            raise ValueError("provide one finite positive-area convex polygon per site")
        if not isinstance(attempts, int) or attempts < 1:
            raise ValueError("attempts must be a positive integer")

        best, runs = None, []
        for attempt in range(attempts):
            run_started = time.perf_counter()
            penalty = (1.0, 0.3, 0.6)[attempt % 3]
            angles = np.arange(6) * np.pi / 6 + (2 - attempt) * np.pi / 24
            directions = np.column_stack((np.cos(angles), np.sin(angles)))
            self.tree = {
                "weights": [[1.0, 0.0], [-1.0, 0.0], [0.0, 1.0], [0.0, -1.0]],
                "thresholds": [0.0, -float(width), 0.0, -float(height)],
                "children": [[2, -1], [3, -1], [4, -1], [0, -1]],
                "values": [None, *range(len(self.sites))],
            }
            self.leaf_depths, self.weighted_depth = [], 0.0
            self.tree["children"][3][0] = self._build(list(enumerate(polygons)), 4, directions, penalty)
            depth, nodes = max(self.leaf_depths) - 4, len(self.tree["weights"]) - 4
            runs.append({"attempt": attempt + 1, "fragmentation_penalty": penalty,
                         "spatial_depth": depth, "spatial_internal_nodes": nodes,
                         "seconds": time.perf_counter() - run_started})
            key = depth, nodes
            if best is None or key < best[0]:
                best = key, self.tree, self.leaf_depths, self.weighted_depth, attempt + 1
        _, self.tree, self.leaf_depths, self.weighted_depth, selected = best
        self.construction = {
            "algorithm": "greedy BSP with balanced, fragmentation-aware splits",
            "attempts": runs,
            "selected_attempt": selected,
            "selection": "minimum maximum depth, then node count",
            "build_seconds": time.perf_counter() - started,
        }

    def _choose_split(self, fragments, directions, penalty):
        ids = np.array([cell_id for cell_id, _ in fragments])
        n = len(ids)
        vertices = np.concatenate([p for _, p in fragments])
        lengths = np.array([len(p) for _, p in fragments])
        offsets = np.cumsum(np.r_[0, lengths[:-1]])
        if n <= 8:
            pairs = [(a, b) for a in range(n) for b in range(a + 1, n)]
        else:
            centers = np.add.reduceat(vertices, offsets) / lengths[:, None]
            centered = centers - centers.mean(axis=0)
            _, axes = np.linalg.eigh(centered.T @ centered)
            pairs = set()
            # Principal axes adapt the fixed directions to elongated regions.
            for direction in np.vstack((directions, axes.T)):
                order = np.argsort(centers @ direction, kind="stable")
                for low, high in [(n // 4, 3 * n // 4), (2 * n // 5, 3 * n // 5), (n // 2 - 1, n // 2)]:
                    pairs.add(tuple(sorted((int(order[low]), int(order[high])))))
            pairs = sorted(pairs)
        a, b = np.array(pairs).T
        normals = self.sites[ids[b]] - self.sites[ids[a]]
        normals /= np.linalg.norm(normals, axis=1)[:, None]
        thresholds = np.sum(normals * ((self.sites[ids[a]] + self.sites[ids[b]]) / 2), axis=1)
        distances = vertices @ normals.T - thresholds
        above = np.maximum.reduceat(distances, offsets) > 0
        below = np.minimum.reduceat(distances, offsets) < 0
        columns = np.arange(len(pairs))
        # A site's cell cannot cross to the opposite side of its own bisector.
        # This also guarantees progress despite rounded planning fragments.
        above[a, columns], below[a, columns] = False, True
        above[b, columns], below[b, columns] = True, False
        na, nb = above.sum(axis=0), below.sum(axis=0)
        largest, total = np.maximum(na, nb), na + nb
        score = largest + penalty * (total - n)
        best = np.lexsort((columns, total, largest, score))[0]
        return normals[best], thresholds[best], above[:, best], below[:, best]

    def _build(self, fragments, depth, directions, penalty):
        if len(fragments) == 1:
            cell_id, polygon = fragments[0]
            self.leaf_depths.append(depth)
            self.weighted_depth += depth * area(polygon)
            return -(cell_id + 2)

        normal, threshold, has_above, has_below = self._choose_split(fragments, directions, penalty)
        above, below = [], []
        for i, (cell_id, polygon) in enumerate(fragments):
            if not has_above[i]:
                below.append((cell_id, polygon))
            elif not has_below[i]:
                above.append((cell_id, polygon))
            else:
                for branch, sign in [(above, 1), (below, -1)]:
                    part = clip(polygon, sign * normal, sign * threshold)
                    if area(part) > 0:
                        branch.append((cell_id, part))
        # The defining cells go to opposite branches, guaranteeing progress.
        if not (0 < len(above) < len(fragments) and 0 < len(below) < len(fragments)):
            raise ValueError("A bisector did not separate its candidate cells")
        reference = len(self.tree["weights"]) + 1
        self.tree["weights"].append(normal.tolist())
        self.tree["thresholds"].append(float(threshold))
        self.tree["children"].append(None)
        upper = self._build(above, depth + 1, directions, penalty)
        lower = self._build(below, depth + 1, directions, penalty)
        self.tree["children"][reference - 1] = [upper, lower]
        return reference

    def locate(self, x, y):
        return locate(self.tree, x, y)
