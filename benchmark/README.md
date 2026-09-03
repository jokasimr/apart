# Decision-tree benchmarks

The benchmark compares three implementations of the same full binary trees:

- `extension`: the generic `decision_tree` scalar function;
- `sql`: a generated nested `CASE` expression;
- `standalone`: a C++ traversal with no DuckDB dependency.

Every point has three `FLOAT` features. Tree coefficients and thresholds are `FLOAT`, leaves are consecutive
`INTEGER` values, and tree depths are 3, 5, 7, and 10. All implementations use the same deterministic points and
trees. The standalone evaluator uses the same depth-first tree layout and feature-major input layout as the extension.

Setup is outside the timed regions. DuckDB points are materialized in a table, while the standalone points are
materialized in memory. Timed runs evaluate all rows and sum the resulting leaf values. The harness checks the
extension row-by-row against SQL on 100,000 rows and requires stable, matching full-result checksums from all three
implementations.

Both DuckDB implementations run in one single-threaded process and are randomized together within each round. The
standalone depths are randomized within a separate process. The harness performs two warmup rounds and reports the
median and median absolute deviation over twenty-one measured rounds.

Run from the repository root:

```sh
python3 benchmark/run_benchmarks.py --duckdb build/release/duckdb
```

To measure only the extension implementation:

```sh
python3 benchmark/run_extension_benchmark.py --duckdb build/release/duckdb
```

The small-feature benchmark measures balanced trees with one, two, and three `FLOAT` features at depths 3, 5, 7,
and 9:

```sh
python3 benchmark/run_small_feature_benchmark.py --duckdb build/release/duckdb
```

The output-encoding benchmark compares the dictionary and flat output paths immediately below and above the leaf-count
threshold. It uses near-identical variable-depth trees with 1,023 and 1,025 leaves, plus a 1,024-leaf equal-depth
control. It measures both `FLOAT` leaves and `STRUCT` leaves containing a three-element `FLOAT` list:

```sh
python3 benchmark/run_output_encoding_benchmark.py --duckdb build/release/duckdb
```

The micro-batching experiment is a separate, self-contained C++ benchmark with no DuckDB dependency:

```sh
c++ -O3 -DNDEBUG -std=c++17 -Wall -Wextra -pedantic \
    benchmark/microbatch.cpp -o build/benchmark/microbatch
build/benchmark/microbatch 10000000 2 21 20260902
```

The two-key equality-join benchmark creates 10,000- and 30,000-row lookup tables with unique composite `INTEGER`
keys. Ten million event rows each match exactly one lookup row. Table construction, statistics collection, and
correctness checks are outside the timed region; the timed query performs the join and sums the lookup payload.

```sh
python3 benchmark/run_join_benchmark.py --duckdb build/release/duckdb
```
