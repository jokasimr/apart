#!/usr/bin/env python3

import argparse
import csv
import io
import os
import random
import statistics
import subprocess
from dataclasses import dataclass
from pathlib import Path

from run_benchmarks import TIMER_PATTERN
from run_small_feature_benchmark import median_absolute_deviation
from run_stress_tests import (
    Case,
    base_feature_expression,
    case_feature_expression,
    feature_value,
    make_tree,
    tree_literal,
)


@dataclass(frozen=True)
class PerformanceCase:
    suite: str
    case: Case
    rows: int
    count_output: bool = False


def performance_cases():
    result = []
    for dimensions in (1, 2, 3, 5, 6, 7, 8, 10, 11, 32, 64, 128, 200):
        rows = max(150_000, min(3_000_000, 150_000_000 // (dimensions * 5)))
        result.append(
            PerformanceCase(
                "dimensions",
                Case(
                    f"n{dimensions}_d5_full_bal",
                    dimensions,
                    5,
                    "full",
                    0.50,
                    "FLOAT",
                    "integer",
                    0.0,
                ),
                rows,
            )
        )

    for depth in (1, 3, 7, 10):
        result.append(
            PerformanceCase(
                "depth",
                Case(
                    f"n3_d{depth}_full_bal",
                    3,
                    depth,
                    "full",
                    0.50,
                    "FLOAT",
                    "integer",
                    0.0,
                ),
                3_000_000,
            )
        )

    for dimensions, depth in ((3, 10), (8, 5), (32, 5), (200, 5)):
        rows = max(
            150_000,
            min(3_000_000, 150_000_000 // (dimensions * depth)),
        )
        result.append(
            PerformanceCase(
                "double",
                Case(
                    f"n{dimensions}_d{depth}_full_bal_double",
                    dimensions,
                    depth,
                    "full",
                    0.50,
                    "DOUBLE",
                    "integer",
                    0.0,
                ),
                rows,
            )
        )

    for dimensions in (32, 200):
        for depth in (3, 10):
            rows = max(
                150_000,
                min(1_000_000, 75_000_000 // (dimensions * depth)),
            )
            result.append(
                PerformanceCase(
                    "wide_depth",
                    Case(
                        f"n{dimensions}_d{depth}_full_bal",
                        dimensions,
                        depth,
                        "full",
                        0.50,
                        "FLOAT",
                        "integer",
                        0.0,
                    ),
                    rows,
                )
            )

    for shape, below_fraction in (
        ("full", 0.70),
        ("full", 0.85),
        ("full", 0.99),
        ("variable", 0.50),
        ("variable", 0.70),
        ("variable", 0.85),
        ("variable", 0.99),
    ):
        balance = round(100 * below_fraction)
        result.append(
            PerformanceCase(
                "shape",
                Case(
                    f"n3_d10_{shape}_{balance}",
                    3,
                    10,
                    shape,
                    below_fraction,
                    "FLOAT",
                    "integer",
                    0.0,
                ),
                3_000_000,
            )
        )

    for null_fraction in (0.001, 0.01, 0.10, 0.99, 1.0):
        label = str(null_fraction).replace(".", "p")
        result.append(
            PerformanceCase(
                "nulls",
                Case(
                    f"n3_d10_null_{label}",
                    3,
                    10,
                    "full",
                    0.50,
                    "FLOAT",
                    "integer",
                    null_fraction,
                ),
                3_000_000,
            )
        )

    for leaf_kind in (
        "integer",
        "float",
        "varchar",
        "list",
        "array",
        "struct",
        "nested",
    ):
        result.append(
            PerformanceCase(
                "leaves",
                Case(
                    f"n3_d5_leaf_{leaf_kind}",
                    3,
                    5,
                    "full",
                    0.50,
                    "FLOAT",
                    leaf_kind,
                    0.0,
                ),
                2_000_000,
                True,
            )
        )
    return result


def calibration_stats(root, parameters, rows=8192):
    counts = {}
    total_depth = 0
    for row in range(rows):
        value = root
        depth = 0
        while hasattr(value, "feature"):
            score = value.sign * feature_value(row, parameters[value.feature])
            value = value.above if score >= value.threshold else value.below
            depth += 1
        counts[value.index] = counts.get(value.index, 0) + 1
        total_depth += depth
    return total_depth / rows, max(counts.values()) / rows


def build_sql(performance_case, warmups, runs, seed):
    case = performance_case.case
    root, nodes, leaves, parameters = make_tree(case, seed)
    base_columns = ",\n    ".join(
        base_feature_expression(feature, parameters[feature])
        for feature in range(case.dimensions)
    )
    projected = ",\n    ".join(
        f"{case_feature_expression(case, feature, seed)} AS x{feature}"
        for feature in range(case.dimensions)
    )
    arguments = ", ".join(f"x{feature}" for feature in range(case.dimensions))
    array = f"[{arguments}]::{case.input_type}[{case.dimensions}]"
    tree = tree_literal(case, nodes, leaves)
    if performance_case.count_output:
        variadic_aggregate = (
            f"count(decision_tree(benchmark_tree(), {arguments}))::HUGEINT"
        )
        array_aggregate = (
            "count(decision_tree(benchmark_tree(), features_array))::HUGEINT"
        )
    else:
        variadic_aggregate = (
            f"sum(decision_tree(benchmark_tree(), {arguments}))::HUGEINT"
        )
        array_aggregate = (
            "sum(decision_tree(benchmark_tree(), features_array))::HUGEINT"
        )
    null_predicate = " OR ".join(
        f"x{feature} IS NULL" for feature in range(case.dimensions)
    )

    lines = [
        ".mode csv",
        ".headers off",
        ".echo off",
        "LOAD dtree;",
        "PRAGMA threads=1;",
        "PRAGMA preserve_insertion_order=false;",
        f"""
CREATE TABLE features AS
WITH base AS (
    SELECT i, {base_columns}
    FROM range({performance_case.rows}) input(i)
), projected AS (
    SELECT {projected}
    FROM base
)
SELECT *, {array} AS features_array
FROM projected;
""",
        "ANALYZE features;",
        f"CREATE MACRO benchmark_tree() AS {tree};",
        f"SELECT 'null_rows', count(*) FILTER (WHERE {null_predicate}) FROM features;",
        f"PREPARE bench_variadic AS SELECT 'variadic', {variadic_aggregate} FROM features;",
        f"PREPARE bench_array AS SELECT 'array', {array_aggregate} FROM features;",
        ".timer on",
    ]
    executions = []
    ordering = random.Random(seed ^ case.dimensions ^ (case.depth << 16))
    for phase, rounds in (("warmup", warmups), ("measured", runs)):
        for _ in range(rounds):
            methods = ["variadic", "array"]
            ordering.shuffle(methods)
            for method in methods:
                executions.append((phase, method))
                lines.append(f"EXECUTE bench_{method};")
    lines.append(".timer off")
    average_depth, maximum_leaf_share = calibration_stats(root, parameters)
    return (
        "\n".join(lines) + "\n",
        executions,
        len(nodes),
        len(leaves),
        average_depth,
        maximum_leaf_share,
    )


def run_case(binary, performance_case, warmups, runs, seed, timeout, cpu):
    sql, executions, nodes, leaves, average_depth, maximum_leaf_share = build_sql(
        performance_case, warmups, runs, seed
    )
    process = subprocess.run(
        ["taskset", "-c", str(cpu), str(binary.resolve()), "-batch"],
        input=sql,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        timeout=timeout,
        check=False,
    )
    if process.returncode:
        raise RuntimeError(process.stdout + "\n" + process.stderr)

    checksums = {"variadic": set(), "array": set()}
    result_counts = {"variadic": 0, "array": 0}
    null_rows = None
    for row in csv.reader(io.StringIO(process.stdout)):
        if len(row) != 2:
            continue
        if row[0] == "null_rows":
            null_rows = int(row[1])
        elif row[0] in checksums:
            checksums[row[0]].add(row[1])
            result_counts[row[0]] += 1
    expected_count = warmups + runs
    if null_rows is None or any(
        count != expected_count for count in result_counts.values()
    ):
        raise RuntimeError(
            f"missing results: nulls={null_rows}, counts={result_counts}"
        )
    if any(len(values) != 1 for values in checksums.values()):
        raise RuntimeError(f"unstable checksums: {checksums}")
    if checksums["variadic"] != checksums["array"]:
        raise RuntimeError(f"overload checksum mismatch: {checksums}")

    elapsed = [
        float(match.group(1)) for match in TIMER_PATTERN.finditer(process.stdout)
    ]
    if len(elapsed) != len(executions):
        raise RuntimeError(f"expected {len(executions)} timings, found {len(elapsed)}")
    samples = {"variadic": [], "array": []}
    for (phase, method), duration in zip(executions, elapsed):
        if phase == "measured":
            samples[method].append(duration)
    medians = {method: statistics.median(values) for method, values in samples.items()}
    deviations = {
        method: median_absolute_deviation(values) for method, values in samples.items()
    }
    return {
        "nodes": nodes,
        "leaves": leaves,
        "average_depth": average_depth,
        "maximum_leaf_share": maximum_leaf_share,
        "actual_null_fraction": null_rows / performance_case.rows,
        "variadic": medians["variadic"] * 1e9 / performance_case.rows,
        "array": medians["array"] * 1e9 / performance_case.rows,
        "variadic_mad": deviations["variadic"] * 1e9 / performance_case.rows,
        "array_mad": deviations["array"] * 1e9 / performance_case.rows,
    }


def main():
    parser = argparse.ArgumentParser(
        description="Measure decision_tree performance across representative stress cases"
    )
    parser.add_argument("--duckdb", type=Path, required=True)
    parser.add_argument("--warmups", type=int, default=2)
    parser.add_argument("--runs", type=int, default=11)
    parser.add_argument("--seed", type=int, default=20_260_909)
    parser.add_argument("--timeout", type=int, default=1800)
    parser.add_argument("--suite", action="append")
    parser.add_argument("--case", action="append")
    args = parser.parse_args()
    if not args.duckdb.is_file():
        parser.error(f"DuckDB executable does not exist: {args.duckdb}")

    all_cases = performance_cases()
    selected_suites = set(args.suite or ())
    selected_cases = set(args.case or ())
    available_suites = {case.suite for case in all_cases}
    available_cases = {case.case.name for case in all_cases}
    if selected_suites - available_suites:
        parser.error(f"unknown suites: {sorted(selected_suites - available_suites)}")
    if selected_cases - available_cases:
        parser.error(f"unknown cases: {sorted(selected_cases - available_cases)}")
    cases = [
        (index, case)
        for index, case in enumerate(all_cases)
        if not selected_suites or case.suite in selected_suites
        if not selected_cases or case.case.name in selected_cases
    ]
    if not cases:
        parser.error("no benchmark cases match the selected suites and cases")
    cpu = min(os.sched_getaffinity(0))
    print(
        "| Suite | Case | Rows | Nodes | Leaves | Avg path | Max leaf | NULL rows | "
        "Variadic ns/row | MAD | ARRAY ns/row | MAD |"
    )
    print("|:--|:--|--:|--:|--:|--:|--:|--:|--:|--:|--:|--:|")
    for case_index, performance_case in cases:
        result = run_case(
            args.duckdb,
            performance_case,
            args.warmups,
            args.runs,
            args.seed + case_index * 1009,
            args.timeout,
            cpu,
        )
        print(
            f"| {performance_case.suite} | {performance_case.case.name} | {performance_case.rows} | "
            f"{result['nodes']} | {result['leaves']} | {result['average_depth']:.2f} | "
            f"{100 * result['maximum_leaf_share']:.2f}% | "
            f"{100 * result['actual_null_fraction']:.2f}% | "
            f"{result['variadic']:.2f} | {result['variadic_mad']:.2f} | "
            f"{result['array']:.2f} | {result['array_mad']:.2f} |",
            flush=True,
        )


if __name__ == "__main__":
    main()
