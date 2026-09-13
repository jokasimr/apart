"""Bounded 3D Voronoi cells and compact polyhedral mesh connectivity."""

import numpy as np
from scipy.spatial import ConvexHull, Voronoi


def tube(x, width):
    phase = 2 * np.pi * (x - 0.5) / width
    return 4 + 1.55 * np.sin(phase), 3 + 1.15 * np.cos(phase)


def bounded_voronoi(sites, bounds):
    initial = Voronoi(sites)
    mirrors = []
    for site, region_id in zip(sites, initial.point_region):
        region = initial.regions[region_id]
        vertices = initial.vertices[region] if -1 not in region else None
        for axis, limit in enumerate(bounds):
            for side in (0.0, limit):
                crosses = vertices is None or (vertices[:, axis].min() < 0 if side == 0 else vertices[:, axis].max() > limit)
                if crosses:
                    mirrored = site.copy()
                    mirrored[axis] = 2 * side - mirrored[axis]
                    mirrors.append(mirrored)
    # A reflected site cannot beat its original inside the box. Reflecting
    # boundary-crossing cells therefore clips the diagram to the box faces.
    del initial
    diagram = Voronoi(np.vstack((sites, mirrors)))
    regions = [diagram.regions[i] for i in diagram.point_region[:len(sites)]]
    if any(not region or -1 in region for region in regions):
        raise RuntimeError("A real cell was not bounded by the reflected sites")
    return diagram, regions


def make_sites(count, bounds, seed):
    rng = np.random.default_rng(seed)
    accepted = []
    while len(accepted) < count:
        points = rng.uniform(np.zeros(3), bounds, size=(65536, 3))
        cy, cz = tube(points[:, 0], bounds[0])
        radius2 = (points[:, 1] - cy) ** 2 + (points[:, 2] - cz) ** 2
        density = 0.12 + 0.88 * np.exp(-0.5 * radius2 / 0.65 ** 2)
        accepted.extend(points[rng.random(len(points)) < density])
    sites = np.array(accepted[:count])
    diagram, regions = bounded_voronoi(sites, bounds)
    # One inexpensive smoothing pass towards each cell's vertex mean.
    sites += 0.7 * (np.array([diagram.vertices[r].mean(axis=0) for r in regions]) - sites)
    return sites[np.lexsort((sites[:, 2], sites[:, 1], sites[:, 0]))]


def make_mesh(sites, bounds):
    diagram, regions = bounded_voronoi(sites, bounds)
    count = len(sites)
    faces, owners, neighbor_pairs = [], [], []
    for (a, b), face in zip(diagram.ridge_points, diagram.ridge_vertices):
        if a >= count and b >= count:
            continue
        if -1 in face or len(face) < 3:
            raise RuntimeError("An unbounded face touches a real cell")
        if a >= count:
            a, b = b, a
        faces.append(face)
        owners.append((int(a), int(b) if b < count else -1))
        neighbor_pairs.append((a, b))

    # Keep only vertices used by real cells and remap face/cell connectivity.
    used = np.unique(np.concatenate(regions))
    remap = np.full(len(diagram.vertices), -1, dtype=np.int32)
    remap[used] = np.arange(len(used))
    vertices = np.clip(diagram.vertices[used], np.zeros(3), bounds)
    cells = [remap[region] for region in regions]
    owners = np.asarray(owners, dtype=np.int32)
    lengths = np.array([len(face) for face in faces], dtype=np.int32)
    face_offsets = np.r_[0, np.cumsum(lengths)]
    face_vertices = remap[np.concatenate(faces)]
    face_ids = np.repeat(np.arange(len(faces)), lengths)
    points = vertices[face_vertices]
    centers = np.add.reduceat(points, face_offsets[:-1]) / lengths[:, None]
    pairs = np.array(neighbor_pairs)
    normals = diagram.points[pairs[:, 1]] - diagram.points[pairs[:, 0]]
    normals /= np.linalg.norm(normals, axis=1)[:, None]
    axis = np.eye(3)[np.argmin(np.abs(normals), axis=1)]
    u = np.cross(normals, axis)
    u /= np.linalg.norm(u, axis=1)[:, None]
    v = np.cross(normals, u)
    centered = points - centers[face_ids]
    angles = np.arctan2(np.sum(centered * v[face_ids], axis=1), np.sum(centered * u[face_ids], axis=1))
    # Counterclockwise order viewed from outside the first owning cell.
    face_vertices = face_vertices[np.lexsort((angles, face_ids))]
    cell_offsets = np.r_[0, np.cumsum([len(cell) for cell in cells])]
    cell_vertices = np.concatenate(cells).astype(np.int32)
    volumes = np.array([ConvexHull(vertices[cell]).volume for cell in cells])
    return {
        "sites": sites, "bounds": np.array(bounds), "vertices": vertices,
        "face_offsets": face_offsets, "face_vertices": face_vertices, "face_cells": owners,
        "cell_offsets": cell_offsets, "cell_vertices": cell_vertices, "volumes": volumes,
    }


def cell_points(mesh):
    offsets = mesh["cell_offsets"]
    return [mesh["vertices"][mesh["cell_vertices"][a:b]] for a, b in zip(offsets[:-1], offsets[1:])]


def section(mesh, cells, axis, value):
    other = [i for i in range(3) if i != axis]
    polygons, ids = [], []
    for cell_id, vertices in enumerate(cells):
        distances = vertices[:, axis] - value
        if distances.min() >= 0 or distances.max() <= 0:
            continue
        triangles = ConvexHull(vertices).simplices
        edges = triangles[:, [[0, 1], [1, 2], [2, 0]]].reshape(-1, 2)
        da, db = distances[edges[:, 0]], distances[edges[:, 1]]
        edges = edges[da * db < 0]
        da, db = distances[edges[:, 0]], distances[edges[:, 1]]
        points = vertices[edges[:, 0]] + (da / (da - db))[:, None] * (vertices[edges[:, 1]] - vertices[edges[:, 0]])
        points = np.vstack((points, vertices[distances == 0]))[:, other]
        hull = ConvexHull(points)
        polygons.append(points[hull.vertices])
        ids.append(cell_id)
    return polygons, np.array(ids)
