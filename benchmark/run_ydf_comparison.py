#!/usr/bin/env python3

"""Compare dtree with YDF's oblique-tree inference implementations."""

import argparse
import csv
import io
import os
import random
import statistics
import subprocess
import tempfile
from collections import deque
from dataclasses import dataclass
from pathlib import Path

import numpy as np
import ydf
from ydf.model import tree as ydf_tree

from run_benchmarks import TIMER_PATTERN, SplitMix64, list_literal
from run_small_feature_benchmark import median_absolute_deviation

MODULUS = 65_521
HALF_RANGE = np.float32(32_760.0)
WEIGHT_VALUES = (-1.0, -0.5, -0.25, -0.125, 0.125, 0.25, 0.5, 1.0)


@dataclass
class Leaf:
    value: float = 0.0
    index: int = -1


@dataclass
class Node:
    weights: tuple[float, ...]
    threshold: float
    below: object = None
    above: object = None
    index: int = -1


@dataclass(frozen=True)
class Case:
    name: str
    dimensions: int
    depth: int
    shape: str = "full"
    below_fraction: float = 0.5


@dataclass
class CompiledCase:
    case: Case
    root: Node
    nodes: list[Node]
    leaves: list[Leaf]
    feature_parameters: list[tuple[int, int]]
    model: ydf.GenericModel
    standalone_header: str


def parse_integer_list(value):
    result = tuple(int(item) for item in value.split(",") if item)
    if not result or any(item <= 0 for item in result):
        raise argparse.ArgumentTypeError("expected comma-separated positive integers")
    return result


def benchmark_cases(dimensions, depths, include_shape_cases):
    result = [
        Case(f"n{dimension}_d{depth}_full_50", dimension, depth)
        for dimension in dimensions
        for depth in depths
    ]
    if include_shape_cases and 3 in dimensions and 10 in depths:
        result.extend(
            (
                Case("n3_d10_full_85", 3, 10, "full", 0.85),
                Case("n3_d10_variable_50", 3, 10, "variable", 0.50),
                Case("n3_d10_variable_85", 3, 10, "variable", 0.85),
            )
        )
    return result


def case_seed(seed, case):
    shape = 1 if case.shape == "variable" else 0
    balance = round(case.below_fraction * 10_000)
    return (
        seed
        + case.dimensions * 1_000_003
        + case.depth * 10_007
        + shape * 10_009
        + balance
    )


def make_feature_parameters(dimensions, seed):
    rng = SplitMix64(seed ^ 0xA0761D6478BD642F)
    return [
        (1 + rng.next() % (MODULUS - 1), rng.next() % MODULUS)
        for _ in range(dimensions)
    ]


def make_features(rows, parameters):
    row = np.arange(rows, dtype=np.uint64)
    columns = []
    for multiplier, offset in parameters:
        integer = (row * np.uint64(multiplier) + np.uint64(offset)) % MODULUS
        columns.append(integer.astype(np.float32) / HALF_RANGE - np.float32(1.0))
    return np.column_stack(columns)


def make_weights(seed, heap_index, dimensions):
    rng = SplitMix64(seed ^ (heap_index * 0x9E3779B97F4A7C15))
    return tuple(
        WEIGHT_VALUES[rng.next() % len(WEIGHT_VALUES)] for _ in range(dimensions)
    )


def make_tree(case, features, seed):
    shape_rng = SplitMix64(seed ^ 0xE7037ED1A0B428DB)

    def build(level, heap_index, rows):
        if level == case.depth:
            return Leaf()
        if (
            case.shape == "variable"
            and level >= max(1, case.depth - 3)
            and shape_rng.next() % 5 == 0
        ):
            return Leaf()

        weights = make_weights(seed, heap_index, case.dimensions)
        if len(rows):
            scores = np.zeros(len(rows), dtype=np.float32)
            for feature, weight in enumerate(weights):
                scores += np.float32(weight) * features[rows, feature]
        else:
            scores = np.empty(0, dtype=np.float32)

        if len(rows) >= 2:
            below_count = round(case.below_fraction * len(rows))
            below_count = max(1, min(len(rows) - 1, below_count))
            ordered_scores = np.sort(scores)
            while (
                below_count < len(rows)
                and ordered_scores[below_count - 1] == ordered_scores[below_count]
            ):
                below_count += 1
            if below_count == len(rows):
                below_count = int(
                    np.searchsorted(
                        ordered_scores,
                        ordered_scores[round(case.below_fraction * len(rows))],
                        side="left",
                    )
                )
            threshold = (
                float(ordered_scores[below_count - 1])
                + float(ordered_scores[below_count])
            ) / 2
        else:
            threshold = 0.0

        # YDF's dependency-free C++ exporter emits floats with six significant
        # digits. Use that precision in every implementation being compared.
        threshold = float(np.float32(f"{threshold:.6g}"))
        below_mask = scores < np.float32(threshold)
        below_rows = rows[below_mask]
        above_rows = rows[~below_mask]

        node = Node(weights, threshold)
        node.below = build(level + 1, heap_index * 2 + 1, below_rows)
        node.above = build(level + 1, heap_index * 2 + 2, above_rows)
        return node

    return build(0, 0, np.arange(len(features), dtype=np.int64))


def index_tree(root):
    nodes = []
    leaves = []
    pending = deque((root,))
    while pending:
        value = pending.popleft()
        if isinstance(value, Leaf):
            value.index = len(leaves)
            value.value = float(value.index)
            leaves.append(value)
        else:
            value.index = len(nodes)
            nodes.append(value)
            pending.extend((value.below, value.above))
    return nodes, leaves


def feature_depths(root):
    depths = []

    def visit(value, depth):
        if isinstance(value, Leaf):
            depths.append(depth)
            return
        visit(value.below, depth + 1)
        visit(value.above, depth + 1)

    visit(root, 0)
    return depths


def evaluate_tree(root, features):
    result = np.empty(len(features), dtype=np.float32)
    for row in range(len(features)):
        value = root
        while isinstance(value, Node):
            score = np.float32(0.0)
            for feature, weight in enumerate(value.weights):
                score += np.float32(weight) * features[row, feature]
            value = value.above if score >= np.float32(value.threshold) else value.below
        result[row] = np.float32(value.value)
    return result


def make_ydf_model(case, root):
    feature_names = [f"x{feature}" for feature in range(case.dimensions)]
    training_data = {
        name: np.array([-1.0, 0.0, 1.0, 2.0], dtype=np.float32)
        for name in feature_names
    }
    training_data["label"] = np.arange(4, dtype=np.float32)
    previous_verbosity = ydf.verbose(0)
    try:
        model = ydf.RandomForestLearner(
            label="label",
            task=ydf.Task.REGRESSION,
            features=feature_names,
            num_trees=1,
            max_depth=2,
            min_examples=1,
            bootstrap_training_dataset=False,
            compute_oob_performances=False,
            num_threads=1,
        ).train(training_data)
    finally:
        ydf.verbose(previous_verbosity)

    data_spec = model.data_spec()
    attribute_by_name = {
        column.name: index for index, column in enumerate(data_spec.columns)
    }
    attributes = [attribute_by_name[name] for name in feature_names]

    def convert(value):
        if isinstance(value, Leaf):
            return ydf_tree.Leaf(
                ydf_tree.RegressionValue(num_examples=1.0, value=value.value)
            )
        condition = ydf_tree.NumericalSparseObliqueCondition(
            missing=False,
            score=0.0,
            attributes=attributes,
            weights=value.weights,
            threshold=value.threshold,
            na_replacements=[],
        )
        return ydf_tree.NonLeaf(
            value=None,
            condition=condition,
            pos_child=convert(value.above),
            neg_child=convert(value.below),
        )

    model.set_tree(0, ydf_tree.Tree(convert(root)))
    engines = list(model.list_compatible_engines())
    if engines != ["RandomForestGeneric"]:
        raise RuntimeError(f"unexpected YDF engines for {case.name}: {engines}")
    return model


def verify_ydf_model(compiled_case, rows):
    features = make_features(rows, compiled_case.feature_parameters)
    dataset = {
        f"x{feature}": features[:, feature]
        for feature in range(compiled_case.case.dimensions)
    }
    expected = evaluate_tree(compiled_case.root, features)
    actual = compiled_case.model.predict(dataset)
    if not np.array_equal(actual, expected):
        mismatch = int(np.flatnonzero(actual != expected)[0])
        raise RuntimeError(
            f"YDF mismatch for {compiled_case.case.name} at row {mismatch}: "
            f"expected {expected[mismatch]}, got {actual[mismatch]}"
        )


def cpp_float(value):
    if value == 0:
        return "0.0f"
    literal = f"{value:.9g}"
    if "." not in literal and "e" not in literal:
        literal += ".0"
    return literal + "f"


def raw_reference(value):
    if isinstance(value, Leaf):
        return -value.index - 1
    return value.index


CPP_PREAMBLE = r"""
#include <algorithm>
#include <array>
#include <chrono>
#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <random>
#include <vector>

constexpr std::size_t kBlockSize = 8;
constexpr std::uint64_t kModulus = 65521;
constexpr float kHalfRange = 32760.0f;
using Clock = std::chrono::steady_clock;

template <std::size_t N>
struct RawNode {
    std::array<float, N> weights;
    float threshold;
    std::array<std::int32_t, 2> children;
};

template <std::size_t FEATURE, std::size_t N>
inline void Accumulate(float &score, const RawNode<N> &node,
                       const std::array<float, N> &point) {
    if constexpr (FEATURE < N) {
        score += node.weights[FEATURE] * point[FEATURE];
        Accumulate<FEATURE + 1>(score, node, point);
    }
}

template <std::size_t N>
inline std::uint32_t AdvanceImplicit(const RawNode<N> *nodes,
                                     const std::array<float, N> &point,
                                     std::uint32_t reference) {
    const auto &node = nodes[reference];
    float score = node.weights[0] * point[0];
    Accumulate<1>(score, node, point);
    return 2 * reference + 1 + static_cast<std::uint32_t>(score >= node.threshold);
}

template <std::size_t N>
inline std::int32_t AdvanceExplicit(const RawNode<N> *nodes,
                                    const std::array<float, N> &point,
                                    std::uint32_t reference) {
    const auto &node = nodes[reference];
    float score = node.weights[0] * point[0];
    Accumulate<1>(score, node, point);
    return node.children[static_cast<std::size_t>(score >= node.threshold)];
}

template <std::size_t N>
__attribute__((noinline))
void EvaluateRaw(const RawNode<N> *nodes, const float *leaves,
                 std::size_t node_count, std::size_t depth, bool fixed_depth,
                 const std::vector<std::array<float, N>> &points,
                 std::vector<float> &output) {
    std::size_t row = 0;
    if (fixed_depth) {
        for (; row + kBlockSize <= points.size(); row += kBlockSize) {
            std::uint32_t references[kBlockSize] {};
            for (std::size_t level = 0; level < depth; ++level) {
#pragma GCC unroll 8
                for (std::size_t lane = 0; lane < kBlockSize; ++lane) {
                    references[lane] = AdvanceImplicit(
                        nodes, points[row + lane], references[lane]);
                }
            }
#pragma GCC unroll 8
            for (std::size_t lane = 0; lane < kBlockSize; ++lane) {
                output[row + lane] = leaves[references[lane] - node_count];
            }
        }
        for (; row < points.size(); ++row) {
            std::uint32_t reference = 0;
            for (std::size_t level = 0; level < depth; ++level) {
                reference = AdvanceImplicit(nodes, points[row], reference);
            }
            output[row] = leaves[reference - node_count];
        }
        return;
    }

    for (; row + kBlockSize <= points.size(); row += kBlockSize) {
        std::int32_t references[kBlockSize] {};
        std::uint8_t active = UINT8_C(0xff);
        while (active) {
            std::uint8_t next_active = 0;
#pragma GCC unroll 8
            for (std::size_t lane = 0; lane < kBlockSize; ++lane) {
                const auto lane_bit = static_cast<std::uint8_t>(1U << lane);
                if (active & lane_bit) {
                    references[lane] = AdvanceExplicit(
                        nodes, points[row + lane],
                        static_cast<std::uint32_t>(references[lane]));
                    if (references[lane] >= 0) {
                        next_active |= lane_bit;
                    }
                }
            }
            active = next_active;
        }
#pragma GCC unroll 8
        for (std::size_t lane = 0; lane < kBlockSize; ++lane) {
            output[row + lane] = leaves[-references[lane] - 1];
        }
    }
    for (; row < points.size(); ++row) {
        std::int32_t reference = 0;
        while (reference >= 0) {
            reference = AdvanceExplicit(
                nodes, points[row], static_cast<std::uint32_t>(reference));
        }
        output[row] = leaves[-reference - 1];
    }
}

struct Timing {
    double median_ns;
    double mad_ns;
};

Timing Summarize(std::vector<double> samples) {
    std::sort(samples.begin(), samples.end());
    const auto middle = samples.size() / 2;
    const double median = samples.size() % 2
                              ? samples[middle]
                              : (samples[middle - 1] + samples[middle]) / 2;
    std::vector<double> deviations;
    deviations.reserve(samples.size());
    for (const auto sample : samples) {
        deviations.push_back(std::abs(sample - median));
    }
    std::sort(deviations.begin(), deviations.end());
    const auto deviation_middle = deviations.size() / 2;
    const double mad = deviations.size() % 2
                           ? deviations[deviation_middle]
                           : (deviations[deviation_middle - 1] +
                              deviations[deviation_middle]) /
                                 2;
    return {median, mad};
}

template <class FIRST, class SECOND>
std::array<Timing, 2> MeasurePair(FIRST &&first, SECOND &&second,
                                  std::size_t rows, int warmups, int runs,
                                  std::uint64_t seed,
                                  volatile float &sink) {
    std::array<std::vector<double>, 2> samples;
    std::mt19937_64 ordering(seed);
    for (int round = 0; round < warmups + runs; ++round) {
        const bool keep = round >= warmups;
        const bool reverse = (ordering() & 1U) != 0;
        for (int position = 0; position < 2; ++position) {
            const int method = reverse ? 1 - position : position;
            const auto begin = Clock::now();
            const float value = method == 0 ? first() : second();
            const auto end = Clock::now();
            sink = sink + value;
            if (keep) {
                samples[method].push_back(
                    std::chrono::duration<double, std::nano>(end - begin)
                        .count() /
                    static_cast<double>(rows));
            }
        }
    }
    return {Summarize(std::move(samples[0])),
            Summarize(std::move(samples[1]))};
}
"""


def cpp_node_literal(node):
    weights = ",".join(cpp_float(weight) for weight in node.weights)
    children = f"{raw_reference(node.below)},{raw_reference(node.above)}"
    return f"{{{{{weights}}},{cpp_float(node.threshold)},{{{{{children}}}}}}}"


def cpp_case_source(compiled_case):
    case = compiled_case.case
    namespace = f"ydf_{case.name}"
    nodes = ",\n".join(cpp_node_literal(node) for node in compiled_case.nodes)
    leaves = ",".join(cpp_float(leaf.value) for leaf in compiled_case.leaves)
    point_values = ",".join(f"point[{feature}]" for feature in range(case.dimensions))
    parameters = ",".join(
        f"{{{{UINT64_C({multiplier}),UINT64_C({offset})}}}}"
        for multiplier, offset in compiled_case.feature_parameters
    )
    depths = feature_depths(compiled_case.root)
    fixed_depth = "true" if min(depths) == max(depths) else "false"
    return f"""
static const RawNode<{case.dimensions}> raw_nodes_{case.name}[] = {{
{nodes}
}};
static const float raw_leaves_{case.name}[] = {{{leaves}}};
static const std::array<std::array<std::uint64_t, 2>, {case.dimensions}>
    feature_parameters_{case.name} = {{{{{parameters}}}}};

static void Run_{case.name}(std::size_t rows, int warmups, int runs) {{
    using Instance = {namespace}::Instance;
    static_assert(sizeof(Instance) == {case.dimensions} * sizeof(float));
    std::vector<std::array<float, {case.dimensions}>> raw_points(rows);
    std::vector<Instance> ydf_points;
    ydf_points.reserve(rows);
    for (std::size_t row_idx = 0; row_idx < rows; ++row_idx) {{
        auto &point = raw_points[row_idx];
        for (std::size_t feature = 0; feature < {case.dimensions}; ++feature) {{
            const auto &parameter = feature_parameters_{case.name}[feature];
            const auto integer =
                (row_idx * parameter[0] + parameter[1]) % kModulus;
            point[feature] = static_cast<float>(integer) / kHalfRange - 1.0f;
        }}
        ydf_points.push_back(Instance{{{point_values}}});
    }}

    std::vector<float> raw_output(rows);
    std::vector<float> ydf_output(rows);
    const auto raw = [&]() -> float {{
        EvaluateRaw(raw_nodes_{case.name}, raw_leaves_{case.name},
                    {len(compiled_case.nodes)}, {case.depth}, {fixed_depth},
                    raw_points, raw_output);
        return raw_output[rows / 2];
    }};
    const auto ydf = [&]() -> float {{
        for (std::size_t row_idx = 0; row_idx < rows; ++row_idx) {{
            ydf_output[row_idx] =
                {namespace}::PredictUnsafe(ydf_points[row_idx]);
        }}
        return ydf_output[rows / 2];
    }};

    raw();
    ydf();
    std::uint64_t sum = 0;
    std::uint64_t weighted_sum = 0;
    for (std::size_t row_idx = 0; row_idx < rows; ++row_idx) {{
        if (raw_output[row_idx] != ydf_output[row_idx]) {{
            std::fprintf(stderr,
                         "{case.name}: mismatch at %zu: raw=%g ydf=%g\\n",
                         row_idx, raw_output[row_idx], ydf_output[row_idx]);
            std::exit(2);
        }}
        const auto value = static_cast<std::uint64_t>(raw_output[row_idx]);
        sum += value;
        weighted_sum += value * (row_idx % kModulus + 1);
    }}

    volatile float sink = 0.0f;
    const auto timings = MeasurePair(raw, ydf, rows, warmups, runs,
                                     UINT64_C(0x12345678), sink);
    const auto &raw_timing = timings[0];
    const auto &ydf_timing = timings[1];
    std::printf("{case.name},raw_cpp,%.9f,%.9f,%llu,%llu\\n",
                raw_timing.median_ns, raw_timing.mad_ns,
                static_cast<unsigned long long>(sum),
                static_cast<unsigned long long>(weighted_sum));
    std::printf("{case.name},ydf_standalone,%.9f,%.9f,%llu,%llu\\n",
                ydf_timing.median_ns, ydf_timing.mad_ns,
                static_cast<unsigned long long>(sum),
                static_cast<unsigned long long>(weighted_sum));
    if (sink == -1.0f) {{
        std::fprintf(stderr, "unreachable %g\\n", sink);
    }}
}}
"""


def tree_literal(compiled_case):
    weight_rows = list_literal(
        list_literal(f"{cpp_float(weight)[:-1]}::FLOAT" for weight in node.weights)
        for node in compiled_case.nodes
    )
    thresholds = list_literal(
        f"{cpp_float(node.threshold)[:-1]}::FLOAT" for node in compiled_case.nodes
    )
    children = list_literal(
        f"[{raw_reference(node.above) + 1 if isinstance(node.above, Node) else raw_reference(node.above)},"
        f"{raw_reference(node.below) + 1 if isinstance(node.below, Node) else raw_reference(node.below)}]"
        for node in compiled_case.nodes
    )
    values = list_literal(
        f"{cpp_float(leaf.value)[:-1]}::FLOAT" for leaf in compiled_case.leaves
    )
    return (
        f"{{weights:{weight_rows},thresholds:{thresholds},children:{children},"
        f"values:{values}}}"
    )


def feature_table_sql(rows, compiled_case):
    expressions = []
    for feature, (multiplier, offset) in enumerate(compiled_case.feature_parameters):
        expressions.append(
            f"(((i::UBIGINT * {multiplier}::UBIGINT + {offset}::UBIGINT) "
            f"% {MODULUS})::FLOAT / {float(HALF_RANGE):.1f}::FLOAT "
            f"- 1.0::FLOAT) AS x{feature}"
        )
    feature_names = [f"x{feature}" for feature in range(compiled_case.case.dimensions)]
    array = f"[{','.join(feature_names)}]::FLOAT[{len(feature_names)}]"
    return f"""
CREATE TEMP TABLE features AS
WITH generated AS (
    SELECT i, {','.join(expressions)}
    FROM range({rows}) AS input(i)
)
SELECT *, {array} AS features
FROM generated;
"""


def duckdb_sql(compiled_case, rows, warmups, runs, seed):
    case = compiled_case.case
    feature_names = [f"x{feature}" for feature in range(case.dimensions)]
    calls = {
        "dtree_variadic": (
            f"decision_tree(comparison_tree(), {','.join(feature_names)})"
        ),
        "dtree_array": "decision_tree(comparison_tree(), features)",
    }
    lines = [
        ".mode csv",
        ".headers off",
        ".echo off",
        "LOAD dtree;",
        "PRAGMA threads=1;",
        "PRAGMA preserve_insertion_order=false;",
        feature_table_sql(rows, compiled_case),
        f"CREATE MACRO comparison_tree() AS {tree_literal(compiled_case)};",
    ]
    signature = (
        "count(*),sum(value)::HUGEINT,"
        f"sum(value::HUGEINT * (i % {MODULUS} + 1))::HUGEINT"
    )
    for method, call in calls.items():
        lines.append(
            f"SELECT 'verify_{method}',{signature} "
            f"FROM (SELECT i,{call} AS value FROM features);"
        )
        lines.append(
            f"PREPARE {method} AS SELECT '{method}',sum({call})::HUGEINT "
            "FROM features;"
        )

    executions = []
    ordering = random.Random(seed)
    lines.append(".timer on")
    for phase, rounds in (("warmup", warmups), ("measured", runs)):
        for _ in range(rounds):
            methods = list(calls)
            ordering.shuffle(methods)
            for method in methods:
                executions.append((phase, method))
                lines.append(f"EXECUTE {method};")
    lines.append(".timer off")
    return "\n".join(lines) + "\n", executions


def run_duckdb(compiled_case, binary, rows, warmups, runs, seed, timeout):
    sql, executions = duckdb_sql(compiled_case, rows, warmups, runs, seed)
    process = subprocess.run(
        [str(binary), "-batch"],
        input=sql,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        timeout=timeout,
        check=False,
    )
    if process.returncode:
        raise RuntimeError(
            f"DuckDB failed for {compiled_case.case.name}:\n{process.stdout}"
        )

    signatures = {}
    result_counts = {"dtree_variadic": 0, "dtree_array": 0}
    result_sums = {method: set() for method in result_counts}
    for record in csv.reader(io.StringIO(process.stdout)):
        if len(record) == 4 and record[0].startswith("verify_"):
            label = record[0]
            signatures[label.removeprefix("verify_")] = tuple(
                int(value) for value in record[1:]
            )
        elif len(record) == 2 and record[0] in result_counts:
            result_counts[record[0]] += 1
            result_sums[record[0]].add(int(record[1]))

    if set(signatures) != set(result_counts):
        raise RuntimeError(
            f"missing DuckDB correctness results for {compiled_case.case.name}: "
            f"{signatures}"
        )
    if len(set(signatures.values())) != 1:
        raise RuntimeError(
            f"DuckDB overloads disagree for {compiled_case.case.name}: " f"{signatures}"
        )
    expected_count = warmups + runs
    if any(count != expected_count for count in result_counts.values()):
        raise RuntimeError(
            f"missing DuckDB result rows for {compiled_case.case.name}: "
            f"{result_counts}"
        )
    if any(values != {signatures[method][1]} for method, values in result_sums.items()):
        raise RuntimeError(
            f"unstable DuckDB timed checksums for {compiled_case.case.name}: "
            f"{result_sums}"
        )

    timings = [
        float(match.group(1)) for match in TIMER_PATTERN.finditer(process.stdout)
    ]
    if len(timings) != len(executions):
        raise RuntimeError(
            f"expected {len(executions)} DuckDB timings for "
            f"{compiled_case.case.name}, found {len(timings)}\n{process.stdout}"
        )
    samples = {method: [] for method in result_counts}
    for (phase, method), elapsed in zip(executions, timings):
        if phase == "measured":
            samples[method].append(elapsed * 1e9 / rows)
    return {
        method: (statistics.median(values), median_absolute_deviation(values))
        for method, values in samples.items()
    }, next(iter(signatures.values()))


def standalone_source(compiled_cases):
    includes = "\n".join(
        f'#include "ydf_{compiled.case.name}.h"' for compiled in compiled_cases
    )
    case_sources = "\n".join(cpp_case_source(compiled) for compiled in compiled_cases)
    calls = "\n".join(
        f"    Run_{compiled.case.name}(rows, warmups, runs);"
        for compiled in compiled_cases
    )
    return f"""{CPP_PREAMBLE}
{includes}
{case_sources}

int main(int argc, char **argv) {{
    if (argc != 4) {{
        std::fprintf(stderr, "usage: %s ROWS WARMUPS RUNS\\n", argv[0]);
        return 2;
    }}
    const auto rows = static_cast<std::size_t>(std::strtoull(argv[1], nullptr, 10));
    const int warmups = std::atoi(argv[2]);
    const int runs = std::atoi(argv[3]);
    std::puts("case,method,median_ns_per_row,mad_ns_per_row,sum,weighted_sum");
{calls}
}}
"""


def run_standalone(compiled_cases, compiler, rows, warmups, runs, timeout):
    with tempfile.TemporaryDirectory(prefix="dtree-ydf-") as directory_name:
        directory = Path(directory_name)
        for compiled in compiled_cases:
            (directory / f"ydf_{compiled.case.name}.h").write_text(
                compiled.standalone_header
            )
        source = directory / "comparison.cpp"
        source.write_text(standalone_source(compiled_cases))
        binary = directory / "comparison"
        compile_process = subprocess.run(
            [
                compiler,
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
            stderr=subprocess.STDOUT,
            timeout=timeout,
            check=False,
        )
        if compile_process.returncode:
            raise RuntimeError(
                f"standalone compilation failed:\n{compile_process.stdout}"
            )
        benchmark_process = subprocess.run(
            [str(binary), str(rows), str(warmups), str(runs)],
            text=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            timeout=timeout,
            check=False,
        )
        if benchmark_process.returncode:
            raise RuntimeError(
                f"standalone benchmark failed:\n{benchmark_process.stdout}"
            )

    results = {}
    signatures = {}
    for record in csv.reader(io.StringIO(benchmark_process.stdout)):
        if len(record) != 6 or record[0] == "case":
            continue
        case_name, method = record[:2]
        results[(case_name, method)] = (float(record[2]), float(record[3]))
        signature = (rows, int(record[4]), int(record[5]))
        previous = signatures.setdefault(case_name, signature)
        if signature != previous:
            raise RuntimeError(f"standalone methods disagree for {case_name}")
    expected = {
        (compiled.case.name, method)
        for compiled in compiled_cases
        for method in ("raw_cpp", "ydf_standalone")
    }
    if set(results) != expected:
        raise RuntimeError(
            f"missing standalone results: {sorted(expected - set(results))}"
        )
    return results, signatures


def run_ydf_engine(compiled_case, rows, batch_size, warmup, duration, runs):
    features = make_features(rows, compiled_case.feature_parameters)
    dataset = {
        f"x{feature}": features[:, feature]
        for feature in range(compiled_case.case.dimensions)
    }
    samples = []
    for _ in range(runs):
        result = compiled_case.model.benchmark(
            dataset,
            benchmark_duration=duration,
            warmup_duration=warmup,
            batch_size=batch_size,
            num_threads=1,
        )
        samples.append(result.duration_per_example * 1e9)
    return statistics.median(samples), median_absolute_deviation(samples)


def compile_cases(cases, calibration_rows, correctness_rows, seed):
    result = []
    features_by_dimension = {}
    parameters_by_dimension = {}
    for case in cases:
        if case.dimensions not in features_by_dimension:
            parameters = make_feature_parameters(
                case.dimensions, seed + case.dimensions * 1009
            )
            parameters_by_dimension[case.dimensions] = parameters
            features_by_dimension[case.dimensions] = make_features(
                calibration_rows, parameters
            )
        root = make_tree(
            case,
            features_by_dimension[case.dimensions],
            case_seed(seed, case),
        )
        nodes, leaves = index_tree(root)
        model = make_ydf_model(case, root)
        compiled = CompiledCase(
            case=case,
            root=root,
            nodes=nodes,
            leaves=leaves,
            feature_parameters=parameters_by_dimension[case.dimensions],
            model=model,
            standalone_header=model.to_standalone_cc(
                name=f"ydf_{case.name}", algorithm="ROUTING"
            ),
        )
        verify_ydf_model(compiled, correctness_rows)
        result.append(compiled)
    return result


def print_results(compiled_cases, results):
    print(
        "| Case | Shape | Nodes | Leaves | Path depth | Raw C++ | "
        "YDF standalone | YDF engine | dtree args | dtree ARRAY |"
    )
    print("|---|---|---:|---:|---:|---:|---:|---:|---:|---:|")
    for compiled in compiled_cases:
        depths = feature_depths(compiled.root)
        path_depth = (
            str(depths[0])
            if min(depths) == max(depths)
            else f"{min(depths)}-{max(depths)}"
        )

        def cell(method):
            median, mad = results[(compiled.case.name, method)]
            return f"{median:.2f} ± {mad:.2f}"

        print(
            f"| {compiled.case.name} | {compiled.case.shape}/"
            f"{compiled.case.below_fraction:.2f} | {len(compiled.nodes)} | "
            f"{len(compiled.leaves)} | {path_depth} | {cell('raw_cpp')} | "
            f"{cell('ydf_standalone')} | {cell('ydf_engine')} | "
            f"{cell('dtree_variadic')} | {cell('dtree_array')} |"
        )
    print("\nTimes are median ± MAD in ns/row.")
    print(
        "Raw C++ and YDF standalone are kernel-only. YDF engine and dtree "
        "include their framework overhead; dtree also includes scan and sum."
    )


def main():
    parser = argparse.ArgumentParser(
        description="Compare dtree with YDF oblique-tree inference"
    )
    parser.add_argument("--duckdb", type=Path, required=True)
    parser.add_argument("--compiler", default="c++")
    parser.add_argument(
        "--dimensions", type=parse_integer_list, default=(1, 2, 3, 5, 8, 10)
    )
    parser.add_argument("--depths", type=parse_integer_list, default=(3, 5, 7, 10))
    parser.add_argument("--rows", type=int, default=3_000_000)
    parser.add_argument("--calibration-rows", type=int, default=65_521)
    parser.add_argument("--correctness-rows", type=int, default=4_097)
    parser.add_argument("--warmups", type=int, default=3)
    parser.add_argument("--runs", type=int, default=11)
    parser.add_argument("--ydf-rows", type=int, default=65_521)
    parser.add_argument("--ydf-batch-size", type=int, default=2_048)
    parser.add_argument("--ydf-warmup", type=float, default=0.25)
    parser.add_argument("--ydf-duration", type=float, default=0.5)
    parser.add_argument("--ydf-runs", type=int, default=3)
    parser.add_argument("--seed", type=int, default=20_260_908)
    parser.add_argument("--timeout", type=int, default=1_800)
    parser.add_argument("--no-shape-cases", action="store_true")
    args = parser.parse_args()
    if not args.duckdb.is_file():
        parser.error(f"DuckDB executable does not exist: {args.duckdb}")
    if (
        min(
            args.rows,
            args.calibration_rows,
            args.correctness_rows,
            args.warmups,
            args.runs,
            args.ydf_rows,
            args.ydf_batch_size,
            args.ydf_runs,
        )
        <= 0
    ):
        parser.error("row counts, batch size, warmups, and runs must be positive")
    if args.ydf_warmup <= 0 or args.ydf_duration <= 0:
        parser.error("YDF warmup and benchmark durations must be positive")

    available_cpus = os.sched_getaffinity(0)
    cpu = min(available_cpus)
    os.sched_setaffinity(0, {cpu})
    cases = benchmark_cases(args.dimensions, args.depths, not args.no_shape_cases)
    print(
        f"CPU {cpu}; YDF {ydf.__version__}; "
        f"building {len(cases)} equivalent oblique-tree cases...",
        flush=True,
    )
    compiled_cases = compile_cases(
        cases, args.calibration_rows, args.correctness_rows, args.seed
    )

    print("Compiling and running standalone C++ comparisons...", flush=True)
    results, standalone_signatures = run_standalone(
        compiled_cases,
        args.compiler,
        args.rows,
        args.warmups,
        args.runs,
        args.timeout,
    )
    print("Running YDF C++ engine and DuckDB comparisons...", flush=True)
    for compiled in compiled_cases:
        name = compiled.case.name
        results[(name, "ydf_engine")] = run_ydf_engine(
            compiled,
            args.ydf_rows,
            args.ydf_batch_size,
            args.ydf_warmup,
            args.ydf_duration,
            args.ydf_runs,
        )
        duckdb_results, duckdb_signature = run_duckdb(
            compiled,
            args.duckdb,
            args.rows,
            args.warmups,
            args.runs,
            case_seed(args.seed, compiled.case),
            args.timeout,
        )
        if duckdb_signature != standalone_signatures[name]:
            raise RuntimeError(
                f"DuckDB and C++ disagree for {name}: "
                f"{duckdb_signature} != {standalone_signatures[name]}"
            )
        for method, timing in duckdb_results.items():
            results[(name, method)] = timing
        print(f"  completed {name}", flush=True)

    print_results(compiled_cases, results)


if __name__ == "__main__":
    main()
