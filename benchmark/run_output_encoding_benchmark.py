#!/usr/bin/env python3

import argparse
import csv
import io
import random
import statistics
import subprocess
from dataclasses import dataclass
from pathlib import Path

from run_benchmarks import TIMER_PATTERN, float_literal


LEAF_COUNTS = (1023, 1024, 1025)
PAYLOADS = ("float", "struct")
BASE_DEPTH = 10


@dataclass(frozen=True)
class Execution:
    phase: str
    payload: str
    leaf_count: int


def leaf_literal(payload, leaf_index):
    value = float_literal(float(leaf_index))
    if payload == "float":
        return f"{{value:{value}}}"
    return (
        "{value:{items:["
        f"{value},{float_literal(leaf_index + 0.25)},{float_literal(leaf_index * 0.5)}"
        "]}}"
    )


def tree_literal(payload, leaf_count):
    next_leaf = 0

    def make_leaf():
        nonlocal next_leaf
        result = leaf_literal(payload, next_leaf)
        next_leaf += 1
        return result

    def make_node(depth, position):
        # Collapse the two leftmost depth-10 leaves into one leaf.
        if leaf_count == 1023 and depth == BASE_DEPTH - 1 and position == 0:
            return make_leaf()

        if depth == BASE_DEPTH:
            # Split the leftmost depth-10 leaf into two depth-11 leaves.
            if leaf_count == 1025 and position == 0:
                below = make_leaf()
                above = make_leaf()
                threshold = float_literal(1.0 / (1 << (BASE_DEPTH + 1)))
                return (
                    f"{{weights:[1::FLOAT,0::FLOAT,0::FLOAT],threshold:{threshold},"
                    f"below:{below},above:{above}}}"
                )
            return make_leaf()

        below = make_node(depth + 1, position * 2)
        above = make_node(depth + 1, position * 2 + 1)
        threshold = float_literal((2 * position + 1) / (1 << (depth + 1)))
        return (
            f"{{weights:[1::FLOAT,0::FLOAT,0::FLOAT],threshold:{threshold},"
            f"below:{below},above:{above}}}"
        )

    result = make_node(0, 0)
    if next_leaf != leaf_count:
        raise AssertionError(f"constructed {next_leaf} leaves instead of {leaf_count}")
    return result


def expected_leaf_expression(leaf_count):
    base_leaf = "floor(x0 * 1024::FLOAT)::INTEGER"
    if leaf_count == 1023:
        return f"CASE WHEN {base_leaf} < 2 THEN 0 ELSE {base_leaf} - 1 END"
    if leaf_count == 1024:
        return base_leaf
    return (
        "CASE WHEN x0 < (1::FLOAT / 1024::FLOAT) "
        "THEN CASE WHEN x0 < (1::FLOAT / 2048::FLOAT) THEN 0 ELSE 1 END "
        f"ELSE {base_leaf} + 1 END"
    )


def expected_value_expression(payload, leaf_count):
    leaf = expected_leaf_expression(leaf_count)
    if payload == "float":
        return f"({leaf})::FLOAT"
    return (
        "{items:["
        f"({leaf})::FLOAT,({leaf})::FLOAT + 0.25::FLOAT,({leaf})::FLOAT * 0.5::FLOAT"
        "]}"
    )


def feature_table_sql(rows):
    return f"""
CREATE TABLE features AS
SELECT
    ((((i * 2654435761 + 1013904223) % 1048576)::FLOAT + 0.5::FLOAT)
        / 1048576::FLOAT) AS x0,
    (((i * 29 + 7) % 2049)::FLOAT / 1024::FLOAT - 1::FLOAT) AS x1,
    (((i * 43 + 3) % 2049)::FLOAT / 1024::FLOAT - 1::FLOAT) AS x2
FROM range({rows}) AS input(i);
"""


def result_expression(payload, tree_name):
    evaluation = f"decision_tree({tree_name}(), x0, x1, x2)"
    if payload == "float":
        return f"sum({evaluation})::DOUBLE"
    return f"sum(list_sum(({evaluation}).items))::DOUBLE"


def build_sql(rows, correctness_rows, warmups, runs, seed):
    lines = [
        ".mode csv",
        ".headers off",
        ".echo off",
        "LOAD dtree;",
        "PRAGMA threads=1;",
        "PRAGMA preserve_insertion_order=false;",
        feature_table_sql(rows),
    ]

    cases = [
        (payload, leaf_count)
        for payload in PAYLOADS
        for leaf_count in LEAF_COUNTS
    ]
    for payload, leaf_count in cases:
        name = f"{payload}_{leaf_count}"
        tree_name = f"tree_{name}"
        lines.append(
            f"CREATE MACRO {tree_name}() AS {tree_literal(payload, leaf_count)};"
        )

    for payload, leaf_count in cases:
        name = f"{payload}_{leaf_count}"
        tree_name = f"tree_{name}"
        actual = f"decision_tree({tree_name}(), x0, x1, x2)"
        expected = expected_value_expression(payload, leaf_count)
        lines.append(
            f"SELECT 'verify_{name}', count(*) FROM "
            f"(SELECT * FROM features LIMIT {correctness_rows}) sample "
            f"WHERE {actual} IS DISTINCT FROM {expected};"
        )
        lines.append(
            f"SELECT 'encoding_{name}', min(kind), max(kind), count(DISTINCT kind) "
            f"FROM (SELECT vector_type({actual}) AS kind FROM features LIMIT 4096);"
        )
        lines.append(
            f"PREPARE {name} AS SELECT '{name}', "
            f"{result_expression(payload, tree_name)} FROM features;"
        )

    executions = []
    ordering = random.Random(seed)
    lines.append(".timer on")
    for phase, rounds in (("warmup", warmups), ("measured", runs)):
        for _ in range(rounds):
            order = cases.copy()
            ordering.shuffle(order)
            for payload, leaf_count in order:
                executions.append(Execution(phase, payload, leaf_count))
                lines.append(f"EXECUTE {payload}_{leaf_count};")
    lines.append(".timer off")
    return "\n".join(lines) + "\n", executions


def median_absolute_deviation(values):
    center = statistics.median(values)
    return statistics.median(abs(value - center) for value in values)


def main():
    parser = argparse.ArgumentParser(
        description="Benchmark dictionary and flat decision_tree outputs"
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

    verifications = {}
    encodings = {}
    checksums = {(payload, leaves): set() for payload in PAYLOADS for leaves in LEAF_COUNTS}
    for record in csv.reader(io.StringIO(process.stdout)):
        if len(record) == 2 and record[0].startswith("verify_"):
            verifications[record[0].removeprefix("verify_")] = int(record[1])
        elif len(record) == 4 and record[0].startswith("encoding_"):
            name = record[0].removeprefix("encoding_")
            encodings[name] = (record[1], record[2], int(record[3]))
        elif len(record) == 2:
            for payload in PAYLOADS:
                prefix = f"{payload}_"
                if record[0].startswith(prefix):
                    leaf_count = int(record[0].removeprefix(prefix))
                    checksums[(payload, leaf_count)].add(record[1])
                    break

    expected_cases = {
        f"{payload}_{leaf_count}"
        for payload in PAYLOADS
        for leaf_count in LEAF_COUNTS
    }
    if set(verifications) != expected_cases or any(verifications.values()):
        raise RuntimeError(f"correctness check failed: {verifications}")
    expected_encodings = {}
    for payload in PAYLOADS:
        expected_encodings[f"{payload}_1023"] = (
            "DICTIONARY_VECTOR",
            "DICTIONARY_VECTOR",
            1,
        )
        for leaf_count in (1024, 1025):
            expected_encodings[f"{payload}_{leaf_count}"] = (
                "FLAT_VECTOR",
                "FLAT_VECTOR",
                1,
            )
    if encodings != expected_encodings:
        raise RuntimeError(f"unexpected vector encodings: {encodings}")
    if any(len(values) != 1 for values in checksums.values()):
        raise RuntimeError(f"unstable checksums: {checksums}")

    timings = [float(match.group(1)) for match in TIMER_PATTERN.finditer(process.stdout)]
    if len(timings) != len(executions):
        raise RuntimeError(f"expected {len(executions)} timings, found {len(timings)}")
    samples = {(payload, leaves): [] for payload in PAYLOADS for leaves in LEAF_COUNTS}
    for execution, elapsed in zip(executions, timings):
        if execution.phase == "measured":
            samples[(execution.payload, execution.leaf_count)].append(elapsed)

    print("# Decision-tree output encoding benchmark")
    print()
    print(f"Rows: {args.rows:,}; measured runs: {args.runs}; DuckDB threads: 1")
    print()
    print("| Leaf type | Leaves | Output | Median (ms) | MAD (ms) | ns/row |")
    print("|:--|--:|:--|--:|--:|--:|")
    medians = {}
    for payload in PAYLOADS:
        for leaf_count in LEAF_COUNTS:
            values = samples[(payload, leaf_count)]
            center = statistics.median(values)
            medians[(payload, leaf_count)] = center
            dispersion = median_absolute_deviation(values)
            encoding = "dictionary" if leaf_count == 1023 else "flat"
            print(
                f"| {payload} | {leaf_count} | {encoding} | {center * 1e3:.2f} | "
                f"{dispersion * 1e3:.2f} | {center * 1e9 / args.rows:.2f} |"
            )

    print()
    print("| Leaf type | Flat - dictionary (ns/row) | Flat / dictionary |")
    print("|:--|--:|--:|")
    for payload in PAYLOADS:
        dictionary = medians[(payload, 1023)]
        flat = medians[(payload, 1025)]
        delta = (flat - dictionary) * 1e9 / args.rows
        print(f"| {payload} | {delta:+.2f} | {flat / dictionary:.3f}x |")


if __name__ == "__main__":
    main()
