# Piecewise constant functions in 1D

`piecewise(edges, values)` builds a decision tree for a piecewise constant
function in 1D: a function whose value stays constant within each interval.

The sorted `edges` divide the number line into intervals, and `values` gives the
constant value on each interval. Use at least one edge and one more value than
edge.

For example:

```sql
piecewise([10, 20], ['low', 'middle', 'high'])
```

This represents a function that returns `low` below 10, `middle` from 10 up to
but excluding 20, and `high` from 20 onwards. At an edge, the value for the
interval to its right is selected.

Use `decision_tree(piecewise(edges, values), point)` to evaluate the function at
`point`. The edges and values must be constant for the query; `point` can vary
from row to row.

The macro builds a balanced tree:

```sql
LOAD apart;

CREATE OR REPLACE MACRO piecewise(edges, "values") AS
    list_transform(
        [list_grade_up(list_grade_up([
            (node + 0.5)
                / (1::BIGINT << floor(log2(node))::INTEGER)
            FOR node IN range(1, 2 * len("values"))
        ]))],
        lambda position: {
            weights: repeat([[1.0::DOUBLE]], len(edges)),
            thresholds: [
                edges[position[node] // 2]
                FOR node IN range(1, len("values"))
            ],
            children: [
                [
                    if(child < len("values"),
                        child,
                        -((position[child] + 1) // 2))
                    FOR child IN [2 * node + 1, 2 * node]
                ]
                FOR node IN range(1, len("values"))
            ],
            values: "values"
        }
    )[1];
```

## 1. Find the nearest entry

Put each edge halfway between two adjacent entries in a sorted list. Each
interval then returns its nearest entry.

```sql
CREATE OR REPLACE MACRO nearest_entry(entries, point) AS
    decision_tree(
        piecewise(
            [
                entries[i] / 2.0 + entries[i + 1] / 2.0
                FOR i IN range(1, len(entries))
            ],
            entries
        ),
        point
    );

SELECT point, nearest_entry([1.0, 4.0, 10.0], point) AS nearest
FROM (VALUES (0.0), (3.0), (8.0), (12.0)) points(point);
```

The nearest entries are `1`, `4`, `10`, and `10`. A tie selects the larger
entry.

## 2. Find an insertion position

Use the sorted entries as edges and the possible positions as values. Positions
start at zero.

```sql
CREATE OR REPLACE MACRO searchsorted(entries, point) AS
    decision_tree(
        piecewise(entries, range(len(entries) + 1)),
        point
    );

SELECT point, searchsorted([10.0, 20.0, 30.0], point) AS position
FROM (VALUES (5.0), (10.0), (25.0), (30.0)) points(point);
```

The positions are `0`, `1`, `2`, and `3`. The new value is placed after equal
entries, like `searchsorted(..., side='right')`.

## 3. Check whether exactly one entry is nearby

For a distance `d >= 0`, there is exactly one entry from `point - d` through
`point + d` when the two insertion positions differ by one.

```sql
CREATE OR REPLACE MACRO exactly_one_within(entries, d, point) AS
    searchsorted(entries, point + d)
        = searchsorted(entries, nextafter(point - d, '-Infinity'::DOUBLE)) + 1;

SELECT point, exactly_one_within([1.0, 4.0, 10.0], 2.0, point) AS exactly_one
FROM (VALUES (0.0), (2.0), (7.0), (9.0)) points(point);
```

The results are `true`, `false`, `false`, and `true`. Entries exactly `d` away
are included.
