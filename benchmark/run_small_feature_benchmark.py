#!/usr/bin/env python3

import argparse
import csv
import io
import random
import statistics
import subprocess
from pathlib import Path

from run_benchmarks import TIMER_PATTERN, SplitMix64, float_literal, list_literal


DEPTHS = (3, 5, 7, 9)
DIMENSIONS = (1, 2, 3)


def make_tree(depth, dimensions, seed):
    random_source = SplitMix64(seed + depth * 10 + dimensions)
    node_count = (1 << depth) - 1
    first_bottom_node = (1 << (depth - 1)) - 1
    coefficients = []
    thresholds = []
    left_children = []
    right_children = []

    for node in range(node_count):
        weights = [random_source.randint(-8, 8) / 8 for _ in range(dimensions)]
        if not any(weights):
            weights[0] = 1 / 8
        coefficients.append(weights)
        thresholds.append(random_source.randint(-2, 2) / 8)

        left = 2 * node + 1
        if left < node_count:
            left_children.append(left)
            right_children.append(left + 1)
        else:
            leaf = 2 * (node - first_bottom_node)
            left_children.append(-(leaf + 1))
            right_children.append(-(leaf + 2))

    return coefficients, thresholds, left_children, right_children


def tree_literal(tree, reference=0):
    coefficients, thresholds, left_children, right_children = tree
    if reference < 0:
        return f"{{value:{-reference - 1}}}"
    weights = list_literal(float_literal(value) for value in coefficients[reference])
    below = tree_literal(tree, left_children[reference])
    above = tree_literal(tree, right_children[reference])
    return (
        f"{{weights:{weights},threshold:{float_literal(thresholds[reference])},"
        f"below:{below},above:{above}}}"
    )


def reference_expression(tree, reference=0):
    coefficients, thresholds, left_children, right_children = tree
    if reference < 0:
        return str(-reference - 1)
    score = " + ".join(
        f"{float_literal(weight)} * x{feature}"
        for feature, weight in enumerate(coefficients[reference])
    )
    left = reference_expression(tree, left_children[reference])
    right = reference_expression(tree, right_children[reference])
    return (
        f"CASE WHEN ({score}) >= {float_literal(thresholds[reference])} "
        f"THEN {right} ELSE {left} END"
    )


def feature_table_sql(rows):
    return f"""
CREATE TABLE features AS
SELECT
    (((i * 17 + 13) % 2049)::FLOAT / 1024.0::FLOAT - 1.0::FLOAT) AS x0,
    (((i * 29 + 7) % 2049)::FLOAT / 1024.0::FLOAT - 1.0::FLOAT) AS x1,
    (((i * 43 + 3) % 2049)::FLOAT / 1024.0::FLOAT - 1.0::FLOAT) AS x2
FROM range({rows}) AS input(i);
"""


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
    for depth in DEPTHS:
        for dimensions in DIMENSIONS:
            tree = make_tree(depth, dimensions, seed)
            features = ", ".join(f"x{feature}" for feature in range(dimensions))
            name = f"n{dimensions}_d{depth}"
            lines.append(f"CREATE MACRO tree_{name}() AS {tree_literal(tree)};")
            lines.append(
                f"PREPARE {name} AS SELECT '{name}', "
                f"sum(decision_tree(tree_{name}(), {features}))::HUGEINT FROM features;"
            )
            lines.append(
                f"SELECT 'verify_{name}', count(*) FROM "
                f"(SELECT * FROM features LIMIT {correctness_rows}) sample "
                f"WHERE decision_tree(tree_{name}(), {features}) "
                f"IS DISTINCT FROM {reference_expression(tree)};"
            )

    executions = []
    ordering = random.Random(seed)
    lines.append(".timer on")
    for phase, rounds in (("warmup", warmups), ("measured", runs)):
        for _ in range(rounds):
            order = [(dimensions, depth) for depth in DEPTHS for dimensions in DIMENSIONS]
            ordering.shuffle(order)
            for dimensions, depth in order:
                executions.append((phase, dimensions, depth))
                lines.append(f"EXECUTE n{dimensions}_d{depth};")
    lines.append(".timer off")
    return "\n".join(lines) + "\n", executions


def median_absolute_deviation(values):
    center = statistics.median(values)
    return statistics.median(abs(value - center) for value in values)


def main():
    parser = argparse.ArgumentParser(description="Benchmark fixed-N decision_tree kernels")
    parser.add_argument("--duckdb", type=Path, required=True)
    parser.add_argument("--rows", type=int, default=10_000_000)
    parser.add_argument("--correctness-rows", type=int, default=100_000)
    parser.add_argument("--warmups", type=int, default=3)
    parser.add_argument("--runs", type=int, default=21)
    parser.add_argument("--seed", type=int, default=20_260_903)
    parser.add_argument("--timeout", type=int, default=1800)
    args = parser.parse_args()
    if not args.duckdb.is_file():
        parser.error(f"DuckDB executable does not exist: {args.duckdb}")

    sql, executions = build_sql(args.rows, args.correctness_rows, args.warmups, args.runs, args.seed)
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

    checksums = {(dimensions, depth): set() for dimensions in DIMENSIONS for depth in DEPTHS}
    verifications = {}
    for record in csv.reader(io.StringIO(process.stdout)):
        if len(record) == 2 and record[0].startswith("verify_"):
            verifications[record[0]] = int(record[1])
            continue
        if len(record) == 2 and record[0].startswith("n"):
            dimensions, depth = record[0].split("_")
            checksums[(int(dimensions[1:]), int(depth[1:]))].add(int(record[1]))
    if len(verifications) != len(DEPTHS) * len(DIMENSIONS) or any(verifications.values()):
        raise RuntimeError(f"correctness check failed: {verifications}")
    if any(len(values) != 1 for values in checksums.values()):
        raise RuntimeError(f"unstable checksums: {checksums}")

    timings = [float(match.group(1)) for match in TIMER_PATTERN.finditer(process.stdout)]
    if len(timings) != len(executions):
        raise RuntimeError(f"expected {len(executions)} timings, found {len(timings)}")
    samples = {(dimensions, depth): [] for dimensions in DIMENSIONS for depth in DEPTHS}
    for (phase, dimensions, depth), elapsed in zip(executions, timings):
        if phase == "measured":
            samples[(dimensions, depth)].append(elapsed)

    print("| Features | Depth | Median (ms) | MAD (ms) | ns/row |")
    print("|---:|---:|---:|---:|---:|")
    for dimensions in DIMENSIONS:
        for depth in DEPTHS:
            values = samples[(dimensions, depth)]
            center = statistics.median(values)
            dispersion = median_absolute_deviation(values)
            print(
                f"| {dimensions} | {depth} | {center * 1e3:.2f} | {dispersion * 1e3:.2f} | "
                f"{center * 1e9 / args.rows:.2f} |"
            )


if __name__ == "__main__":
    main()
