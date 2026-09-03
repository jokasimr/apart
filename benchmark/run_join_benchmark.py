#!/usr/bin/env python3

import argparse
import csv
import io
import platform
import random
import re
import statistics
import subprocess
from datetime import datetime
from pathlib import Path


LOOKUPS = {10_000: 100, 30_000: 150}
TIMER_PATTERN = re.compile(r"Run Time.*?real\s+([0-9]+(?:\.[0-9]+)?)")


def expected_checksum(rows, lookup_size):
    cycles, remainder = divmod(rows, lookup_size)
    id_sum = cycles * lookup_size * (lookup_size - 1) // 2
    id_sum += sum((row * 7919 + 17) % lookup_size for row in range(remainder))
    return 3 * id_sum + rows


def build_sql(rows, warmups, runs, seed):
    lines = [
        ".mode csv",
        ".headers off",
        ".echo off",
        "PRAGMA threads=1;",
        "PRAGMA preserve_insertion_order=false;",
        "SELECT 'duckdb_version', version();",
    ]

    for lookup_size, width in LOOKUPS.items():
        lines.extend(
            (
                f"CREATE TABLE lookup_{lookup_size} AS "
                f"SELECT (i // {width})::INTEGER AS k1, "
                f"(i % {width})::INTEGER AS k2, "
                f"(i * 3 + 1)::INTEGER AS payload "
                f"FROM range({lookup_size}) AS source(i);",
                f"CREATE TABLE events_{lookup_size} AS "
                f"WITH keyed AS (SELECT ((i * 7919 + 17) % {lookup_size}) AS id "
                f"FROM range({rows}) AS source(i)) "
                f"SELECT (id // {width})::INTEGER AS k1, "
                f"(id % {width})::INTEGER AS k2 FROM keyed;",
                f"ANALYZE lookup_{lookup_size};",
                f"ANALYZE events_{lookup_size};",
                f"SELECT 'lookup_unique_{lookup_size}', count(*), "
                f"count(DISTINCT (k1, k2)) FROM lookup_{lookup_size};",
                f"SELECT 'correctness_{lookup_size}', count(*), "
                f"sum(l.payload)::HUGEINT FROM events_{lookup_size} e "
                f"JOIN lookup_{lookup_size} l ON e.k1 = l.k1 AND e.k2 = l.k2;",
                f"PREPARE join_{lookup_size} AS SELECT 'join_{lookup_size}', "
                f"sum(l.payload)::HUGEINT FROM events_{lookup_size} e "
                f"JOIN lookup_{lookup_size} l ON e.k1 = l.k1 AND e.k2 = l.k2;",
            )
        )

    executions = []
    ordering = random.Random(seed)
    lines.append(".timer on")
    for phase, round_count in (("warmup", warmups), ("measured", runs)):
        for _ in range(round_count):
            order = list(LOOKUPS)
            ordering.shuffle(order)
            for lookup_size in order:
                executions.append((phase, lookup_size))
                lines.append(f"EXECUTE join_{lookup_size};")
    lines.append(".timer off")
    return "\n".join(lines) + "\n", executions


def mad(values):
    center = statistics.median(values)
    return statistics.median(abs(value - center) for value in values)


def cpu_name():
    cpuinfo = Path("/proc/cpuinfo")
    if cpuinfo.exists():
        for line in cpuinfo.read_text().splitlines():
            if line.startswith("model name"):
                return line.split(":", 1)[1].strip()
    return platform.processor() or "unknown"


def main():
    parser = argparse.ArgumentParser(description="Benchmark a two-INTEGER-key DuckDB equality join")
    parser.add_argument("--duckdb", type=Path, default=Path("build/release/duckdb"))
    parser.add_argument("--rows", type=int, default=10_000_000)
    parser.add_argument("--warmups", type=int, default=2)
    parser.add_argument("--runs", type=int, default=21)
    parser.add_argument("--seed", type=int, default=20_260_903)
    parser.add_argument("--timeout", type=int, default=1800)
    args = parser.parse_args()
    if args.rows <= 0 or args.warmups < 0 or args.runs < 3:
        parser.error("rows must be positive, warmups non-negative, and runs at least three")
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

    version = "unknown"
    uniqueness = {}
    correctness = {}
    result_checksums = {lookup_size: set() for lookup_size in LOOKUPS}
    for record in csv.reader(io.StringIO(process.stdout)):
        if len(record) == 2 and record[0] == "duckdb_version":
            version = record[1]
        elif len(record) == 3 and record[0].startswith("lookup_unique_"):
            lookup_size = int(record[0].removeprefix("lookup_unique_"))
            uniqueness[lookup_size] = (int(record[1]), int(record[2]))
        elif len(record) == 3 and record[0].startswith("correctness_"):
            lookup_size = int(record[0].removeprefix("correctness_"))
            correctness[lookup_size] = (int(record[1]), int(record[2]))
        elif len(record) == 2 and record[0].startswith("join_"):
            lookup_size = int(record[0].removeprefix("join_"))
            result_checksums[lookup_size].add(int(record[1]))

    for lookup_size in LOOKUPS:
        if uniqueness.get(lookup_size) != (lookup_size, lookup_size):
            raise RuntimeError(f"lookup keys are not unique for size {lookup_size}: {uniqueness}")
        expected = (args.rows, expected_checksum(args.rows, lookup_size))
        if correctness.get(lookup_size) != expected:
            raise RuntimeError(f"join correctness failure for size {lookup_size}: {correctness}")
        if result_checksums[lookup_size] != {expected[1]}:
            raise RuntimeError(f"timed checksum failure for size {lookup_size}: {result_checksums}")

    timings = [float(match.group(1)) for match in TIMER_PATTERN.finditer(process.stdout)]
    if len(timings) != len(executions):
        raise RuntimeError(f"expected {len(executions)} timings, found {len(timings)}")
    samples = {lookup_size: [] for lookup_size in LOOKUPS}
    for (phase, lookup_size), elapsed in zip(executions, timings):
        if phase == "measured":
            samples[lookup_size].append(elapsed)

    print("# DuckDB two-key equality join benchmark")
    print()
    print(f"- Timestamp: {datetime.now().astimezone().isoformat(timespec='seconds')}")
    print(f"- CPU: {cpu_name()}")
    print(f"- Platform: {platform.platform()}")
    print(f"- DuckDB: {version} ({args.duckdb})")
    print(
        f"- Event rows: {args.rows:,}; threads: 1; warmups: {args.warmups}; "
        f"measured rounds: {args.runs}; seed: {args.seed}"
    )
    print("- Statistic: median wall time; dispersion is median absolute deviation (MAD)")
    print()
    print("| Lookup rows | Median (ms) | MAD (ms) | ns/event row | M event rows/s |")
    print("|---:|---:|---:|---:|---:|")
    for lookup_size in LOOKUPS:
        center = statistics.median(samples[lookup_size])
        dispersion = mad(samples[lookup_size])
        print(
            f"| {lookup_size:,} | {center * 1e3:.2f} | {dispersion * 1e3:.2f} | "
            f"{center * 1e9 / args.rows:.2f} | {args.rows / center / 1e6:.2f} |"
        )


if __name__ == "__main__":
    main()
