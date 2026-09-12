#!/usr/bin/env python3

"""Run and publish the Apart traversal benchmark matrix."""

from __future__ import annotations

import argparse
import csv
import html
import io
import json
import os
import platform
import random
import shutil
import statistics
import subprocess
from dataclasses import dataclass
from datetime import datetime, timezone
from pathlib import Path


DEFAULT_FEATURE_COUNTS = (*range(1, 11), 20, 100)
DEFAULT_DEPTHS = tuple(range(1, 11))


@dataclass(frozen=True)
class Case:
    tree_kind: str
    feature_count: int
    depth: int

    @property
    def name(self) -> str:
        return f"{self.tree_kind}_n{self.feature_count}_d{self.depth}"

    @property
    def key(self) -> tuple[str, int, int]:
        return self.tree_kind, self.feature_count, self.depth


def parse_int_list(value: str) -> tuple[int, ...]:
    result = tuple(int(item) for item in value.split(","))
    if not result or any(item < 1 for item in result) or len(set(result)) != len(result):
        raise argparse.ArgumentTypeError("expected unique positive integers separated by commas")
    return result


def fixed_children(depth: int) -> tuple[list[tuple[int, int]], int]:
    node_count = (1 << depth) - 1
    first_leaf_parent = (1 << (depth - 1)) - 1
    children: list[tuple[int, int]] = []
    for node in range(node_count):
        if node < first_leaf_parent:
            children.append((2 * node + 2, 2 * node + 3))
        else:
            leaf = 2 * (node - first_leaf_parent) + 1
            children.append((-leaf, -(leaf + 1)))
    return children, 1 << depth


def variable_children(depth: int) -> tuple[list[tuple[int, int]], int]:
    """Build a tree where approximately half the rows stop at D-1 and half at D."""
    if depth < 2:
        raise ValueError("a variable-depth tree needs a maximum depth of at least 2")

    complete_prefix_nodes = (1 << (depth - 1)) - 1
    frontier_parents = 1 << (depth - 2)
    first_frontier_parent = complete_prefix_nodes - frontier_parents
    children: list[tuple[int, int]] = []
    next_leaf = 1

    for node in range(complete_prefix_nodes):
        if node < first_frontier_parent:
            children.append((2 * node + 2, 2 * node + 3))
            continue

        parent = node - first_frontier_parent
        deep_child = complete_prefix_nodes + parent + 1
        shallow_child = -next_leaf
        next_leaf += 1
        children.append((deep_child, shallow_child) if parent % 2 == 0 else (shallow_child, deep_child))

    for _ in range(frontier_parents):
        children.append((-next_leaf, -(next_leaf + 1)))
        next_leaf += 2

    return children, next_leaf - 1


def children_literal(children: list[tuple[int, int]]) -> str:
    return "[" + ",".join(f"[{above},{below}]" for above, below in children) + "]"


def tree_literal(case: Case, seed: int) -> str:
    if case.tree_kind == "fixed":
        children, leaf_count = fixed_children(case.depth)
    else:
        children, leaf_count = variable_children(case.depth)
    node_count = len(children)
    case_seed = seed + case.feature_count * 1009 + case.depth * 9176
    weights = (
        f"list_transform(range({node_count}), lambda node: "
        f"list_transform(range({case.feature_count}), lambda feature: "
        f"((CASE WHEN hash(node*1000003+feature*9176+{case_seed})%2=0 THEN 1 ELSE -1 END)"
        f"*(1+hash(node*9176+feature*1000003+{case_seed + 97})%4))::FLOAT))"
    )
    return (
        "{weights:"
        + weights
        + f",thresholds:list_transform(range({node_count}),lambda i:0.0::FLOAT)"
        + ",children:"
        + children_literal(children)
        + f",values:range({leaf_count})}}"
    )


def default_row_count(feature_count: int) -> int:
    if feature_count <= 5:
        return 20_000_000
    if feature_count <= 10:
        return 10_000_000
    if feature_count <= 20:
        return 4_000_000
    return 700_000


def feature_table_sql(table: str, row_count: int, maximum_features: int) -> str:
    columns = []
    for feature in range(maximum_features):
        offset = 10_000_019 * feature
        columns.append(f"((hash(i+{offset})%255)::INTEGER-127)::FLOAT AS x{feature}")
    return f"CREATE TABLE {table} AS SELECT " + ",".join(columns) + f" FROM range({row_count}) t(i);"


def measured_cases(feature_counts: tuple[int, ...], depths: tuple[int, ...]) -> list[Case]:
    return [
        Case(tree_kind, feature_count, depth)
        for tree_kind in ("fixed", "variable")
        for feature_count in feature_counts
        for depth in depths
        if tree_kind == "fixed" or depth >= 2
    ]


def group_row_counts(row_counts: dict[int, int], feature_counts: tuple[int, ...]) -> dict[int, list[int]]:
    groups: dict[int, list[int]] = {}
    for feature_count in feature_counts:
        groups.setdefault(row_counts[feature_count], []).append(feature_count)
    return groups


def build_sql(
    row_counts: dict[int, int],
    warmups: int,
    runs: int,
    seed: int,
    feature_counts: tuple[int, ...],
    depths: tuple[int, ...],
) -> tuple[str, list[tuple[str, Case, str, int]]]:
    cases = measured_cases(feature_counts, depths)
    lines = [
        ".mode csv",
        ".headers off",
        ".echo off",
        "PRAGMA threads=1;",
        "PRAGMA preserve_insertion_order=false;",
        "PRAGMA disable_progress_bar;",
    ]
    feature_tables = {}
    row_groups = group_row_counts(row_counts, feature_counts)
    for group, (row_count, group_features) in enumerate(row_groups.items()):
        table = f"features_{group}"
        lines.append(feature_table_sql(table, row_count, max(group_features)))
        lines.append(f"ANALYZE {table};")
        for feature_count in group_features:
            feature_tables[feature_count] = table

    for case in cases:
        lines.append(f"CREATE MACRO tree_{case.name}() AS {tree_literal(case, seed)};")
        features = ",".join(f"x{feature}" for feature in range(case.feature_count))
        lines.append(
            f"PREPARE bench_{case.name} AS "
            f"SELECT sum(decision_tree(tree_{case.name}(),{features}))::HUGEINT "
            f"FROM {feature_tables[case.feature_count]};"
        )

    executions: list[tuple[str, Case, str, int]] = []
    order_rng = random.Random(seed ^ 0xA17E)
    lines.append("PRAGMA enable_profiling='json';")
    for phase, round_count in (("warmup", warmups), ("measured", runs)):
        for _ in range(round_count):
            order = list(cases)
            order_rng.shuffle(order)
            for case in order:
                query = f"EXECUTE bench_{case.name};"
                executions.append((phase, case, query, row_counts[case.feature_count]))
                lines.append(query)
    return "\n".join(lines) + "\n", executions


def parse_json_stream(text: str) -> list[dict]:
    decoder = json.JSONDecoder()
    result = []
    position = 0
    while position < len(text):
        while position < len(text) and text[position].isspace():
            position += 1
        if position == len(text):
            break
        value, position = decoder.raw_decode(text, position)
        result.append(value)
    return result


def median_absolute_deviation(values: list[float]) -> float:
    center = statistics.median(values)
    return statistics.median(abs(value - center) for value in values)


def binary_version(binary: Path) -> str:
    result = subprocess.run([str(binary), "-version"], text=True, capture_output=True, check=True)
    return result.stdout.strip()


def run_extension(
    binary: Path,
    extension: Path,
    sql: str,
    executions: list[tuple[str, Case, str, int]],
    cpu: int | None,
    timeout: int,
) -> list[dict]:
    command = [str(binary), "-unsigned", "-batch"]
    if cpu is not None and shutil.which("taskset"):
        command = ["taskset", "-c", str(cpu), *command]
    extension_path = str(extension.resolve()).replace("'", "''")
    process = subprocess.run(
        command,
        input=f"LOAD '{extension_path}';\n{sql}",
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        timeout=timeout,
        check=False,
    )
    if process.returncode:
        raise RuntimeError(f"benchmark failed for {extension}:\n{process.stdout}\n{process.stderr}")

    profiles = parse_json_stream(process.stderr)
    output_rows = list(csv.reader(io.StringIO(process.stdout)))
    if len(profiles) != len(executions) or len(output_rows) != len(executions):
        raise RuntimeError(
            f"expected {len(executions)} executions from {extension}, "
            f"got {len(profiles)} profiles and {len(output_rows)} results"
        )

    samples: dict[tuple[str, int, int], list[float]] = {}
    checksums: dict[tuple[str, int, int], set[str]] = {}
    case_rows = {execution[1].key: execution[3] for execution in executions}
    for execution, profile, output in zip(executions, profiles, output_rows):
        phase, case, query, row_count = execution
        if profile["query_name"] != query:
            raise RuntimeError(f"profile mismatch: expected {query!r}, got {profile['query_name']!r}")
        if len(output) != 1:
            raise RuntimeError(f"unexpected output for {query}: {output!r}")
        checksums.setdefault(case.key, set()).add(output[0])
        if phase == "measured":
            samples.setdefault(case.key, []).append(profile["cpu_time"] * 1e9 / row_count)

    if any(len(values) != 1 for values in checksums.values()):
        raise RuntimeError(f"a checksum changed between runs for {extension}")

    records = []
    for case in sorted({execution[1] for execution in executions}, key=lambda item: item.key):
        case_samples = samples[case.key]
        records.append(
            {
                "tree_kind": case.tree_kind,
                "feature_count": case.feature_count,
                "depth": case.depth,
                "rows": case_rows[case.key],
                "status": "measured",
                "median_ns_per_row": statistics.median(case_samples),
                "mad_ns_per_row": median_absolute_deviation(case_samples),
                "samples_ns_per_row": case_samples,
                "checksum": next(iter(checksums[case.key])),
            }
        )
    return records


def merge_measurements(first: list[dict], second: list[dict]) -> list[dict]:
    second_by_key = {
        (record["tree_kind"], record["feature_count"], record["depth"]): record for record in second
    }
    if len(first) != len(second) or len(second_by_key) != len(second):
        raise RuntimeError("benchmark passes produced different cases")

    merged = []
    for first_record in first:
        key = (first_record["tree_kind"], first_record["feature_count"], first_record["depth"])
        second_record = second_by_key.get(key)
        if second_record is None:
            raise RuntimeError(f"benchmark case {key} is missing from one pass")
        if first_record["rows"] != second_record["rows"]:
            raise RuntimeError(f"row count differs between benchmark passes for {key}")
        if first_record["checksum"] != second_record["checksum"]:
            raise RuntimeError(f"checksum differs between benchmark passes for {key}")

        samples = first_record["samples_ns_per_row"] + second_record["samples_ns_per_row"]
        record = dict(first_record)
        record.update(
            {
                "median_ns_per_row": statistics.median(samples),
                "mad_ns_per_row": median_absolute_deviation(samples),
                "samples_ns_per_row": samples,
            }
        )
        merged.append(record)
    return merged


def add_not_applicable(
    records: list[dict], row_counts: dict[int, int], feature_counts: tuple[int, ...], depths: tuple[int, ...]
) -> None:
    if 1 not in depths:
        return
    for feature_count in feature_counts:
        records.append(
            {
                "tree_kind": "variable",
                "feature_count": feature_count,
                "depth": 1,
                "rows": row_counts[feature_count],
                "status": "not_applicable",
                "reason": "A tree with unequal leaf depths requires a maximum depth of at least 2.",
            }
        )
    records.sort(key=lambda record: (record["tree_kind"], record["feature_count"], record["depth"]))


def write_json(path: Path, value: object) -> None:
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")


def comparison_records(current: list[dict], previous: list[dict]) -> list[dict]:
    previous_by_key = {
        (record["tree_kind"], record["feature_count"], record["depth"]): record for record in previous
    }
    result = []
    for current_record in current:
        key = (
            current_record["tree_kind"],
            current_record["feature_count"],
            current_record["depth"],
        )
        previous_record = previous_by_key[key]
        record = {
            "tree_kind": key[0],
            "feature_count": key[1],
            "depth": key[2],
            "rows": current_record["rows"],
            "status": current_record["status"],
        }
        if current_record["status"] == "measured":
            if current_record["checksum"] != previous_record["checksum"]:
                raise RuntimeError(f"checksum differs between revisions for {key}")
            current_time = current_record["median_ns_per_row"]
            previous_time = previous_record["median_ns_per_row"]
            record.update(
                {
                    "current_ns_per_row": current_time,
                    "current_mad_ns_per_row": current_record["mad_ns_per_row"],
                    "previous_ns_per_row": previous_time,
                    "previous_mad_ns_per_row": previous_record["mad_ns_per_row"],
                    "speedup_percent": (previous_time / current_time - 1) * 100,
                }
            )
        else:
            record["reason"] = current_record["reason"]
        result.append(record)
    return result


def write_comparison_csv(path: Path, records: list[dict]) -> None:
    fields = [
        "tree_kind",
        "feature_count",
        "depth",
        "rows",
        "status",
        "current_ns_per_row",
        "current_mad_ns_per_row",
        "previous_ns_per_row",
        "previous_mad_ns_per_row",
        "speedup_percent",
        "reason",
    ]
    with path.open("w", encoding="utf-8", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=fields)
        writer.writeheader()
        for record in records:
            writer.writerow({field: record.get(field, "") for field in fields})


def revision_link(repository: str, revision: str) -> str:
    if not repository:
        return html.escape(revision)
    url = f"https://github.com/{repository}/commit/{revision}"
    return f'<a href="{html.escape(url)}"><code>{html.escape(revision[:12])}</code></a>'


def result_table(
    tree_kind: str,
    records: list[dict],
    feature_counts: tuple[int, ...],
    depths: tuple[int, ...],
) -> str:
    by_key = {(record["tree_kind"], record["feature_count"], record["depth"]): record for record in records}
    rows = []
    for feature_count in feature_counts:
        cells = [f'<th scope="row">{feature_count}</th>']
        for depth in depths:
            record = by_key[(tree_kind, feature_count, depth)]
            if record["status"] != "measured":
                cells.append(f'<td class="na" title="{html.escape(record["reason"])}">N/A</td>')
                continue
            if "speedup_percent" not in record:
                cells.append(
                    f'<td title="Current MAD: {record["mad_ns_per_row"]:.3f} ns">'
                    f'<span class="time">{record["median_ns_per_row"]:.3f}</span></td>'
                )
                continue
            speedup = record["speedup_percent"]
            result_class = "faster" if speedup > 1 else "slower" if speedup < -1 else "neutral"
            cells.append(
                f'<td class="{result_class}" title="Current MAD: {record["current_mad_ns_per_row"]:.3f} ns; '
                f'previous MAD: {record["previous_mad_ns_per_row"]:.3f} ns">'
                f'<span class="time">{record["current_ns_per_row"]:.3f}</span>'
                f'<span class="delta">{speedup:+.1f}%</span>'
                f'<span class="previous">was {record["previous_ns_per_row"]:.3f}</span></td>'
            )
        rows.append("<tr>" + "".join(cells) + "</tr>")
    headings = "".join(f'<th scope="col">D{depth}</th>' for depth in depths)
    return (
        '<div class="table-wrap"><table><thead><tr><th scope="col">Features</th>'
        + headings
        + "</tr></thead><tbody>"
        + "".join(rows)
        + "</tbody></table></div>"
    )


def write_page(
    path: Path,
    records: list[dict],
    metadata: dict,
    feature_counts: tuple[int, ...],
    depths: tuple[int, ...],
) -> None:
    current = metadata["current"]
    previous = metadata["previous"]
    repository = metadata["repository"]
    run_link = (
        f'<a href="{html.escape(metadata["run_url"])}">workflow run</a>' if metadata["run_url"] else "workflow run"
    )
    generated = html.escape(metadata["generated_at"])
    fixed_table = result_table("fixed", records, feature_counts, depths)
    variable_table = result_table("variable", records, feature_counts, depths)
    if previous is None:
        summary = (
            f'Current {revision_link(repository, current["revision"])}. No earlier benchmark was available; '
            f"this run establishes the baseline. Generated {generated} by the {run_link}."
        )
        result_description = "Each cell shows the current median CPU time in ns/row."
        order_description = "Only the current revision was measured because no baseline was available."
        version_description = f'Current DuckDB: <code>{html.escape(current["duckdb_version"])}</code>'
        download_description = '<a href="data/current.json">current raw samples</a>'
    else:
        summary = (
            f'Current {revision_link(repository, current["revision"])} versus benchmark baseline '
            f'{revision_link(repository, previous["revision"])}. Generated {generated} by the {run_link}.'
        )
        result_description = (
            "Each cell shows current median CPU time in ns/row, the change from the baseline, and the baseline "
            "median. Positive percentages are faster. Green/red begins outside a ±1% neutral band; all "
            "measured deltas remain visible."
        )
        order_description = (
            "The revisions run in a balanced baseline/current/current/baseline order to limit time-dependent bias."
        )
        version_description = (
            f'Current DuckDB: <code>{html.escape(current["duckdb_version"])}</code><br>'
            f'Baseline DuckDB: <code>{html.escape(previous["duckdb_version"])}</code>'
        )
        download_description = (
            '<a href="data/current.json">current raw samples</a>, '
            '<a href="data/previous.json">baseline raw samples</a>, or '
            '<a href="data/comparison.csv">the comparison CSV</a>'
        )
    document = f"""<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Apart benchmarks</title>
<style>
:root {{ color-scheme: light dark; font-family: system-ui, sans-serif; }}
body {{ max-width: 1500px; margin: 0 auto; padding: 2rem; line-height: 1.45; }}
h1 {{ margin-bottom: .25rem; }}
.summary {{ color: #777; margin-top: 0; }}
.table-wrap {{ overflow-x: auto; margin-bottom: 2rem; }}
table {{ border-collapse: collapse; font-variant-numeric: tabular-nums; width: 100%; }}
th, td {{ border: 1px solid #8885; padding: .45rem .55rem; text-align: right; white-space: nowrap; }}
thead th, tbody th {{ background: #8881; }}
.time, .delta, .previous {{ display: block; }}
.time {{ font-weight: 650; }}
.previous {{ color: #777; font-size: .78rem; }}
.delta {{ font-size: .9rem; }}
.faster .delta {{ color: #16843a; }}
.slower .delta {{ color: #c43b35; }}
.neutral .delta, .na {{ color: #777; }}
code {{ font-size: .9em; }}
</style>
</head>
<body>
<h1>Apart benchmark matrix</h1>
<p class="summary">{summary}</p>
<p>{result_description}</p>
<h2>Fixed-depth trees</h2>
<p>Every row traverses exactly the displayed depth.</p>
{fixed_table}
<h2>Variable-depth trees</h2>
<p>Approximately half the rows stop at D−1 and half at D. D1 is impossible for a genuinely variable-depth tree.</p>
{variable_table}
<h2>Method</h2>
<p>Row counts by feature count: {html.escape(metadata["row_count_summary"])}.
Each case has {metadata["warmups"]} warm-up rounds and {metadata["runs"]} measured rounds,
using one DuckDB thread pinned to CPU {metadata["cpu"]}.
Cases are shuffled in every round. {order_description} Hover over a cell for its median absolute deviation.</p>
<p>{version_description}<br>Host: <code>{html.escape(metadata["host"])}</code></p>
<p>Download {download_description}.</p>
</body>
</html>
"""
    path.write_text(document, encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--duckdb-binary", type=Path, required=True)
    parser.add_argument("--current-extension", type=Path, required=True)
    parser.add_argument("--previous-extension", type=Path)
    parser.add_argument("--current-revision", required=True)
    parser.add_argument("--previous-revision")
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--repository", default="")
    parser.add_argument("--run-url", default="")
    parser.add_argument("--features", type=parse_int_list, default=DEFAULT_FEATURE_COUNTS)
    parser.add_argument("--depths", type=parse_int_list, default=DEFAULT_DEPTHS)
    parser.add_argument("--rows", type=int, help="override the row count for every feature count")
    parser.add_argument("--warmups", type=int, default=2)
    parser.add_argument("--runs", type=int, default=7)
    parser.add_argument("--seed", type=int, default=20_260_912)
    parser.add_argument("--cpu", type=int)
    parser.add_argument("--timeout", type=int, default=7200)
    args = parser.parse_args()

    if (args.previous_extension is None) != (args.previous_revision is None):
        parser.error("previous extension and revision must be provided together")
    if (args.rows is not None and args.rows < 1) or args.warmups < 0 or args.runs < 1:
        parser.error("rows and runs must be positive; warmups cannot be negative")
    if args.previous_extension is not None and args.runs < 2:
        parser.error("comparisons need at least two measured runs")
    if args.cpu is None:
        available_cpus = os.sched_getaffinity(0) if hasattr(os, "sched_getaffinity") else None
        cpu = min(available_cpus) if available_cpus else None
    else:
        cpu = args.cpu

    row_counts = {
        feature_count: args.rows or default_row_count(feature_count) for feature_count in args.features
    }
    row_groups = group_row_counts(row_counts, args.features)
    duckdb_binary = args.duckdb_binary.resolve()
    duckdb_version = binary_version(duckdb_binary)
    if args.previous_extension is None:
        sql, executions = build_sql(
            row_counts, args.warmups, args.runs, args.seed, args.features, args.depths
        )
        current_records = run_extension(
            duckdb_binary, args.current_extension, sql, executions, cpu, args.timeout
        )
        previous_records = None
    else:
        first_runs = (args.runs + 1) // 2
        second_runs = args.runs // 2
        first_warmups = (args.warmups + 1) // 2
        second_warmups = args.warmups // 2
        first_sql, first_executions = build_sql(
            row_counts, first_warmups, first_runs, args.seed, args.features, args.depths
        )
        second_sql, second_executions = build_sql(
            row_counts, second_warmups, second_runs, args.seed, args.features, args.depths
        )
        previous_first = run_extension(
            duckdb_binary, args.previous_extension, first_sql, first_executions, cpu, args.timeout
        )
        current_first = run_extension(
            duckdb_binary, args.current_extension, first_sql, first_executions, cpu, args.timeout
        )
        current_second = run_extension(
            duckdb_binary, args.current_extension, second_sql, second_executions, cpu, args.timeout
        )
        previous_second = run_extension(
            duckdb_binary, args.previous_extension, second_sql, second_executions, cpu, args.timeout
        )
        previous_records = merge_measurements(previous_first, previous_second)
        current_records = merge_measurements(current_first, current_second)
        add_not_applicable(previous_records, row_counts, args.features, args.depths)
    add_not_applicable(current_records, row_counts, args.features, args.depths)
    page_records = (
        current_records
        if previous_records is None
        else comparison_records(current_records, previous_records)
    )

    generated_at = datetime.now(timezone.utc).isoformat()
    metadata = {
        "schema_version": 1,
        "generated_at": generated_at,
        "repository": args.repository,
        "run_url": args.run_url,
        "host": platform.platform(),
        "cpu": cpu,
        "row_counts": row_counts,
        "row_count_summary": "; ".join(
            f"{row_count:,} for {', '.join(map(str, group_features))}"
            for row_count, group_features in row_groups.items()
        ),
        "warmups": args.warmups,
        "runs": args.runs,
        "seed": args.seed,
        "feature_counts": args.features,
        "depths": args.depths,
        "tree_definitions": {
            "fixed": "all paths have depth D",
            "variable": "approximately half the rows stop at depth D-1 and half at depth D",
        },
        "revision_order": (
            ["current"]
            if previous_records is None
            else ["previous", "current", "current", "previous"]
        ),
        "previous": (
            None
            if previous_records is None
            else {"revision": args.previous_revision, "duckdb_version": duckdb_version}
        ),
        "current": {"revision": args.current_revision, "duckdb_version": duckdb_version},
    }
    current_result = {"metadata": metadata, "revision": metadata["current"], "results": current_records}

    artifact_directory = args.output / "artifacts"
    site_directory = args.output / "site"
    site_data_directory = site_directory / "data"
    artifact_directory.mkdir(parents=True, exist_ok=True)
    site_data_directory.mkdir(parents=True, exist_ok=True)
    for name in ("previous.json", "comparison.csv"):
        (artifact_directory / name).unlink(missing_ok=True)
        (site_data_directory / name).unlink(missing_ok=True)
    write_json(artifact_directory / "current.json", current_result)
    write_json(artifact_directory / "metadata.json", metadata)
    shutil.copy2(args.current_extension, artifact_directory / "apart.duckdb_extension")
    site_files = ["current.json"]
    if previous_records is not None:
        previous_result = {
            "metadata": metadata,
            "revision": metadata["previous"],
            "results": previous_records,
        }
        write_json(artifact_directory / "previous.json", previous_result)
        write_comparison_csv(artifact_directory / "comparison.csv", page_records)
        site_files.extend(("previous.json", "comparison.csv"))
    for name in site_files:
        shutil.copy2(artifact_directory / name, site_data_directory / name)
    write_page(site_directory / "index.html", page_records, metadata, args.features, args.depths)

    measured = sum(record["status"] == "measured" for record in page_records)
    noun = "results" if previous_records is None else "comparisons"
    print(f"wrote {measured} measured {noun} to {args.output}")


if __name__ == "__main__":
    main()
