#!/usr/bin/env python3

import argparse
import csv
import io
import os
import random
import statistics
import subprocess
from pathlib import Path

from run_benchmarks import TIMER_PATTERN
from run_small_feature_benchmark import (
    make_tree,
    median_absolute_deviation,
    tree_literal,
)

CASES = (
    ("0", 0),
    ("0.1", 1),
    ("1", 10),
    ("10", 100),
    ("99", 990),
    ("100", 1000),
)


def feature_expression(threshold):
    value = "(((i * 17 + 13) % 2049)::FLOAT / 1024.0::FLOAT - 1.0::FLOAT)"
    if threshold == 0:
        return value
    if threshold == 1000:
        return "NULL::FLOAT"
    return f"CASE WHEN hash(i) % 1000 < {threshold} THEN NULL::FLOAT ELSE {value} END"


def build_sql(rows, warmups, runs, seed):
    columns = ",\n    ".join(
        f"{feature_expression(threshold)} AS x_{threshold}" for _, threshold in CASES
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
SELECT
    {columns},
    (((i * 29 + 7) % 2049)::FLOAT / 1024.0::FLOAT - 1.0::FLOAT) AS x1,
    (((i * 43 + 3) % 2049)::FLOAT / 1024.0::FLOAT - 1.0::FLOAT) AS x2
FROM range({rows}) input(i);
""",
        f"CREATE MACRO benchmark_tree() AS {tree_literal(make_tree(10, 3, seed))};",
    ]

    for _, threshold in CASES:
        name = f"p{threshold}"
        feature = f"x_{threshold}"
        lines.append(
            f"SELECT 'nulls_{name}', count(*) FILTER (WHERE {feature} IS NULL), "
            f"string_agg(DISTINCT vector_type({feature}), ',') FROM features;"
        )
        lines.append(
            f"SELECT 'verify_{name}', count(*) FROM features WHERE "
            f"(decision_tree(benchmark_tree(), {feature}, x1, x2) IS NULL) "
            f"IS DISTINCT FROM ({feature} IS NULL);"
        )
        lines.append(
            f"PREPARE {name} AS SELECT '{name}', "
            f"sum(coalesce(decision_tree(benchmark_tree(), {feature}, x1, x2), -1))::HUGEINT "
            f"FROM features;"
        )

    executions = []
    ordering = random.Random(seed)
    lines.append(".timer on")
    for phase, rounds in (("warmup", warmups), ("measured", runs)):
        for _ in range(rounds):
            order = list(CASES)
            ordering.shuffle(order)
            for _, threshold in order:
                executions.append((phase, threshold))
                lines.append(f"EXECUTE p{threshold};")
    lines.append(".timer off")
    return "\n".join(lines) + "\n", executions


def run_benchmark(binary, sql, timeout, cpu):
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
    return process.stdout


def parse_output(output, executions, warmups, runs):
    null_counts = {}
    vector_types = {}
    verifications = {}
    result_counts = {}
    checksums = {}
    for row in csv.reader(io.StringIO(output)):
        if len(row) == 3 and row[0].startswith("nulls_p"):
            threshold = int(row[0].removeprefix("nulls_p"))
            null_counts[threshold] = int(row[1])
            vector_types[threshold] = row[2]
        elif len(row) == 2 and row[0].startswith("verify_p"):
            threshold = int(row[0].removeprefix("verify_p"))
            verifications[threshold] = int(row[1])
        elif len(row) == 2 and row[0].startswith("p"):
            threshold = int(row[0][1:])
            result_counts[threshold] = result_counts.get(threshold, 0) + 1
            checksums.setdefault(threshold, set()).add(row[1])

    thresholds = {threshold for _, threshold in CASES}
    if set(null_counts) != thresholds or set(vector_types) != thresholds:
        raise RuntimeError(
            f"missing NULL counts or vector types: {null_counts}, {vector_types}"
        )
    if set(verifications) != thresholds or any(verifications.values()):
        raise RuntimeError(f"correctness checks failed: {verifications}")
    if any(result_counts.get(threshold) != warmups + runs for threshold in thresholds):
        raise RuntimeError(f"missing benchmark results: {result_counts}")
    if any(len(checksums.get(threshold, ())) != 1 for threshold in thresholds):
        raise RuntimeError(f"unstable checksums: {checksums}")

    elapsed = [float(match.group(1)) for match in TIMER_PATTERN.finditer(output)]
    if len(elapsed) != len(executions):
        raise RuntimeError(
            f"expected {len(executions)} timer samples, found {len(elapsed)}"
        )
    samples = {threshold: [] for threshold in thresholds}
    for (phase, threshold), seconds in zip(executions, elapsed):
        if phase == "measured":
            samples[threshold].append(seconds)
    return null_counts, vector_types, samples


def main():
    parser = argparse.ArgumentParser(
        description="Benchmark decision_tree with nullable feature vectors"
    )
    parser.add_argument("--duckdb", type=Path, required=True)
    parser.add_argument("--rows", type=int, default=10_000_000)
    parser.add_argument("--warmups", type=int, default=5)
    parser.add_argument("--runs", type=int, default=31)
    parser.add_argument("--seed", type=int, default=20_260_908)
    parser.add_argument("--timeout", type=int, default=1800)
    args = parser.parse_args()
    if not args.duckdb.is_file():
        parser.error(f"DuckDB executable does not exist: {args.duckdb}")

    cpu = min(os.sched_getaffinity(0))
    sql, executions = build_sql(args.rows, args.warmups, args.runs, args.seed)
    output = run_benchmark(args.duckdb, sql, args.timeout, cpu)
    null_counts, vector_types, samples = parse_output(
        output, executions, args.warmups, args.runs
    )

    medians = {
        threshold: statistics.median(values) for threshold, values in samples.items()
    }
    baseline = medians[0]
    print("# NULL fraction benchmark")
    print()
    print(
        f"Rows: {args.rows:,}; warmups: {args.warmups}; measured runs: {args.runs}; "
        f"DuckDB threads: 1; pinned CPU: {cpu}"
    )
    print()
    print(
        "| Requested NULLs | Actual NULLs | Input | Median (ms) | MAD (ms) | ns/row | Relative |"
    )
    print("|---:|---:|:--|---:|---:|---:|---:|")
    for label, threshold in CASES:
        center = medians[threshold]
        dispersion = median_absolute_deviation(samples[threshold])
        actual = 100 * null_counts[threshold] / args.rows
        print(
            f"| {label}% | {actual:.4f}% | {vector_types[threshold]} | {center * 1e3:.2f} | "
            f"{dispersion * 1e3:.2f} | {center * 1e9 / args.rows:.2f} | {center / baseline:.3f}x |"
        )


if __name__ == "__main__":
    main()
