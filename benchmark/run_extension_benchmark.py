#!/usr/bin/env python3

import argparse
import csv
import io
import random
import statistics
import subprocess
from pathlib import Path

from run_benchmarks import DEPTHS, TIMER_PATTERN, feature_table_sql, make_tree, tree_literal


def build_sql(rows, warmups, runs, seed):
    lines = [
        ".mode csv",
        ".headers off",
        ".echo off",
        "LOAD apart;",
        "PRAGMA threads=1;",
        "PRAGMA preserve_insertion_order=false;",
        feature_table_sql(rows),
    ]
    for depth in DEPTHS:
        lines.append(f"CREATE MACRO tree_d{depth}() AS {tree_literal(make_tree(depth, seed))};")
        lines.append(
            f"PREPARE extension_d{depth} AS SELECT 'extension_d{depth}', "
            f"sum(decision_tree(tree_d{depth}(), x0, x1, x2))::HUGEINT FROM features;"
        )

    executions = []
    ordering = random.Random(seed)
    lines.append(".timer on")
    for phase, rounds in (("warmup", warmups), ("measured", runs)):
        for _ in range(rounds):
            order = list(DEPTHS)
            ordering.shuffle(order)
            for depth in order:
                executions.append((phase, depth))
                lines.append(f"EXECUTE extension_d{depth};")
    lines.append(".timer off")
    return "\n".join(lines) + "\n", executions


def median_absolute_deviation(values):
    center = statistics.median(values)
    return statistics.median(abs(value - center) for value in values)


def main():
    parser = argparse.ArgumentParser(description="Benchmark the DuckDB decision_tree extension")
    parser.add_argument("--duckdb", type=Path, required=True)
    parser.add_argument("--rows", type=int, default=10_000_000)
    parser.add_argument("--warmups", type=int, default=2)
    parser.add_argument("--runs", type=int, default=21)
    parser.add_argument("--seed", type=int, default=20_260_902)
    parser.add_argument("--timeout", type=int, default=1800)
    args = parser.parse_args()
    if not args.duckdb.is_file():
        parser.error(f"DuckDB executable does not exist: {args.duckdb}")

    sql, executions = build_sql(args.rows, args.warmups, args.runs, args.seed)
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

    checksums = {depth: set() for depth in DEPTHS}
    for record in csv.reader(io.StringIO(process.stdout)):
        if len(record) == 2 and record[0].startswith("extension_d"):
            checksums[int(record[0].removeprefix("extension_d"))].add(int(record[1]))
    if any(len(values) != 1 for values in checksums.values()):
        raise RuntimeError(f"unstable checksums: {checksums}")

    timings = [float(match.group(1)) for match in TIMER_PATTERN.finditer(process.stdout)]
    if len(timings) != len(executions):
        raise RuntimeError(f"expected {len(executions)} timings, found {len(timings)}")
    samples = {depth: [] for depth in DEPTHS}
    for (phase, depth), elapsed in zip(executions, timings):
        if phase == "measured":
            samples[depth].append(elapsed)

    print("| Depth | Median (ms) | MAD (ms) | ns/row |")
    print("|---:|---:|---:|---:|")
    for depth in DEPTHS:
        center = statistics.median(samples[depth])
        dispersion = median_absolute_deviation(samples[depth])
        print(
            f"| {depth} | {center * 1e3:.2f} | {dispersion * 1e3:.2f} | "
            f"{center * 1e9 / args.rows:.2f} |"
        )


if __name__ == "__main__":
    main()
