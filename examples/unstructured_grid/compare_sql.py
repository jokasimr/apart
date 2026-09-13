"""Compare apart, nested CASE, and a spatial join on the same 2D points."""

import argparse
import csv
import hashlib
import io
import json
import os
from pathlib import Path
import statistics
import subprocess
import sys

sys.dont_write_bytecode = True
DIRECTORY = Path(__file__).resolve().parent
ROOT = DIRECTORY.parents[1]
sys.path.insert(0, str(ROOT / "benchmark"))
from run_matrix import parse_json_stream
from sql_case import case_sql


def walk(node):
    yield node
    for child in node.get("children", []):
        yield from walk(child)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rows", type=int, default=1_000_000)
    parser.add_argument("--warmups", type=int, default=2)
    parser.add_argument("--repeats", type=int, default=5)
    parser.add_argument("--spatial-extension", type=Path, required=True)
    parser.add_argument("--output", type=Path, default=DIRECTORY / "comparison.json")
    args = parser.parse_args()
    binary = ROOT / "build/release/duckdb"
    apart = ROOT / "build/release/extension/apart/apart.duckdb_extension"
    tree = json.loads((DIRECTORY / "tree.json").read_text())
    tree_sql = (DIRECTORY / "grid.sql").read_text().replace("LOAD apart;", "")
    join_sql = (DIRECTORY / "spatial_join.sql").read_text().replace("LOAD spatial;", "")
    spatial_path = str(args.spatial_extension.resolve()).replace("'", "''")
    queries = {
        "apart": "SELECT sum(locate_cell(x,y))::HUGEINT FROM points",
        "case": "SELECT sum(locate_cell_sql(x,y))::HUGEINT FROM points",
        "spatial": "SELECT sum(cell_id)::HUGEINT FROM locate_cells_spatial('points')",
    }
    setup = f"""
.mode csv
.headers off
.bail on
LOAD '{apart}';
LOAD '{spatial_path}';
SET threads=1;
SET preserve_insertion_order=false;
PRAGMA disable_progress_bar;
{tree_sql}
{case_sql(tree)}
{join_sql}
CREATE TABLE points AS
SELECT i AS id,
       (hash(i+20260912)%9007199254740992)::DOUBLE * (12.0/9007199254740992) AS x,
       (hash(i+10000019)%9007199254740992)::DOUBLE * (8.0/9007199254740992) AS y
FROM range({args.rows}) t(i);
"""
    for name, query in queries.items():
        setup += f"PREPARE lookup_{name} AS {query};\n"
    setup += "PRAGMA enable_profiling='json';\n"
    order = []
    for repeat in range(args.warmups + args.repeats):
        names = list(queries)
        names = names[repeat % len(names):] + names[:repeat % len(names)]
        order.extend((name, repeat >= args.warmups) for name in names)
    sql = setup + "".join(f"EXECUTE lookup_{name};\n" for name, _ in order)
    # Compare row results as part of the benchmark, outside the timed runs.
    sql += "PRAGMA disable_profiling;\n"
    sql += """
SELECT 'case_differences', count(*)
FROM points WHERE locate_cell(x,y) IS DISTINCT FROM locate_cell_sql(x,y);
SELECT 'spatial_differences', count(*)
FROM locate_cells_spatial('points') WHERE cell_id IS DISTINCT FROM locate_cell(x,y);
SELECT 'spatial_rows', count(*) FROM locate_cells_spatial('points');
"""
    prefix = args.output.with_suffix("")
    prefix.with_suffix(".sql").write_text(sql)
    available = sorted(os.sched_getaffinity(0))
    cpu = 2 if 2 in available else available[0]
    print(f"Comparing {len(queries)} queries over {args.rows:,} points...", flush=True)
    process = subprocess.run(
        ["taskset", "-c", str(cpu), str(binary), "-unsigned", "-batch"],
        input=sql, text=True, capture_output=True, cwd=ROOT, timeout=600,
    )
    prefix.with_suffix(".stdout").write_text(process.stdout)
    prefix.with_suffix(".profiles.json").write_text(process.stderr)
    if process.returncode:
        raise RuntimeError(process.stderr[-4000:])
    profiles = parse_json_stream(process.stderr)
    output = list(csv.reader(io.StringIO(process.stdout)))
    if len(profiles) != len(order) or len(output) != len(order) + 3:
        raise RuntimeError("Unexpected number of benchmark results")
    samples = {name: [] for name in queries}
    checksums = {name: set() for name in queries}
    operators = {}
    for (name, measured), profile, row in zip(order, profiles, output):
        checksums[name].add(row[0])
        operators[name] = sorted({n.get("operator_name", "").strip() for n in walk(profile)} - {""})
        if measured:
            samples[name].append(profile["latency"] * 1e9 / args.rows)
    comparisons = {row[0]: int(row[1]) for row in output[len(order):]}
    result = {
        "rows": args.rows, "warmups": args.warmups, "repeats": args.repeats,
        "threads": 1, "distribution": "unsorted uniform points in [0,12) x [0,8)",
        "duckdb_version": subprocess.check_output([str(binary), "-version"], text=True).strip(),
        "tree_sha256": hashlib.sha256((DIRECTORY / "tree.json").read_bytes()).hexdigest(),
        "apart_sha256": hashlib.sha256(apart.read_bytes()).hexdigest(),
        "spatial_sha256": hashlib.sha256(args.spatial_extension.read_bytes()).hexdigest(),
        "queries": queries, "checksums": {name: sorted(v) for name, v in checksums.items()},
        "comparisons": comparisons, "operators": operators,
        "samples_ns_per_row": samples,
        "median_ns_per_row": {name: statistics.median(v) for name, v in samples.items()},
        "notes": "Full prepared-query wall time, including scan and sum. Loading and preparation excluded. "
                 "Spatial join includes its temporary index construction. All queries start from x,y. "
                 "Execution order varies between runs.",
    }
    args.output.write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps(result, indent=2), flush=True)


if __name__ == "__main__":
    main()
