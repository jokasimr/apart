"""Express the saved 2D decision tree as a DuckDB CASE expression."""

import json
from pathlib import Path


def case_sql(tree):
    def expression(reference, depth):
        if reference < 0:
            value = tree["values"][-reference - 1]
            return "NULL::INTEGER" if value is None else str(value)
        node = reference - 1
        wx, wy = tree["weights"][node]
        threshold = tree["thresholds"][node]
        above, below = tree["children"][node]
        indent = "  " * depth
        return (
            f"CASE WHEN ({wx!r}::DOUBLE) * x::DOUBLE + ({wy!r}::DOUBLE) * y::DOUBLE >= ({threshold!r}::DOUBLE)\n"
            f"{indent}  THEN {expression(above, depth + 1)}\n"
            f"{indent}  ELSE {expression(below, depth + 1)}\n"
            f"{indent}END"
        )

    # DuckDB orders NaN above finite numbers; reject non-finite coordinates
    # explicitly to match the rectangle checks in the apart tree.
    return (
        "-- Generated from tree.json by sql_case.py. No extension required.\n"
        "CREATE OR REPLACE MACRO locate_cell_sql(x, y) AS\n"
        "CASE WHEN isfinite(x::DOUBLE) AND isfinite(y::DOUBLE)\n"
        f"  THEN {expression(1, 1)}\n"
        "  ELSE NULL::INTEGER\n"
        "END;\n"
    )


if __name__ == "__main__":
    directory = Path(__file__).resolve().parent
    tree = json.loads((directory / "tree.json").read_text())
    (directory / "grid_case.sql").write_text(case_sql(tree))
