#!/usr/bin/env python3

import argparse
import csv
import io
import platform
import random
import re
import statistics
import subprocess
import sys
from dataclasses import dataclass
from datetime import datetime
from pathlib import Path


DEPTHS = (3, 5, 7, 10)
TIMER_PATTERN = re.compile(r"Run Time.*?real\s+([0-9]+(?:\.[0-9]+)?)")


@dataclass(frozen=True)
class Tree:
    coefficients: list
    thresholds: list
    left_children: list
    right_children: list


@dataclass(frozen=True)
class Execution:
    phase: str
    method: str
    depth: int


class SplitMix64:
    def __init__(self, seed):
        self.state = seed & ((1 << 64) - 1)

    def next(self):
        mask = (1 << 64) - 1
        self.state = (self.state + 0x9E3779B97F4A7C15) & mask
        value = self.state
        value = ((value ^ (value >> 30)) * 0xBF58476D1CE4E5B9) & mask
        value = ((value ^ (value >> 27)) * 0x94D049BB133111EB) & mask
        return value ^ (value >> 31)

    def randint(self, lower, upper):
        return lower + self.next() % (upper - lower + 1)


def float_literal(value):
    return f"{value:.9g}::FLOAT"


def list_literal(values):
    return "[" + ",".join(str(value) for value in values) + "]"


def make_tree(depth, seed):
    rng = SplitMix64(seed + depth)
    node_count = (1 << depth) - 1
    first_bottom_node = (1 << (depth - 1)) - 1
    coefficients = []
    thresholds = []
    left_children = []
    right_children = []

    for node in range(node_count):
        weights = [rng.randint(-8, 8) / 8 for _ in range(3)]
        if not any(weights):
            weights[0] = 1 / 8
        coefficients.append(weights)
        thresholds.append(rng.randint(-2, 2) / 8)

        left = 2 * node + 1
        right = left + 1
        if left < node_count:
            left_children.append(left)
            right_children.append(right)
        else:
            leaf = 2 * (node - first_bottom_node)
            left_children.append(-(leaf + 1))
            right_children.append(-(leaf + 2))

    return Tree(coefficients, thresholds, left_children, right_children)


def tree_literal(tree):
    coefficient_rows = (
        list_literal(float_literal(weight) for weight in weights)
        for weights in tree.coefficients
    )
    return "{" + ",".join(
        (
            "coefficients:" + list_literal(coefficient_rows),
            "thresholds:"
            + list_literal(float_literal(value) for value in tree.thresholds),
            "left_children:" + list_literal(tree.left_children),
            "right_children:" + list_literal(tree.right_children),
            "leaf_values:" + list_literal(range(len(tree.left_children) + 1)),
        )
    ) + "}"


def reference_expression(tree, reference=0):
    if reference < 0:
        return str(-reference - 1)
    weights = tree.coefficients[reference]
    score = " + ".join(
        f"{float_literal(weight)} * x{feature}" for feature, weight in enumerate(weights)
    )
    left = reference_expression(tree, tree.left_children[reference])
    right = reference_expression(tree, tree.right_children[reference])
    return (
        f"CASE WHEN ({score}) >= {float_literal(tree.thresholds[reference])} "
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
    trees = {depth: make_tree(depth, seed) for depth in DEPTHS}
    lines = [
        ".mode csv",
        ".headers off",
        ".echo off",
        "LOAD dtree;",
        "PRAGMA threads=1;",
        "PRAGMA preserve_insertion_order=false;",
        feature_table_sql(rows),
        "SELECT 'duckdb_version', version();",
    ]

    for depth, tree in trees.items():
        lines.append(f"CREATE MACRO tree_d{depth}() AS {tree_literal(tree)};")
        actual = f"decision_tree(tree_d{depth}(), x0, x1, x2)"
        expected = reference_expression(tree)
        lines.append(
            f"SELECT 'correctness_d{depth}', count(*) FILTER "
            f"(WHERE actual IS DISTINCT FROM expected) FROM "
            f"(SELECT {actual} AS actual, {expected} AS expected "
            f"FROM (SELECT * FROM features LIMIT {correctness_rows}));"
        )
        lines.append(
            f"PREPARE extension_d{depth} AS SELECT 'extension_d{depth}', "
            f"sum({actual})::HUGEINT FROM features;"
        )
        lines.append(
            f"PREPARE sql_d{depth} AS SELECT 'sql_d{depth}', "
            f"sum({expected})::HUGEINT FROM features;"
        )

    executions = []
    ordering_rng = random.Random(seed ^ 0xD7EE)
    lines.append(".timer on")
    for phase, rounds in (("warmup", warmups), ("measured", runs)):
        for _ in range(rounds):
            order = [
                (method, depth)
                for method in ("extension", "sql")
                for depth in DEPTHS
            ]
            ordering_rng.shuffle(order)
            for method, depth in order:
                executions.append(Execution(phase, method, depth))
                lines.append(f"EXECUTE {method}_d{depth};")
    lines.append(".timer off")
    return "\n".join(lines) + "\n", executions


def run_duckdb(binary, sql, timeout):
    process = subprocess.run(
        [str(binary), "-batch"],
        input=sql,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        timeout=timeout,
        check=False,
    )
    if process.returncode != 0:
        print(process.stdout, file=sys.stderr)
        print(process.stderr, file=sys.stderr)
        raise RuntimeError(f"DuckDB exited with status {process.returncode}")
    return process.stdout, process.stderr


def parse_output(stdout, stderr, executions):
    version = "unknown"
    correctness = {}
    checksums = {
        method: {depth: set() for depth in DEPTHS}
        for method in ("extension", "sql")
    }
    result_counts = {
        method: {depth: 0 for depth in DEPTHS}
        for method in ("extension", "sql")
    }
    for row in csv.reader(io.StringIO(stdout)):
        if len(row) != 2:
            continue
        label, value = row
        if label == "duckdb_version":
            version = value
        elif label.startswith("correctness_d"):
            correctness[int(label.removeprefix("correctness_d"))] = int(value)
        else:
            match = re.fullmatch(r"(extension|sql)_d(\d+)", label)
            if match:
                method, depth_text = match.groups()
                depth = int(depth_text)
                checksums[method][depth].add(int(value))
                result_counts[method][depth] += 1

    if set(correctness) != set(DEPTHS) or any(correctness.values()):
        raise RuntimeError(f"reference correctness check failed: {correctness}")
    expected_count = len(executions) // (2 * len(DEPTHS))
    for method in checksums:
        if any(len(values) != 1 for values in checksums[method].values()) or any(
            count != expected_count for count in result_counts[method].values()
        ):
            raise RuntimeError(
                f"invalid checksum output: checksums={checksums}, "
                f"counts={result_counts}"
            )

    elapsed = [float(match.group(1)) for match in TIMER_PATTERN.finditer(stdout)]
    if len(elapsed) != len(executions):
        raise RuntimeError(
            f"expected {len(executions)} timer samples, found {len(elapsed)}; "
            f"stdout was:\n{stdout}\nstderr was:\n{stderr}"
        )
    samples = {
        method: {depth: [] for depth in DEPTHS}
        for method in ("extension", "sql")
    }
    for execution, seconds in zip(executions, elapsed):
        if execution.phase == "measured":
            samples[execution.method][execution.depth].append(seconds)
    return version, samples, checksums


def build_standalone(source, binary, cxx):
    process = subprocess.run(
        [
            cxx,
            "-O3",
            "-DNDEBUG",
            "-std=c++17",
            "-Wall",
            "-Wextra",
            "-pedantic",
            str(source),
            "-o",
            str(binary),
        ],
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        check=False,
    )
    if process.returncode != 0:
        print(process.stdout, file=sys.stderr)
        print(process.stderr, file=sys.stderr)
        raise RuntimeError(f"standalone compilation exited with status {process.returncode}")


def run_standalone(binary, rows, warmups, runs, seed, timeout):
    process = subprocess.run(
        [str(binary), str(rows), str(warmups), str(runs), str(seed)],
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        timeout=timeout,
        check=False,
    )
    if process.returncode != 0:
        print(process.stdout, file=sys.stderr)
        print(process.stderr, file=sys.stderr)
        raise RuntimeError(f"standalone benchmark exited with status {process.returncode}")

    samples = {depth: [] for depth in DEPTHS}
    checksums = {depth: set() for depth in DEPTHS}
    counts = {depth: 0 for depth in DEPTHS}
    for row in csv.reader(io.StringIO(process.stdout)):
        if len(row) != 4:
            raise RuntimeError(f"invalid standalone output row: {row}")
        phase, depth_text, seconds_text, checksum_text = row
        depth = int(depth_text)
        checksums[depth].add(int(checksum_text))
        counts[depth] += 1
        if phase == "measured":
            samples[depth].append(float(seconds_text))
    expected_count = warmups + runs
    if any(len(values) != 1 for values in checksums.values()) or any(
        count != expected_count for count in counts.values()
    ):
        raise RuntimeError(
            f"invalid standalone checksums: checksums={checksums}, counts={counts}"
        )
    return samples, checksums


def median_absolute_deviation(values):
    center = statistics.median(values)
    return statistics.median(abs(value - center) for value in values)


def cpu_name():
    cpuinfo = Path("/proc/cpuinfo")
    if cpuinfo.exists():
        for line in cpuinfo.read_text().splitlines():
            if line.startswith("model name"):
                return line.split(":", 1)[1].strip()
    return platform.processor() or "unknown"


def print_report(binary, version, rows, correctness_rows, warmups, runs, seed, samples):
    print("# Decision-tree implementation benchmark")
    print()
    print(f"- Timestamp: {datetime.now().astimezone().isoformat(timespec='seconds')}")
    print(f"- CPU: {cpu_name()}")
    print(f"- Platform: {platform.platform()}")
    print(f"- DuckDB: {version} ({binary})")
    print(
        f"- Rows: {rows:,}; correctness rows: {correctness_rows:,}; threads: 1; "
        f"warmups: {warmups}; measured rounds: {runs}; seed: {seed}"
    )
    print("- Statistic: median wall time; dispersion is median absolute deviation (MAD)")
    print()
    print("| Method | Depth | Median (ms) | MAD (ms) | ns/row | M rows/s |")
    print("|:---|---:|---:|---:|---:|---:|")
    for method in ("extension", "sql", "standalone"):
        for depth in DEPTHS:
            values = samples[method][depth]
            center = statistics.median(values)
            mad = median_absolute_deviation(values)
            print(
                f"| {method} | {depth} | {center * 1000:.2f} | "
                f"{mad * 1000:.2f} | {center * 1_000_000_000 / rows:.2f} | "
                f"{rows / center / 1_000_000:.2f} |"
            )


def main():
    parser = argparse.ArgumentParser(description="Benchmark three decision-tree evaluators")
    parser.add_argument("--duckdb", type=Path, default=Path("build/release/duckdb"))
    parser.add_argument(
        "--standalone-source", type=Path, default=Path("benchmark/standalone.cpp")
    )
    parser.add_argument(
        "--standalone-binary", type=Path, default=Path("build/benchmark/standalone")
    )
    parser.add_argument("--cxx", default="c++")
    parser.add_argument("--rows", type=int, default=10_000_000)
    parser.add_argument("--correctness-rows", type=int, default=100_000)
    parser.add_argument("--warmups", type=int, default=2)
    parser.add_argument("--runs", type=int, default=21)
    parser.add_argument("--seed", type=int, default=20_260_902)
    parser.add_argument("--timeout", type=int, default=1800)
    args = parser.parse_args()
    if args.rows <= 0 or args.correctness_rows <= 0 or args.warmups < 0 or args.runs < 3:
        parser.error(
            "rows and correctness-rows must be positive, warmups non-negative, "
            "and runs at least 3"
        )
    if not args.duckdb.is_file():
        parser.error(f"DuckDB executable does not exist: {args.duckdb}")
    if not args.standalone_source.is_file():
        parser.error(
            f"standalone source does not exist: {args.standalone_source}"
        )

    sql, executions = build_sql(
        args.rows, args.correctness_rows, args.warmups, args.runs, args.seed
    )
    stdout, stderr = run_duckdb(args.duckdb, sql, args.timeout)
    version, duckdb_samples, duckdb_checksums = parse_output(
        stdout, stderr, executions
    )

    args.standalone_binary.parent.mkdir(parents=True, exist_ok=True)
    build_standalone(args.standalone_source, args.standalone_binary, args.cxx)
    standalone_samples, standalone_checksums = run_standalone(
        args.standalone_binary,
        args.rows,
        args.warmups,
        args.runs,
        args.seed,
        args.timeout,
    )
    for depth in DEPTHS:
        expected = duckdb_checksums["extension"][depth]
        if duckdb_checksums["sql"][depth] != expected:
            raise RuntimeError(f"SQL checksum differs at depth {depth}")
        if standalone_checksums[depth] != expected:
            raise RuntimeError(f"standalone checksum differs at depth {depth}")

    samples = {
        "extension": duckdb_samples["extension"],
        "sql": duckdb_samples["sql"],
        "standalone": standalone_samples,
    }
    print_report(
        args.duckdb,
        version,
        args.rows,
        args.correctness_rows,
        args.warmups,
        args.runs,
        args.seed,
        samples,
    )


if __name__ == "__main__":
    main()
