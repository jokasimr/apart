#!/usr/bin/env python3

import argparse
import csv
import io
import statistics
import subprocess
from pathlib import Path

from run_benchmarks import (
    TIMER_PATTERN,
    float_literal,
    list_literal,
    public_reference,
)
from run_small_feature_benchmark import make_tree, reference_expression


DEPTH = 5
DIMENSIONS = 2
LEAF_COUNT = 1 << DEPTH
FIELD_MULTIPLIERS = (3, 5, 7, 11, 13, 17, 19, 23)
HUGEINT_SCALE = 1 << 64
STRUCT_PAYLOADS = tuple(f"struct{width}" for width in range(1, 9))


def payload_width(payload):
    if payload in ("float", "hugeint"):
        return 1
    for prefix in ("struct", "list", "array"):
        if payload.startswith(prefix):
            return int(payload.removeprefix(prefix))
    raise ValueError(f"unknown payload: {payload}")


def payload_literal(payload, values):
    if payload == "float":
        return values[0]
    if payload.startswith("struct"):
        return "{" + ",".join(
            f"v{field}:{value}" for field, value in enumerate(values)
        ) + "}"
    result = "[" + ",".join(values) + "]"
    if payload.startswith("array"):
        result += f"::FLOAT[{len(values)}]"
    return result


def leaf_element(payload, field):
    if payload.startswith("struct"):
        return f"leaf.v{field}"
    return f"leaf[{field + 1}]"


def leaf_value_literal(payload, leaf_index):
    if payload == "hugeint":
        return (
            f"({leaf_index}::HUGEINT * {HUGEINT_SCALE}::HUGEINT "
            f"+ {leaf_index + 1}::HUGEINT)"
        )
    return payload_literal(
        payload,
        [
            float_literal(leaf_index * FIELD_MULTIPLIERS[field] + field + 1)
        for field in range(payload_width(payload))
        ],
    )


def tree_literal(tree, payload):
    coefficients, thresholds, left_children, right_children = tree
    weight_rows = list_literal(
        list_literal(float_literal(value) for value in row) for row in coefficients
    )
    threshold_values = list_literal(float_literal(value) for value in thresholds)
    child_rows = list_literal(
        f"[{public_reference(above)},{public_reference(below)}]"
        for above, below in zip(right_children, left_children)
    )
    leaf_count = max(
        -reference
        for reference in (*left_children, *right_children)
        if reference < 0
    )
    values = list_literal(
        leaf_value_literal(payload, leaf) for leaf in range(leaf_count)
    )
    return (
        f"{{weights:{weight_rows},thresholds:{threshold_values},children:{child_rows},"
        f"values:{values}}}"
    )


def feature_table_sql(rows):
    return f"""
CREATE TABLE features AS
SELECT
    (((i * 17 + 13) % 2049)::FLOAT / 1024.0::FLOAT - 1.0::FLOAT) AS x0,
    (((i * 29 + 7) % 2049)::FLOAT / 1024.0::FLOAT - 1.0::FLOAT) AS x1
FROM range({rows}) AS input(i);
"""


def build_sql(rows, correctness_rows, warmups, runs, seed, payload, fields, aggregation):
    tree = make_tree(DEPTH, DIMENSIONS, seed)
    tree_sql = tree_literal(tree, payload)
    expected_leaf = reference_expression(tree)
    actual = "decision_tree(tree_n2_d5(), x0, x1)"
    if payload == "float":
        checksum = "sum(leaf)::DOUBLE"
        expected = f"({expected_leaf} * 3 + 1)::FLOAT"
    elif payload == "hugeint":
        checksum = "sum(leaf)::HUGEINT"
        expected = (
            f"(({expected_leaf})::HUGEINT * {HUGEINT_SCALE}::HUGEINT "
            f"+ ({expected_leaf})::HUGEINT + 1::HUGEINT)"
        )
    else:
        elements = [leaf_element(payload, field) for field in range(fields)]
        if aggregation == "row-sum":
            checksum = "sum(" + " + ".join(elements) + ")::DOUBLE"
        elif aggregation == "separate-sums":
            checksum = " + ".join(f"sum({element})::DOUBLE" for element in elements)
        elif aggregation == "list-sum":
            checksum = "sum(list_sum(leaf))::DOUBLE"
        else:
            ones = "[" + ",".join("1::FLOAT" for _ in elements) + "]"
            function = "list_inner_product"
            if payload.startswith("array"):
                ones += f"::FLOAT[{len(elements)}]"
                function = "array_inner_product"
            checksum = f"sum({function}(leaf, {ones}))::DOUBLE"
        expected = payload_literal(
            payload,
            [
                f"({expected_leaf} * {FIELD_MULTIPLIERS[field]} + {field + 1})::FLOAT"
                for field in range(payload_width(payload))
            ],
        )

    lines = [
        ".mode csv",
        ".headers off",
        ".echo off",
        "LOAD dtree;",
        "PRAGMA threads=1;",
        "PRAGMA preserve_insertion_order=false;",
        feature_table_sql(rows),
        f"CREATE MACRO tree_n2_d5() AS {tree_sql};",
        (
            "SELECT 'verify', count(*) FROM "
            f"(SELECT * FROM features LIMIT {correctness_rows}) sample "
            f"WHERE {actual} IS DISTINCT FROM {expected};"
        ),
        (
            "SELECT 'encoding', min(kind), max(kind), count(DISTINCT kind) FROM "
            f"(SELECT vector_type({actual}) AS kind FROM features LIMIT 4096);"
        ),
        (
            f"PREPARE benchmark AS SELECT 'result', {checksum} FROM "
            f"(SELECT {actual} AS leaf FROM features);"
        ),
        ".timer on",
    ]

    phases = []
    schedule = ["warmup"] * warmups + ["measured"] * runs
    for phase in schedule:
        phases.append(phase)
        lines.append("EXECUTE benchmark;")
    lines.append(".timer off")
    return "\n".join(lines) + "\n", phases


def median_absolute_deviation(values):
    center = statistics.median(values)
    return statistics.median(abs(value - center) for value in values)


def main():
    parser = argparse.ArgumentParser(
        description="Benchmark a depth-5 N=2 tree with FLOAT or STRUCT leaves"
    )
    parser.add_argument("--duckdb", type=Path, required=True)
    parser.add_argument("--rows", type=int, default=10_000_000)
    parser.add_argument("--correctness-rows", type=int, default=100_000)
    parser.add_argument("--warmups", type=int, default=3)
    parser.add_argument("--runs", type=int, default=31)
    parser.add_argument("--seed", type=int, default=20_260_903)
    parser.add_argument(
        "--payload",
        choices=("float", "hugeint", *STRUCT_PAYLOADS, "list8", "array8"),
        default="struct4",
    )
    parser.add_argument("--fields", type=int, choices=range(1, 9))
    parser.add_argument(
        "--aggregation",
        choices=("row-sum", "separate-sums", "list-sum", "inner-product"),
        default="row-sum",
    )
    parser.add_argument("--expected-encoding", choices=("dictionary", "flat"))
    parser.add_argument("--timeout", type=int, default=1800)
    args = parser.parse_args()
    if not args.duckdb.is_file():
        parser.error(f"DuckDB executable does not exist: {args.duckdb}")
    fields = args.fields or payload_width(args.payload)
    if fields > payload_width(args.payload):
        parser.error(f"{args.payload} has only {payload_width(args.payload)} field(s)")
    if args.aggregation == "list-sum" and not args.payload.startswith("list"):
        parser.error("list-sum requires a LIST payload")
    if args.aggregation == "inner-product" and not args.payload.startswith(("list", "array")):
        parser.error("inner-product requires a LIST or ARRAY payload")

    sql, phases = build_sql(
        args.rows, args.correctness_rows, args.warmups, args.runs, args.seed, args.payload, fields,
        args.aggregation
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

    verification = None
    encoding = None
    checksums = set()
    for record in csv.reader(io.StringIO(process.stdout)):
        if len(record) == 2 and record[0] == "verify":
            verification = int(record[1])
        elif len(record) == 4 and record[0] == "encoding":
            encoding = (record[1], record[2], int(record[3]))
        elif len(record) == 2 and record[0] == "result":
            checksums.add(record[1])

    if verification != 0:
        raise RuntimeError(f"correctness check failed: {verification}")
    expected_encoding_name = args.expected_encoding
    if expected_encoding_name is None:
        expected_encoding_name = (
            "dictionary" if args.payload.startswith(("list", "array")) else "flat"
        )
    expected_vector_type = (
        "DICTIONARY_VECTOR" if expected_encoding_name == "dictionary" else "FLAT_VECTOR"
    )
    expected_encoding = (expected_vector_type, expected_vector_type, 1)
    if encoding != expected_encoding:
        raise RuntimeError(f"unexpected vector encoding: {encoding}")
    if len(checksums) != 1:
        raise RuntimeError(f"unstable checksum: {checksums}")

    timings = [float(match.group(1)) for match in TIMER_PATTERN.finditer(process.stdout)]
    if len(timings) != len(phases):
        raise RuntimeError(f"expected {len(phases)} timings, found {len(timings)}")
    samples = [elapsed for phase, elapsed in zip(phases, timings) if phase == "measured"]
    center = statistics.median(samples)
    dispersion = median_absolute_deviation(samples)

    print(f"# N=2 depth-5 {args.payload} leaf benchmark")
    print()
    print(f"Rows: {args.rows:,}; leaves: {LEAF_COUNT}; measured runs: {args.runs}")
    if args.payload not in ("float", "hugeint"):
        print(f"Consumed fields: {fields}")
        print(f"Aggregation: {args.aggregation}")
    print(f"Output encoding: {encoding[0]}")
    print(f"Checksum: {next(iter(checksums))}")
    print(f"Median: {center * 1e3:.2f} ms")
    print(f"MAD: {dispersion * 1e3:.2f} ms")
    print(f"Time per row: {center * 1e9 / args.rows:.2f} ns")


if __name__ == "__main__":
    main()
