#!/usr/bin/env python3

import argparse
import csv
import io
import os
import random
import re
import statistics
import subprocess
from pathlib import Path

from run_benchmarks import TIMER_PATTERN, float_literal, list_literal, public_reference


DEPTHS = (5, 7, 9)
DIMENSIONS = (1, 2, 3, 4)
SHAPES = ("equal", "unequal")
INPUT_MODULUS = 16_777_213
FLOAT_MULTIPLIERS = (3, 5, 7, 11)


def leaf_literal(index, boolean_fields):
    fields = [
        f"f{field}:{index * multiplier + field + 1}::FLOAT"
        for field, multiplier in enumerate(FLOAT_MULTIPLIERS)
    ]
    fields.extend(
        f"b{field}:{str(index % (field + 2) == 0).lower()}"
        for field in range(boolean_fields)
    )
    return "{" + ",".join(fields) + "}"


def make_tree(depth, dimensions, shape, boolean_fields):
    weights = []
    thresholds = []
    children = []
    values = []

    def make_leaf():
        reference = -len(values) - 1
        values.append(leaf_literal(len(values), boolean_fields))
        return reference

    def make_node(level, position, lower, upper):
        if level == depth or (
            shape == "unequal" and level == depth - 1 and position == 0
        ):
            return make_leaf()

        node = len(weights)
        weights.append([1.0] + [0.0] * (dimensions - 1))
        threshold = (lower + upper) / 2
        thresholds.append(threshold)
        children.append(None)

        below = make_node(level + 1, 2 * position, lower, threshold)
        above = make_node(level + 1, 2 * position + 1, threshold, upper)
        children[node] = (above, below)
        return node

    root = make_node(0, 0, 0.0, 1.0)
    if root != 0:
        raise AssertionError(f"unexpected root {root}")
    return weights, thresholds, children, values


def tree_literal(tree):
    weights, thresholds, children, values = tree
    weight_rows = list_literal(
        list_literal(float_literal(value) for value in row) for row in weights
    )
    threshold_values = list_literal(float_literal(value) for value in thresholds)
    child_rows = list_literal(
        f"[{public_reference(above)},{public_reference(below)}]"
        for above, below in children
    )
    return (
        f"{{weights:{weight_rows},thresholds:{threshold_values},"
        f"children:{child_rows},values:{list_literal(values)}}}"
    )


def expected_leaf_expression(depth, shape):
    leaf = f"floor(x0 * {1 << depth})::INTEGER"
    if shape == "equal":
        return leaf
    return f"CASE WHEN {leaf} < 2 THEN 0 ELSE {leaf} - 1 END"


def expected_value_expression(depth, shape, boolean_fields):
    leaf = expected_leaf_expression(depth, shape)
    fields = [
        f"f{field}:(({leaf}) * {multiplier} + {field + 1})::FLOAT"
        for field, multiplier in enumerate(FLOAT_MULTIPLIERS)
    ]
    fields.extend(
        f"b{field}:(({leaf}) % {field + 2} = 0)"
        for field in range(boolean_fields)
    )
    return "{" + ",".join(fields) + "}"


def consume_expression(value, consumed_booleans):
    fields = [f"{value}.f{field}" for field in range(len(FLOAT_MULTIPLIERS))]
    fields.extend(
        f"({value}.b{field})::INTEGER" for field in range(consumed_booleans)
    )
    return " + ".join(fields)


def feature_table_sql(rows):
    multipliers = (15_485_863, 3_245_281, 4_999_969, 6_999_607)
    offsets = (32_452_843, 49_979_687, 67_867_967, 86_028_121)
    columns = []
    for feature, (multiplier, offset) in enumerate(zip(multipliers, offsets)):
        columns.append(
            f"(((i * {multiplier} + {offset}) % {INPUT_MODULUS})::FLOAT "
            f"/ {INPUT_MODULUS}::FLOAT) AS x{feature}"
        )
    return f"CREATE TABLE features AS SELECT {','.join(columns)} FROM range({rows}) rows(i);"


def build_sql(
    rows, correctness_rows, warmups, runs, seed, boolean_fields, consumed_booleans
):
    cases = []
    lines = [
        ".mode csv",
        ".headers off",
        ".echo off",
        "LOAD apart;",
        "PRAGMA threads=1;",
        "PRAGMA preserve_insertion_order=false;",
        feature_table_sql(rows),
    ]

    for dimensions in DIMENSIONS:
        features = ", ".join(f"x{i}" for i in range(dimensions))
        for depth in DEPTHS:
            for shape in SHAPES:
                name = f"n{dimensions}_d{depth}_{shape}"
                tree = make_tree(depth, dimensions, shape, boolean_fields)
                cases.append((name, dimensions, depth, shape, features, tree))
                lines.append(f"CREATE MACRO tree_{name}() AS {tree_literal(tree)};")

    for name, _, depth, shape, features, _ in cases:
        actual = f"decision_tree(tree_{name}(), {features})"
        expected = expected_value_expression(depth, shape, boolean_fields)
        lines.append(
            f"SELECT 'verify_{name}', count(*) FROM "
            f"(SELECT * FROM features LIMIT {correctness_rows}) sample "
            f"WHERE {actual} IS DISTINCT FROM {expected};"
        )
        lines.append(
            f"PREPARE {name} AS SELECT '{name}', "
            f"sum({consume_expression('result', consumed_booleans)})::DOUBLE "
            f"FROM (SELECT {actual} AS result FROM features);"
        )

    executions = []
    ordering = random.Random(seed)
    lines.append(".timer on")
    for phase, rounds in (("warmup", warmups), ("measured", runs)):
        for _ in range(rounds):
            order = list(cases)
            ordering.shuffle(order)
            for name, dimensions, depth, shape, _, _ in order:
                executions.append((phase, name, dimensions, depth, shape))
                lines.append(f"EXECUTE {name};")
    lines.append(".timer off")
    return "\n".join(lines) + "\n", executions


def run_benchmark(binary, sql, timeout, cpu):
    process = subprocess.run(
        ["taskset", "-c", str(cpu), str(binary), "-batch"],
        input=sql,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        timeout=timeout,
        check=False,
    )
    if process.returncode:
        raise RuntimeError(process.stdout + "\n" + process.stderr)
    return process.stdout


def parse_output(output, executions, warmups, runs):
    verifications = {}
    result_counts = {}
    for row in csv.reader(io.StringIO(output)):
        if len(row) != 2:
            continue
        name, value = row
        if name.startswith("verify_"):
            verifications[name.removeprefix("verify_")] = int(value)
        elif re.fullmatch(r"n\d+_d\d+_(equal|unequal)", name):
            result_counts[name] = result_counts.get(name, 0) + 1

    names = {execution[1] for execution in executions}
    if set(verifications) != names or any(verifications.values()):
        raise RuntimeError(f"correctness checks failed: {verifications}")
    if any(result_counts.get(name) != warmups + runs for name in names):
        raise RuntimeError(f"missing benchmark results: {result_counts}")

    elapsed = [float(match.group(1)) for match in TIMER_PATTERN.finditer(output)]
    if len(elapsed) != len(executions):
        raise RuntimeError(
            f"expected {len(executions)} timer samples, found {len(elapsed)}"
        )

    samples = {
        (dimensions, depth, shape): []
        for dimensions in DIMENSIONS
        for depth in DEPTHS
        for shape in SHAPES
    }
    for execution, seconds in zip(executions, elapsed):
        phase, _, dimensions, depth, shape = execution
        if phase == "measured":
            samples[(dimensions, depth, shape)].append(seconds)
    return samples


def median_absolute_deviation(values):
    center = statistics.median(values)
    return statistics.median(abs(value - center) for value in values)


def print_report(
    samples, rows, warmups, runs, cpu, boolean_fields, consumed_booleans
):
    print("# Equal-depth versus unequal-depth fixed-N traversal with STRUCT leaves")
    print()
    print(
        f"Rows: {rows:,}; warmups: {warmups}; measured runs: {runs}; "
        f"DuckDB threads: 1; pinned CPU: {cpu}"
    )
    leaf_fields = [f"f{field} FLOAT" for field in range(len(FLOAT_MULTIPLIERS))]
    leaf_fields.extend(f"b{field} BOOLEAN" for field in range(boolean_fields))
    print(f"Leaf type: STRUCT({', '.join(leaf_fields)})")
    print(f"Consumed boolean fields: {consumed_booleans}")
    print()
    print("| N | Depth | Shape | Average depth | Median (ns/row) | MAD (ns/row) |")
    print("|---:|---:|:---|---:|---:|---:|")
    medians = {}
    for dimensions in DIMENSIONS:
        for depth in DEPTHS:
            for shape in SHAPES:
                values = samples[(dimensions, depth, shape)]
                center = statistics.median(values) * 1e9 / rows
                dispersion = median_absolute_deviation(values) * 1e9 / rows
                medians[(dimensions, depth, shape)] = center
                average_depth = (
                    depth
                    if shape == "equal"
                    else depth - 1 / (1 << (depth - 1))
                )
                print(
                    f"| {dimensions} | {depth} | {shape} | {average_depth:.6f} | "
                    f"{center:.2f} | {dispersion:.2f} |"
                )

    print()
    print("| N | Depth | Unequal - equal (ns/row) | Unequal / equal |")
    print("|---:|---:|---:|---:|")
    for dimensions in DIMENSIONS:
        for depth in DEPTHS:
            equal = medians[(dimensions, depth, "equal")]
            unequal = medians[(dimensions, depth, "unequal")]
            print(
                f"| {dimensions} | {depth} | {unequal - equal:+.2f} | "
                f"{unequal / equal:.3f}x |"
            )


def main():
    parser = argparse.ArgumentParser(
        description="Compare equal-depth and unequal-depth fixed-N tree traversal"
    )
    parser.add_argument("--duckdb", type=Path, required=True)
    parser.add_argument("--rows", type=int, default=5_000_000)
    parser.add_argument("--correctness-rows", type=int, default=100_000)
    parser.add_argument("--warmups", type=int, default=5)
    parser.add_argument("--runs", type=int, default=31)
    parser.add_argument("--seed", type=int, default=20_260_907)
    parser.add_argument("--timeout", type=int, default=1800)
    parser.add_argument("--boolean-fields", type=int, choices=range(3), default=2)
    parser.add_argument("--consumed-booleans", type=int, choices=range(3))
    args = parser.parse_args()
    if not args.duckdb.is_file():
        parser.error(f"DuckDB executable does not exist: {args.duckdb}")
    if args.rows <= 0 or args.correctness_rows <= 0 or args.runs < 1:
        parser.error("rows and correctness-rows must be positive and runs at least 1")

    consumed_booleans = (
        args.boolean_fields
        if args.consumed_booleans is None
        else args.consumed_booleans
    )
    if consumed_booleans > args.boolean_fields:
        parser.error("consumed-booleans cannot exceed boolean-fields")

    cpu = min(os.sched_getaffinity(0))
    sql, executions = build_sql(
        args.rows,
        args.correctness_rows,
        args.warmups,
        args.runs,
        args.seed,
        args.boolean_fields,
        consumed_booleans,
    )
    output = run_benchmark(args.duckdb, sql, args.timeout, cpu)
    samples = parse_output(output, executions, args.warmups, args.runs)
    print_report(
        samples,
        args.rows,
        args.warmups,
        args.runs,
        cpu,
        args.boolean_fields,
        consumed_booleans,
    )


if __name__ == "__main__":
    main()
