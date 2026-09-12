# Benchmarks

`run_matrix.py` measures `decision_tree` with feature counts 1–10, 20, and 100 and maximum depths 1–10. It covers both fixed-depth trees and variable-depth trees.

Feature counts 1–5 use 20,000,000 rows per case, 6–10 use 10,000,000 rows, 20 uses 4,000,000 rows, and 100 uses 700,000 rows. This keeps the inexpensive cases long enough to produce a useful signal while keeping the most expensive cases near half a second. The four row-count groups also map directly to four shared input tables; row counts do not vary by tree shape or depth. `--rows` provides a uniform override for quick local checks.

Fixed trees always traverse exactly `D` nodes. In variable trees, approximately half the rows stop at `D-1` and half at `D`, keeping the transition from fully active to partially active lanes deliberate and repeatable. A genuinely variable-depth tree cannot have maximum depth 1, so those cells are recorded as not applicable rather than silently substituting a fixed-depth tree.

The runner uses deterministic feature data and tree weights, prepares every query before profiling, executes with one DuckDB thread, shuffles cases each round, and verifies result checksums. The baseline and candidate revisions run in a balanced baseline/candidate/candidate/baseline order to limit time-dependent bias. It stores every timing sample as JSON, writes a CSV comparison, and generates the static benchmark page.

For a small local check against another build:

```sh
python3 benchmark/run_matrix.py \
  --duckdb-binary /path/to/duckdb \
  --extension ./build/release/extension/apart/apart.duckdb_extension \
  --baseline-extension /path/to/baseline/apart.duckdb_extension \
  --revision HEAD \
  --baseline-revision HEAD^ \
  --output ./benchmark-results \
  --features 1,2 \
  --depths 1,2 \
  --rows 10000 \
  --warmups 1 \
  --runs 3
```

Omit `--baseline-extension` and `--baseline-revision` to generate results without a comparison.

The benchmark workflow runs after the existing extension build completes on `main`. It compares that build with the exact extension saved by the most recent successful benchmark workflow, loading both into the official DuckDB v1.5.4 shell. It builds nothing. Each results artifact includes the candidate extension so it can become the next baseline. When no baseline is available, the workflow publishes the candidate measurements without a comparison.

Published results are kept in the `benchmark-history` branch and served through GitHub Pages. The dashboard lists one result per revision; selecting a revision opens its report, which links back to the dashboard. Re-running a revision replaces its published result. The workflow creates the branch automatically on its first run.
