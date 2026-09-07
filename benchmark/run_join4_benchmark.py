#!/usr/bin/env python3

import argparse
import csv
import io
import re
import statistics
import subprocess
from pathlib import Path


TIMER_PATTERN = re.compile(r"Run Time.*?real\s+([0-9]+(?:\.[0-9]+)?)")


def expected_checksum(rows, lookup_size):
    cycles, remainder = divmod(rows, lookup_size)
    id_sum = cycles * lookup_size * (lookup_size - 1) // 2
    id_sum += sum((row * 7919 + 17) % lookup_size for row in range(remainder))
    return 26 * id_sum + 10 * rows


def build_sql(rows, lookup_size, key_width, warmups, runs):
    query = (
        "SELECT 'result', sum(l.p0 + l.p1 + l.p2 + l.p3)::DOUBLE "
        "FROM events e JOIN lookup l ON e.k1 = l.k1 AND e.k2 = l.k2"
    )
    lines = [
        ".mode csv",
        ".headers off",
        ".echo off",
        "PRAGMA threads=1;",
        "PRAGMA preserve_insertion_order=false;",
        (
            "CREATE TABLE lookup AS SELECT "
            f"(i // {key_width})::INTEGER AS k1, "
            f"(i % {key_width})::INTEGER AS k2, "
            "(i * 3 + 1)::FLOAT AS p0, "
            "(i * 5 + 2)::FLOAT AS p1, "
            "(i * 7 + 3)::FLOAT AS p2, "
            "(i * 11 + 4)::FLOAT AS p3 "
            f"FROM range({lookup_size}) AS source(i);"
        ),
        (
            "CREATE TABLE events AS WITH keyed AS "
            f"(SELECT ((i * 7919 + 17) % {lookup_size}) AS id "
            f"FROM range({rows}) AS source(i)) "
            f"SELECT (id // {key_width})::INTEGER AS k1, "
            f"(id % {key_width})::INTEGER AS k2 FROM keyed;"
        ),
        "ANALYZE lookup;",
        "ANALYZE events;",
        "SELECT 'unique', count(*), count(DISTINCT (k1, k2)) FROM lookup;",
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
        description="Benchmark a two-key join to four FLOAT payload columns"
    )
    parser.add_argument("--duckdb", type=Path, required=True)
    parser.add_argument("--rows", type=int, default=10_000_000)
    parser.add_argument("--lookup-size", type=int, default=28_000)
    parser.add_argument("--key-width", type=int, default=140)
    parser.add_argument("--warmups", type=int, default=3)
    parser.add_argument("--runs", type=int, default=31)
    parser.add_argument("--timeout", type=int, default=1800)
    args = parser.parse_args()
    if not args.duckdb.is_file():
        parser.error(f"DuckDB executable does not exist: {args.duckdb}")

    sql, phases = build_sql(
        args.rows, args.lookup_size, args.key_width, args.warmups, args.runs
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

    uniqueness = None
    correctness = None
    checksums = set()
    for record in csv.reader(io.StringIO(process.stdout)):
        if len(record) == 3 and record[0] == "unique":
            uniqueness = (int(record[1]), int(record[2]))
        elif len(record) == 2 and record[0] == "correctness":
            correctness = int(float(record[1]))
        elif len(record) == 2 and record[0] == "result":
            checksums.add(int(float(record[1])))

    expected = expected_checksum(args.rows, args.lookup_size)
    if uniqueness != (args.lookup_size, args.lookup_size):
        raise RuntimeError(f"lookup keys are not unique: {uniqueness}")
    if correctness != expected or checksums != {expected}:
        raise RuntimeError(
            f"checksum failure: expected={expected}, correctness={correctness}, timed={checksums}"
        )

    timings = [float(match.group(1)) for match in TIMER_PATTERN.finditer(process.stdout)]
    if len(timings) != len(phases):
        raise RuntimeError(f"expected {len(phases)} timings, found {len(timings)}")
    samples = [elapsed for phase, elapsed in zip(phases, timings) if phase == "measured"]
    center = statistics.median(samples)
    dispersion = median_absolute_deviation(samples)

    print("# DuckDB two-key four-FLOAT lookup benchmark")
    print()
    print(
        f"Event rows: {args.rows:,}; lookup rows: {args.lookup_size:,}; "
        f"measured runs: {args.runs}; DuckDB threads: 1"
    )
    print(f"Checksum: {expected}")
    print(f"Median: {center * 1e3:.2f} ms")
    print(f"MAD: {dispersion * 1e3:.2f} ms")
    print(f"Time per row: {center * 1e9 / args.rows:.2f} ns")


if __name__ == "__main__":
    main()
