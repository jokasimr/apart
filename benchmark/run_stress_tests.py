#!/usr/bin/env python3

import argparse
import csv
import io
import os
import subprocess
from dataclasses import dataclass
from pathlib import Path

from run_benchmarks import SplitMix64, float_literal, list_literal

MODULUS = 65_521
HALF_RANGE = 32_760.0


@dataclass
class Leaf:
    index: int = -1


@dataclass
class Node:
    feature: int
    sign: int
    threshold: float
    below: object = None
    above: object = None
    index: int = -1


@dataclass(frozen=True)
class Case:
    name: str
    dimensions: int
    depth: int
    shape: str
    below_fraction: float
    input_type: str
    leaf_kind: str
    null_fraction: float


CORRECTNESS_CASES = (
    Case("n1_d1_full_bal_int", 1, 1, "full", 0.50, "FLOAT", "integer", 0.0),
    Case(
        "n1_d10_full_bal_nullable_float",
        1,
        10,
        "full",
        0.50,
        "FLOAT",
        "nullable_float",
        0.01,
    ),
    Case("n2_d5_full_bal_float", 2, 5, "full", 0.50, "DOUBLE", "float", 0.0),
    Case("n3_d9_full_70_struct", 3, 9, "full", 0.70, "FLOAT", "struct", 0.01),
    Case(
        "n3_d9_variable_bal_varchar", 3, 9, "variable", 0.50, "DOUBLE", "varchar", 0.0
    ),
    Case("n5_d7_variable_70_list", 5, 7, "variable", 0.70, "FLOAT", "list", 0.10),
    Case("n6_d5_full_85_array", 6, 5, "full", 0.85, "DOUBLE", "array", 0.0),
    Case(
        "n7_d7_variable_bal_decimal", 7, 7, "variable", 0.50, "FLOAT", "decimal", 0.001
    ),
    Case("n8_d6_full_bal_nested", 8, 6, "full", 0.50, "DOUBLE", "nested", 0.10),
    Case("n10_d6_variable_70_blob", 10, 6, "variable", 0.70, "FLOAT", "blob", 0.0),
    Case("n11_d5_full_85_bool", 11, 5, "full", 0.85, "DOUBLE", "boolean", 0.99),
    Case(
        "n16_d6_variable_bal_hugeint", 16, 6, "variable", 0.50, "FLOAT", "hugeint", 0.0
    ),
    Case("n32_d5_full_70_varchar", 32, 5, "full", 0.70, "DOUBLE", "varchar", 0.001),
    Case("n64_d5_variable_85_struct", 64, 5, "variable", 0.85, "FLOAT", "struct", 0.10),
    Case("n100_d4_full_bal_list", 100, 4, "full", 0.50, "DOUBLE", "list", 0.0),
    Case(
        "n128_d4_variable_70_nested", 128, 4, "variable", 0.70, "FLOAT", "nested", 0.01
    ),
    Case("n200_d3_full_bal_int", 200, 3, "full", 0.50, "DOUBLE", "integer", 0.0),
    Case(
        "n200_d5_variable_85_array", 200, 5, "variable", 0.85, "DOUBLE", "array", 0.001
    ),
)

DENSE_CASES = (
    ("dense_n3_float", 3, "FLOAT", 0.0),
    ("dense_n8_double_nullable", 8, "DOUBLE", 0.01),
    ("dense_n32_float", 32, "FLOAT", 0.0),
    ("dense_n200_double_nullable", 200, "DOUBLE", 0.001),
)


def feature_parameters(dimensions, seed):
    rng = SplitMix64(seed ^ 0x9E37)
    return [
        (1 + rng.next() % (MODULUS - 1), rng.next() % MODULUS)
        for _ in range(dimensions)
    ]


def feature_value(row, parameters):
    multiplier, offset = parameters
    return ((row * multiplier + offset) % MODULUS) / HALF_RANGE - 1.0


def make_tree(case, seed, calibration_rows=8192):
    parameters = feature_parameters(case.dimensions, seed)
    split_rng = SplitMix64(seed ^ 0xD7EE ^ case.dimensions ^ (case.depth << 16))
    shape_rng = SplitMix64(seed ^ 0x51A9E ^ case.dimensions ^ (case.depth << 24))

    def build(level, rows):
        if level == case.depth:
            return Leaf()
        if (
            case.shape == "variable"
            and level >= max(1, case.depth - 3)
            and shape_rng.next() % 5 == 0
        ):
            return Leaf()

        feature = split_rng.next() % case.dimensions
        sign = -1 if split_rng.next() & 1 else 1
        scored = sorted(
            (sign * feature_value(row, parameters[feature]), row) for row in rows
        )
        if len(scored) >= 2:
            below_count = round(case.below_fraction * len(scored))
            below_count = max(1, min(len(scored) - 1, below_count))
            lower = scored[below_count - 1][0]
            upper = scored[below_count][0]
            threshold = (lower + upper) / 2
            below_rows = [row for score, row in scored if score < threshold]
            above_rows = [row for score, row in scored if score >= threshold]
        else:
            threshold = 0.0
            below_rows = [row for score, row in scored if score < threshold]
            above_rows = [row for score, row in scored if score >= threshold]

        result = Node(feature, sign, threshold)
        result.below = build(level + 1, below_rows)
        result.above = build(level + 1, above_rows)
        return result

    root = build(0, list(range(calibration_rows)))
    nodes = []
    leaves = []

    def assign(value):
        if isinstance(value, Leaf):
            value.index = len(leaves)
            leaves.append(value)
            return
        value.index = len(nodes)
        nodes.append(value)
        assign(value.below)
        assign(value.above)

    assign(root)
    return root, nodes, leaves, parameters


def leaf_literal(kind, index):
    if kind == "integer":
        return str(index * 17 - 23)
    if kind == "nullable_float":
        return "NULL::FLOAT" if index % 5 == 0 else f"{index + 0.25:.2f}::FLOAT"
    if kind == "float":
        return f"{index * 0.5 - 3.25:.2f}::FLOAT"
    if kind == "varchar":
        return f"'leaf_{index}_payload'"
    if kind == "blob":
        return f"encode('leaf_{index}_payload')"
    if kind == "boolean":
        return "true" if index % 2 else "false"
    if kind == "decimal":
        return f"{index * 1.125 - 7.5:.3f}::DECIMAL(18,3)"
    if kind == "hugeint":
        return f"{10**24 + index * 97}::HUGEINT"
    if kind == "list":
        return f"[{index}, {index + 1}, {index * 2}]::INTEGER[]"
    if kind == "array":
        return (
            f"[{index + 0.25:.2f}, {index + 1.25:.2f}, "
            f"{index + 2.25:.2f}, {index + 3.25:.2f}]::FLOAT[4]"
        )
    if kind == "struct":
        flag = "true" if index % 2 else "false"
        return f"{{id: {index}, score: {index + 0.5:.2f}::FLOAT, flag: {flag}}}"
    if kind == "nested":
        flag = "true" if index % 2 else "false"
        return (
            f"{{id: {index}::BIGINT, meta: {{score: {index + 0.125:.3f}::DOUBLE, active: {flag}}}, "
            f"samples: [{index + 0.25:.2f}, {index + 1.25:.2f}, {index + 2.25:.2f}]::FLOAT[3], "
            f"labels: ['leaf_{index}', 'group_{index % 3}']::VARCHAR[]}}"
        )
    raise ValueError(f"unknown leaf kind: {kind}")


def child_reference(value):
    if isinstance(value, Leaf):
        return -(value.index + 1)
    return value.index + 1


def tree_literal(case, nodes, leaves):
    weights = []
    thresholds = []
    children = []
    for node in nodes:
        row = ["0.0::FLOAT"] * case.dimensions
        row[node.feature] = f"{node.sign}.0::FLOAT"
        weights.append(list_literal(row))
        thresholds.append(float_literal(node.threshold))
        children.append(
            f"[{child_reference(node.above)},{child_reference(node.below)}]"
        )
    values = [leaf_literal(case.leaf_kind, leaf.index) for leaf in leaves]
    return (
        f"{{weights:{list_literal(weights)},thresholds:{list_literal(thresholds)},"
        f"children:{list_literal(children)},values:{list_literal(values)}}}"
    )


def reference_leaf_expression(value):
    if isinstance(value, Leaf):
        return str(value.index)
    score = f"x{value.feature}" if value.sign > 0 else f"-x{value.feature}"
    return (
        f"CASE WHEN {score} >= {float_literal(value.threshold)} THEN "
        f"{reference_leaf_expression(value.above)} ELSE "
        f"{reference_leaf_expression(value.below)} END"
    )


def base_feature_expression(feature, parameters):
    multiplier, offset = parameters
    return (
        f"(((i * {multiplier} + {offset}) % {MODULUS})::DOUBLE / "
        f"{HALF_RANGE:.1f}::DOUBLE - 1.0::DOUBLE) AS f{feature}"
    )


def case_feature_expression(case, feature, seed):
    value = f"f{feature}::{case.input_type}"
    if case.null_fraction == 0:
        return value
    if case.null_fraction == 1:
        return f"NULL::{case.input_type}"
    threshold = round(case.null_fraction * 1_000_000)
    return (
        f"CASE WHEN hash(i + {feature * 65537 + seed}) % 1000000 < {threshold} "
        f"THEN NULL::{case.input_type} ELSE {value} END"
    )


def build_correctness_sql(cases, rows, seed):
    maximum_dimensions = max(case.dimensions for case in cases)
    parameters = feature_parameters(maximum_dimensions, seed)
    base_columns = ",\n    ".join(
        base_feature_expression(feature, parameters[feature])
        for feature in range(maximum_dimensions)
    )
    lines = [
        ".mode csv",
        ".headers off",
        ".echo off",
        "LOAD dtree;",
        "PRAGMA threads=1;",
        "PRAGMA preserve_insertion_order=false;",
        f"CREATE TABLE base_features AS SELECT i, {base_columns} FROM range({rows}) input(i);",
    ]
    metadata = {}
    for case_index, case in enumerate(cases):
        root, nodes, leaves, _ = make_tree(case, seed)
        macro = f"tree_{case_index}"
        lines.append(f"CREATE MACRO {macro}() AS {tree_literal(case, nodes, leaves)};")
        feature_list = [
            case_feature_expression(case, feature, seed + case_index * 1009)
            for feature in range(case.dimensions)
        ]
        projected = ", ".join(
            f"{expression} AS x{feature}"
            for feature, expression in enumerate(feature_list)
        )
        arguments = ", ".join(f"x{feature}" for feature in range(case.dimensions))
        array = f"[{arguments}]::{case.input_type}[{case.dimensions}]"
        nulls = " OR ".join(f"x{feature} IS NULL" for feature in range(case.dimensions))
        expected_leaf = reference_leaf_expression(root)
        expected = f"{macro}().values[{expected_leaf} + 1]"
        lines.append(
            f"WITH features AS (SELECT {projected} FROM base_features), results AS ("
            f"SELECT decision_tree({macro}(), {arguments}) AS variadic_result, "
            f"decision_tree({macro}(), {array}) AS array_result, {expected} AS expected, "
            f"{nulls} AS has_null "
            f"FROM features) SELECT '{case.name}', "
            f"count(*) FILTER (WHERE CASE WHEN has_null THEN variadic_result IS NOT NULL "
            f"ELSE variadic_result IS DISTINCT FROM expected END), "
            f"count(*) FILTER (WHERE CASE WHEN has_null THEN array_result IS NOT NULL "
            f"ELSE array_result IS DISTINCT FROM expected END), "
            f"count(*) FILTER (WHERE variadic_result IS DISTINCT FROM array_result), count(*) "
            f"FROM results;"
        )
        metadata[case.name] = (len(nodes), len(leaves))

    dense_node_count = 7
    for case_index, (name, dimensions, input_type, null_fraction) in enumerate(
        DENSE_CASES
    ):
        weights = []
        thresholds = []
        children = []
        for node in range(dense_node_count):
            node_weights = []
            for feature in range(dimensions):
                value = ((node * 11 + feature * 7) % 8 - 4) / 4
                node_weights.append(float_literal(0.25 if value == 0 else value))
            weights.append(node_weights)
            thresholds.append(float_literal((node % 5 - 2) / 8))
            below = 2 * node + 1
            above = below + 1
            if below < dense_node_count:
                children.append(f"[{above + 1},{below + 1}]")
            else:
                below_leaf = below - dense_node_count
                above_leaf = above - dense_node_count
                children.append(f"[-{above_leaf + 1},-{below_leaf + 1}]")

        macro = f"dense_tree_{case_index}"
        lines.append(
            f"CREATE MACRO {macro}() AS "
            f"{{weights:{list_literal(list_literal(row) for row in weights)},"
            f"thresholds:{list_literal(thresholds)},children:{list_literal(children)},"
            f"values:{list_literal(range(8))}}};"
        )
        dense_case = Case(
            name,
            dimensions,
            3,
            "full",
            0.50,
            input_type,
            "integer",
            null_fraction,
        )
        feature_list = [
            case_feature_expression(
                dense_case, feature, seed + 50_000 + case_index * 1009
            )
            for feature in range(dimensions)
        ]
        projected = ", ".join(
            f"{expression} AS x{feature}"
            for feature, expression in enumerate(feature_list)
        )
        arguments = ", ".join(f"x{feature}" for feature in range(dimensions))
        array = f"[{arguments}]::{input_type}[{dimensions}]"
        nulls = " OR ".join(f"x{feature} IS NULL" for feature in range(dimensions))

        def dense_reference(node):
            if node >= dense_node_count:
                return str(node - dense_node_count)
            score = " + ".join(
                f"{weights[node][feature]} * x{feature}"
                for feature in range(dimensions)
            )
            below = dense_reference(2 * node + 1)
            above = dense_reference(2 * node + 2)
            return (
                f"CASE WHEN ({score}) >= {thresholds[node]} "
                f"THEN {above} ELSE {below} END"
            )

        expected = dense_reference(0)
        lines.append(
            f"WITH features AS (SELECT {projected} FROM base_features), results AS ("
            f"SELECT decision_tree({macro}(), {arguments}) AS variadic_result, "
            f"decision_tree({macro}(), {array}) AS array_result, {expected} AS expected, "
            f"{nulls} AS has_null FROM features) SELECT '{name}', "
            f"count(*) FILTER (WHERE CASE WHEN has_null THEN variadic_result IS NOT NULL "
            f"ELSE variadic_result IS DISTINCT FROM expected END), "
            f"count(*) FILTER (WHERE CASE WHEN has_null THEN array_result IS NOT NULL "
            f"ELSE array_result IS DISTINCT FROM expected END), "
            f"count(*) FILTER (WHERE variadic_result IS DISTINCT FROM array_result), count(*) "
            f"FROM results;"
        )
        metadata[name] = (dense_node_count, 8)
    return "\n".join(lines) + "\n", metadata


def run_duckdb(binary, sql, timeout, cpu, sanitizer=False):
    environment = os.environ.copy()
    if sanitizer:
        environment["ASAN_OPTIONS"] = "detect_leaks=0"
    process = subprocess.run(
        ["taskset", "-c", str(cpu), str(binary.resolve()), "-batch"],
        input=sql,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        timeout=timeout,
        check=False,
        env=environment,
    )
    if process.returncode:
        raise RuntimeError(process.stdout + "\n" + process.stderr)
    return process.stdout


def parse_correctness(output, expected_names):
    results = {}
    for row in csv.reader(io.StringIO(output)):
        if len(row) == 5:
            results[row[0]] = tuple(int(value) for value in row[1:])
    expected_names = set(expected_names)
    if set(results) != expected_names:
        raise RuntimeError(
            f"missing correctness results: {set(results) ^ expected_names}"
        )
    failures = {
        name: values for name, values in results.items() if values[:3] != (0, 0, 0)
    }
    if failures:
        raise RuntimeError(f"correctness failures: {failures}")
    return results


def main():
    parser = argparse.ArgumentParser(
        description="Exercise decision_tree across dimensions, shapes, NULLs, and leaf types"
    )
    parser.add_argument("--duckdb", type=Path, required=True)
    parser.add_argument("--rows", type=int, default=4099)
    parser.add_argument("--seed", type=int, default=20_260_909)
    parser.add_argument("--timeout", type=int, default=1800)
    parser.add_argument("--sanitizer", action="store_true")
    args = parser.parse_args()
    if not args.duckdb.is_file():
        parser.error(f"DuckDB executable does not exist: {args.duckdb}")

    cpu = min(os.sched_getaffinity(0))
    sql, metadata = build_correctness_sql(CORRECTNESS_CASES, args.rows, args.seed)
    output = run_duckdb(args.duckdb, sql, args.timeout, cpu, args.sanitizer)
    results = parse_correctness(output, metadata)

    print(
        "| Case | Nodes | Leaves | Rows | Variadic mismatches | ARRAY mismatches | Overload mismatches |"
    )
    print("|:--|--:|--:|--:|--:|--:|--:|")
    for case in CORRECTNESS_CASES:
        nodes, leaves = metadata[case.name]
        variadic, array, overload, rows = results[case.name]
        print(
            f"| {case.name} | {nodes} | {leaves} | {rows} | "
            f"{variadic} | {array} | {overload} |"
        )
    for name, _, _, _ in DENSE_CASES:
        nodes, leaves = metadata[name]
        variadic, array, overload, rows = results[name]
        print(
            f"| {name} | {nodes} | {leaves} | {rows} | "
            f"{variadic} | {array} | {overload} |"
        )


if __name__ == "__main__":
    main()
