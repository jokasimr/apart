# Decision-tree benchmark results

Measured on 2026-09-03 with DuckDB v1.5.4 on an Intel Xeon W-2265. Each measurement evaluates 10,000,000 points with
three `FLOAT` features and sums the `INTEGER` leaves. Results are medians over 21 measured rounds after two warmups;
MAD is the median absolute deviation. All correctness checks and cross-implementation checksums matched.

| Method | Depth | Median (ms) | MAD (ms) | ns/row |
|:---|---:|---:|---:|---:|
| Extension baseline | 3 | 240.00 | 3.00 | 24.00 |
| Extension baseline | 5 | 379.00 | 10.00 | 37.90 |
| Extension baseline | 7 | 526.00 | 6.00 | 52.60 |
| Extension baseline | 10 | 729.00 | 7.00 | 72.90 |
| SQL `CASE` | 3 | 428.00 | 4.00 | 42.80 |
| SQL `CASE` | 5 | 878.00 | 8.00 | 87.80 |
| SQL `CASE` | 7 | 1,877.00 | 22.00 | 187.70 |
| SQL `CASE` | 10 | 3,811.00 | 31.00 | 381.10 |
| Standalone C++ | 3 | 107.45 | 0.33 | 10.74 |
| Standalone C++ | 5 | 221.63 | 1.72 | 22.16 |
| Standalone C++ | 7 | 339.18 | 2.13 | 33.92 |
| Standalone C++ | 10 | 565.37 | 5.62 | 56.54 |

## Baseline profiling

DuckDB's operator profiler attributes 703.6 ms of a representative 720.6 ms depth-10 extension execution to the
projection containing `decision_tree`. The aggregate accounts for 13.0 ms and the table scan for 4.0 ms. The query
pipeline outside the scalar function is therefore a small part of the extension time.

Generated assembly shows the main difference from standalone C++:

- DuckDB's bounds-checked `vector` indexing remains inside the extension's node and feature loops.
- Every feature access walks from the `DataChunk` through a 104-byte DuckDB `Vector` object to its data pointer.
- Dimensionality is runtime-generic, so the compiler leaves the extension's three-feature affine calculation as a loop.
- The standalone evaluator receives three raw feature pointers, and the compiler expands its three iterations into
  straight-line scalar loads and arithmetic.

At depth 10, the extension takes 16.36 ns/row more than standalone C++. The measured DuckDB scan and aggregate account
for about 1.7 ns/row of that difference; the rest is in the evaluator projection. Hardware performance counters were
not available on the host, so this diagnosis uses DuckDB operator timing and generated assembly rather than inferred
cache or branch-miss counts.

The SQL implementation spends 3.78 seconds of a representative depth-10 run in its main projection. Its nested
`CASE` form incurs substantially more vector-expression and selection work as the generated expression grows, making
it slower than both direct traversal implementations at every tested depth.

## Optimized DuckDB extension

The optimized three-feature evaluator obtains the input pointers once per chunk, stores the three coefficients inside
each compiled node, and advances blocks of eight rows. Equal-depth trees use a fixed-depth loop, while the same
extension still supports arbitrary topology through an active-lane loop. Both versions below were measured in
isolated single-threaded processes using the extension-only harness. Each value is the median of 21 runs over
10,000,000 rows after two warmups.

| Depth | Baseline ns/row | Optimized ns/row | Optimized MAD (ms) | Speedup |
|---:|---:|---:|---:|---:|
| 3 | 20.60 | 5.60 | 0.00 | 3.68x |
| 5 | 33.20 | 7.90 | 1.00 | 4.20x |
| 7 | 47.90 | 10.60 | 1.00 | 4.52x |
| 10 | 68.60 | 12.70 | 1.00 | 5.40x |

## Minimal C++ micro-batching experiment

This isolated benchmark contains no DuckDB code. It uses balanced heap-layout trees, three-float points, nodes with
three float weights and one float bias, integer node indices, and fixed-depth traversal. The block variants differ
from the row-wise implementation only by advancing 8, 16, 32, or 64 independent points one level at a time. Their
per-lane bodies are expanded at compile time.

All five methods were randomized together within every round. Each number is the median of 21 measurements of
10,000,000 points after two warmups; MAD is the median absolute deviation. All checksums matched.

| Block | Depth | Median (ms) | MAD (ms) | ns/row | Speedup |
|---:|---:|---:|---:|---:|---:|
| 1 | 3 | 62.56 | 0.78 | 6.26 | 1.00x |
| 8 | 3 | 35.34 | 0.34 | 3.53 | 1.77x |
| 16 | 3 | 38.14 | 0.31 | 3.81 | 1.64x |
| 32 | 3 | 51.37 | 0.41 | 5.14 | 1.22x |
| 64 | 3 | 55.65 | 0.69 | 5.57 | 1.12x |
| 1 | 5 | 134.24 | 1.07 | 13.42 | 1.00x |
| 8 | 5 | 53.89 | 0.28 | 5.39 | 2.49x |
| 16 | 5 | 58.29 | 0.78 | 5.83 | 2.30x |
| 32 | 5 | 76.50 | 0.92 | 7.65 | 1.75x |
| 64 | 5 | 82.74 | 0.77 | 8.27 | 1.62x |
| 1 | 7 | 216.01 | 2.30 | 21.60 | 1.00x |
| 8 | 7 | 74.59 | 0.92 | 7.46 | 2.90x |
| 16 | 7 | 77.64 | 0.89 | 7.76 | 2.78x |
| 32 | 7 | 100.65 | 0.83 | 10.06 | 2.15x |
| 64 | 7 | 109.54 | 0.76 | 10.95 | 1.97x |
| 1 | 10 | 356.99 | 7.64 | 35.70 | 1.00x |
| 8 | 10 | 102.32 | 0.92 | 10.23 | 3.49x |
| 16 | 10 | 106.66 | 0.78 | 10.67 | 3.35x |
| 32 | 10 | 138.52 | 1.68 | 13.85 | 2.58x |
| 64 | 10 | 149.18 | 1.36 | 14.92 | 2.39x |

### Recursively 70/30 tree shapes

The unbalanced trees use the same internal-node counts as the depth-3/5/7/10 balanced trees. At every internal node,
the remaining internal-node budget is divided 70/30 between its children, with the heavy side randomized. Both the
row-wise and micro-batched evaluators use the same explicit child references and terminate each point independently.

| Block | Balanced-equivalent depth | Median (ms) | MAD (ms) | ns/row | Speedup |
|---:|---:|---:|---:|---:|---:|
| 1 | 3 | 70.31 | 0.50 | 7.03 | 1.00x |
| 8 | 3 | 48.52 | 0.30 | 4.85 | 1.45x |
| 16 | 3 | 56.97 | 0.48 | 5.70 | 1.23x |
| 32 | 3 | 66.83 | 0.57 | 6.68 | 1.05x |
| 64 | 3 | 76.39 | 0.35 | 7.64 | 0.92x |
| 1 | 5 | 146.85 | 0.95 | 14.69 | 1.00x |
| 8 | 5 | 81.31 | 0.40 | 8.13 | 1.81x |
| 16 | 5 | 93.78 | 0.59 | 9.38 | 1.57x |
| 32 | 5 | 107.62 | 0.66 | 10.76 | 1.36x |
| 64 | 5 | 122.66 | 1.07 | 12.27 | 1.20x |
| 1 | 7 | 245.52 | 2.79 | 24.55 | 1.00x |
| 8 | 7 | 113.94 | 0.73 | 11.39 | 2.15x |
| 16 | 7 | 126.38 | 0.87 | 12.64 | 1.94x |
| 32 | 7 | 141.42 | 0.59 | 14.14 | 1.74x |
| 64 | 7 | 162.31 | 1.02 | 16.23 | 1.51x |
| 1 | 10 | 351.87 | 2.19 | 35.19 | 1.00x |
| 8 | 10 | 142.90 | 0.96 | 14.29 | 2.46x |
| 16 | 10 | 158.63 | 0.85 | 15.86 | 2.22x |
| 32 | 10 | 176.25 | 1.32 | 17.63 | 2.00x |
| 64 | 10 | 200.19 | 1.03 | 20.02 | 1.76x |
