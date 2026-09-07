#!/usr/bin/env python3

import argparse
import csv
import io
import random
import statistics
import subprocess
from pathlib import Path

from run_benchmarks import TIMER_PATTERN
from run_small_feature_benchmark import (
    make_tree,
    reference_expression,
    tree_literal as integer_tree_literal,
)
from run_struct4_leaf_benchmark import feature_table_sql, tree_literal


DEPTH = 5
DIMENSIONS = 2
LEAF_COUNT = 1 << DEPTH
METHODS = ("direct_struct", "integer_join")


def lookup_table_sql():
    return f"""
CREATE TABLE leaf_lookup AS
SELECT
    i::INTEGER AS leaf_key,
    {{
        v0: (i * 3 + 1)::FLOAT,
        v1: (i * 5 + 2)::FLOAT,
        v2: (i * 7 + 3)::FLOAT,
        v3: (i * 11 + 4)::FLOAT
    }} AS payload
FROM range({LEAF_COUNT}) AS leaves(i);
"""


def build_sql(rows, correctness_rows, warmups, runs, seed):
    tree = make_tree(DEPTH, DIMENSIONS, seed)
    expected_leaf = reference_expression(tree)
    integer_result = "decision_tree(tree_integer(), x0, x1)"
    struct_result = "decision_tree(tree_struct4(), x0, x1)"
    payload_sum = "leaf.v0 + leaf.v1 + leaf.v2 + leaf.v3"

    lines = [
        ".mode csv",
        ".headers off",
        ".echo off",
        "LOAD dtree;",
        "PRAGMA threads=1;",
        "PRAGMA preserve_insertion_order=false;",
        feature_table_sql(rows),
        lookup_table_sql(),
        "ANALYZE features;",
        "ANALYZE leaf_lookup;",
        f"CREATE MACRO tree_integer() AS {integer_tree_literal(tree)};",
        f"CREATE MACRO tree_struct4() AS {tree_literal(tree, 'struct4')};",
        (
            "SELECT 'verify_tree', count(*) FROM "
            f"(SELECT * FROM features LIMIT {correctness_rows}) sample "
            f"WHERE {integer_result} IS DISTINCT FROM {expected_leaf};"
        ),
        (
            "SELECT 'verify_join', count(l.leaf_key), "
            f"count(*) FILTER (WHERE {struct_result} IS DISTINCT FROM l.payload) "
            f"FROM (SELECT * FROM features LIMIT {correctness_rows}) sample "
            f"LEFT JOIN leaf_lookup l ON {integer_result} = l.leaf_key;"
        ),
        (
            "SELECT 'encoding', min(kind), max(kind), count(DISTINCT kind) FROM "
            f"(SELECT vector_type({integer_result}) AS kind FROM features LIMIT 4096);"
        ),
        (
            "PREPARE direct_struct AS SELECT 'direct_struct', "
            f"sum({payload_sum})::DOUBLE FROM "
            f"(SELECT {struct_result} AS leaf FROM features);"
        ),
        (
            "PREPARE integer_join AS SELECT 'integer_join', "
            "sum(l.payload.v0 + l.payload.v1 + l.payload.v2 + l.payload.v3)::DOUBLE "
            "FROM features f JOIN leaf_lookup l "
            "ON decision_tree(tree_integer(), f.x0, f.x1) = l.leaf_key;"
        ),
        ".timer on",
    ]

    executions = []
    ordering = random.Random(seed)
    for phase, rounds in (("warmup", warmups), ("measured", runs)):
        for _ in range(rounds):
            methods = list(METHODS)
            ordering.shuffle(methods)
            for method in methods:
                executions.append((phase, method))
                lines.append(f"EXECUTE {method};")
    lines.append(".timer off")
    return "\n".join(lines) + "\n", executions


def median_absolute_deviation(values):
    center = statistics.median(values)
    return statistics.median(abs(value - center) for value in values)


def main():
    parser = argparse.ArgumentParser(
        description="Compare direct STRUCT leaves with integer leaves joined to a payload table"
    )
    parser.add_argument("--duckdb", type=Path, required=True)
    parser.add_argument("--rows", type=int, default=10_000_000)
    parser.add_argument("--correctness-rows", type=int, default=100_000)
    parser.add_argument("--warmups", type=int, default=3)
    parser.add_argument("--runs", type=int, default=31)
    parser.add_argument("--seed", type=int, default=20_260_903)
    parser.add_argument("--timeout", type=int, default=1800)
    args = parser.parse_args()
    if not args.duckdb.is_file():
        parser.error(f"DuckDB executable does not exist: {args.duckdb}")

    sql, executions = build_sql(
        args.rows, args.correctness_rows, args.warmups, args.runs, args.seed
    )
    process = subprocess.run(
        [str(args.duckdb), "-batch"],
        input=sql,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        timeout=args.timeout,
        check=False,
    )
    if process.returncode:
        raise RuntimeError(process.stdout + "\n" + process.stderr)

    tree_mismatches = None
    join_matches = None
    join_mismatches = None
    encoding = None
    checksums = {method: set() for method in METHODS}
    for record in csv.reader(io.StringIO(process.stdout)):
        if len(record) == 2 and record[0] == "verify_tree":
            tree_mismatches = int(record[1])
        elif len(record) == 3 and record[0] == "verify_join":
            join_matches = int(record[1])
            join_mismatches = int(record[2])
        elif len(record) == 4 and record[0] == "encoding":
            encoding = (record[1], record[2], int(record[3]))
        elif len(record) == 2 and record[0] in checksums:
            checksums[record[0]].add(record[1])

    if tree_mismatches != 0:
        raise RuntimeError(f"tree correctness check failed: {tree_mismatches}")
    if join_matches != args.correctness_rows or join_mismatches != 0:
        raise RuntimeError(
            f"join correctness check failed: matches={join_matches}, mismatches={join_mismatches}"
        )
    expected_encoding = ("FLAT_VECTOR", "FLAT_VECTOR", 1)
    if encoding != expected_encoding:
        raise RuntimeError(f"unexpected integer-leaf encoding: {encoding}")
    if any(len(values) != 1 for values in checksums.values()):
        raise RuntimeError(f"unstable checksums: {checksums}")
    if checksums["direct_struct"] != checksums["integer_join"]:
        raise RuntimeError(f"different checksums: {checksums}")

    timings = [float(match.group(1)) for match in TIMER_PATTERN.finditer(process.stdout)]
    if len(timings) != len(executions):
        raise RuntimeError(f"expected {len(executions)} timings, found {len(timings)}")
    samples = {method: [] for method in METHODS}
    for (phase, method), elapsed in zip(executions, timings):
        if phase == "measured":
            samples[method].append(elapsed)

    print("# Integer-leaf join benchmark")
    print()
    print(
        f"Rows: {args.rows:,}; lookup rows: {LEAF_COUNT}; measured runs: {args.runs}; "
        "DuckDB threads: 1"
    )
    print(f"Checksum: {next(iter(checksums['direct_struct']))}")
    print()
    print("| Method | Median (ms) | MAD (ms) | ns/row |")
    print("|:--|--:|--:|--:|")
    medians = {}
    for method in METHODS:
        center = statistics.median(samples[method])
        medians[method] = center
        dispersion = median_absolute_deviation(samples[method])
        print(
            f"| {method} | {center * 1e3:.2f} | {dispersion * 1e3:.2f} | "
            f"{center * 1e9 / args.rows:.2f} |"
        )
    delta = (medians["integer_join"] - medians["direct_struct"]) * 1e9 / args.rows
    print()
    print(f"Integer join minus direct STRUCT: {delta:+.2f} ns/row")


if __name__ == "__main__":
    main()
