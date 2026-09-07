#!/usr/bin/env python3

import argparse
import csv
import io
import statistics
import subprocess
from pathlib import Path

from run_benchmarks import TIMER_PATTERN, float_literal, list_literal
from run_small_feature_benchmark import make_tree, reference_expression
from run_struct4_leaf_benchmark import feature_table_sql


DEPTH = 5
DIMENSIONS = 2
LEAF_COUNT = 1 << DEPTH
PAYLOAD_MULTIPLIERS = (3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59)


def tree_literal(tree):
    coefficients, thresholds, left_children, right_children = tree
    weight_rows = list_literal(
        list_literal(float_literal(value) for value in row) for row in coefficients
    )
    threshold_values = list_literal(float_literal(value) for value in thresholds)
    child_rows = list_literal(
        f"[{above},{below}]" for above, below in zip(right_children, left_children)
    )
    leaf_count = max(
        -reference
        for reference in (*left_children, *right_children)
        if reference < 0
    )
    values = list_literal(f"{leaf}::TINYINT" for leaf in range(leaf_count))
    return (
        f"{{weights:{weight_rows},thresholds:{threshold_values},children:{child_rows},"
        f"values:{values}}}"
    )


def lookup_table_sql():
    payloads = ", ".join(
        f"(i * {multiplier} + {field + 1})::FLOAT AS p{field}"
        for field, multiplier in enumerate(PAYLOAD_MULTIPLIERS)
    )
    return (
        "CREATE TABLE leaf_lookup AS SELECT i::TINYINT AS leaf_key, "
        f"{payloads} FROM range({LEAF_COUNT}) AS leaves(i);"
    )


def build_sql(rows, correctness_rows, warmups, runs, seed, payload_count):
    tree = make_tree(DEPTH, DIMENSIONS, seed)
    tree_result = "decision_tree(tree_int8(), x0, x1)"
    payload_sum = (
        " + ".join(f"l.p{field}" for field in range(payload_count))
        if payload_count
        else "l.leaf_key"
    )
    query = (
        "SELECT 'result', "
        f"sum({payload_sum})::DOUBLE "
        "FROM features f JOIN leaf_lookup l "
        "ON decision_tree(tree_int8(), f.x0, f.x1) = l.leaf_key"
    )

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
        f"CREATE MACRO tree_int8() AS {tree_literal(tree)};",
        (
            "SELECT 'verify_tree', count(*) FROM "
            f"(SELECT * FROM features LIMIT {correctness_rows}) sample "
            f"WHERE {tree_result} IS DISTINCT FROM ({reference_expression(tree)})::TINYINT;"
        ),
        "SELECT 'unique', count(*), count(DISTINCT leaf_key) FROM leaf_lookup;",
        (
            "SELECT 'encoding', min(kind), max(kind), count(DISTINCT kind) FROM "
            f"(SELECT vector_type({tree_result}) AS kind FROM features LIMIT 4096);"
        ),
        query.replace("'result'", "'correctness'") + ";",
        f"PREPARE benchmark AS {query};",
        ".timer on",
    ]
    phases = ["warmup"] * warmups + ["measured"] * runs
    lines.extend("EXECUTE benchmark;" for _ in phases)
    lines.append(".timer off")
    return "\n".join(lines) + "\n", phases


def median_absolute_deviation(values):
    center = statistics.median(values)
    return statistics.median(abs(value - center) for value in values)


def main():
    parser = argparse.ArgumentParser(
        description="Benchmark flat TINYINT tree leaves joined to 16 FLOAT payloads"
    )
    parser.add_argument("--duckdb", type=Path, required=True)
    parser.add_argument("--rows", type=int, default=10_000_000)
    parser.add_argument("--correctness-rows", type=int, default=100_000)
    parser.add_argument("--warmups", type=int, default=3)
    parser.add_argument("--runs", type=int, default=31)
    parser.add_argument("--payload-count", type=int, default=len(PAYLOAD_MULTIPLIERS))
    parser.add_argument("--seed", type=int, default=20_260_903)
    parser.add_argument("--timeout", type=int, default=1800)
    args = parser.parse_args()
    if not args.duckdb.is_file():
        parser.error(f"DuckDB executable does not exist: {args.duckdb}")
    if not 0 <= args.payload_count <= len(PAYLOAD_MULTIPLIERS):
        parser.error(f"--payload-count must be between 0 and {len(PAYLOAD_MULTIPLIERS)}")

    sql, phases = build_sql(
        args.rows, args.correctness_rows, args.warmups, args.runs, args.seed, args.payload_count
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
    uniqueness = None
    encoding = None
    correctness = None
    checksums = set()
    for record in csv.reader(io.StringIO(process.stdout)):
        if len(record) == 2 and record[0] == "verify_tree":
            tree_mismatches = int(record[1])
        elif len(record) == 3 and record[0] == "unique":
            uniqueness = (int(record[1]), int(record[2]))
        elif len(record) == 4 and record[0] == "encoding":
            encoding = (record[1], record[2], int(record[3]))
        elif len(record) == 2 and record[0] == "correctness":
            correctness = record[1]
        elif len(record) == 2 and record[0] == "result":
            checksums.add(record[1])

    if tree_mismatches != 0:
        raise RuntimeError(f"tree correctness check failed: {tree_mismatches}")
    if uniqueness != (LEAF_COUNT, LEAF_COUNT):
        raise RuntimeError(f"lookup keys are not unique: {uniqueness}")
    expected_encoding = ("FLAT_VECTOR", "FLAT_VECTOR", 1)
    if encoding != expected_encoding:
        raise RuntimeError(f"unexpected tree output encoding: {encoding}")
    if len(checksums) != 1 or checksums != {correctness}:
        raise RuntimeError(f"checksum failure: correctness={correctness}, timed={checksums}")

    timings = [float(match.group(1)) for match in TIMER_PATTERN.finditer(process.stdout)]
    if len(timings) != len(phases):
        raise RuntimeError(f"expected {len(phases)} timings, found {len(timings)}")
    samples = [elapsed for phase, elapsed in zip(phases, timings) if phase == "measured"]
    center = statistics.median(samples)
    dispersion = median_absolute_deviation(samples)

    print("# Flat TINYINT leaf + 32-row/16-FLOAT join benchmark")
    print()
    print(f"Event rows: {args.rows:,}; measured runs: {args.runs}; DuckDB threads: 1")
    print(f"Payload columns consumed: {args.payload_count}")
    print(f"Checksum: {correctness}")
    print(f"Median: {center * 1e3:.2f} ms")
    print(f"MAD: {dispersion * 1e3:.2f} ms")
    print(f"Time per row: {center * 1e9 / args.rows:.2f} ns")


if __name__ == "__main__":
    main()
