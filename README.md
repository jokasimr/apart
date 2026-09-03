# Dtree

`dtree` is a DuckDB extension that evaluates affine binary decision trees with a variadic scalar function:

```sql
decision_tree(tree, x1, x2, ..., xn) -> T
decision_tree(tree, features_array)   -> T
```

The tree is a constant, recursively nested DuckDB `STRUCT`. Features must be `FLOAT` or `DOUBLE`; weights and
thresholds may use any numeric type and are converted to the computation type at bind time. `T` is the common type of
the leaf values and may be any concrete DuckDB logical type. The second form requires a fixed-size array whose length
supplies the dimensionality.

## Tree representation

An internal node has four fields:

| Field | Type | Meaning |
|---|---|---|
| `weights` | numeric `LIST`/`ARRAY` | The affine weights, in feature-argument order. |
| `threshold` | numeric value | The comparison threshold. |
| `below` | node or leaf `STRUCT` | Subtree selected when the comparison is false. |
| `above` | node or leaf `STRUCT` | Subtree selected when the score is at or above the threshold. |

A leaf has exactly one field, `value`, containing the value to return. A whole tree may consist of a single leaf:

```sql
{value: 42}
```

For an internal node, evaluation computes:

```text
score = sum(weights[j] * x[j])
```

It follows `above` when `score >= threshold` and `below` otherwise. Thus equality follows `above`; a `NaN` score
follows `below`.

Example:

```sql
SELECT decision_tree(
    {
        weights: [1, 0],
        threshold: 0,
        below: {value: 10},
        above: {
            weights: [0, 1],
            threshold: 10,
            below: {value: 20},
            above: {value: 30}
        }
    },
    x,
    y
)
FROM feature_table;
```

The equivalent fixed-array call is:

```sql
SELECT decision_tree(tree_struct, [x, y]::FLOAT[2])
FROM feature_table;
```

## Binding and execution

At bind time, `dtree`:

- requires and evaluates the constant tree expression;
- validates every node and leaf and checks each weight vector against the feature count;
- determines a common leaf type and numeric computation type;
- flattens the recursive authoring representation into indexed nodes and leaves;
- rewrites nodes into typed execution arrays;
- records whether every leaf has the same depth;
- selects a `FLOAT` or `DOUBLE` kernel specialized for feature counts one through five, or a runtime-size kernel for
  larger counts;
- removes the constant tree argument from runtime execution.

For fixed feature counts, equal-depth trees are stored in heap order with only coefficients and thresholds; the kernel
computes each child index directly. Other fixed-size trees retain explicit child references in depth-first order. The
general evaluator stores coefficients feature-major and loops over the runtime dimension. All kernels advance eight
independent rows together so the processor can overlap their otherwise dependent traversals. Trees whose leaves all
have the same depth use a fixed-depth loop; other shapes track which rows have reached a leaf. The below/above choice
itself is branchless. The separate-column and fixed-array interfaces share the same traversal implementations.

Traversal writes leaf indices into one reusable selection buffer allocated by DuckDB's function-local initialization.
After traversal, results with fewer than `STANDARD_VECTOR_SIZE / 2` authored leaves use that selection as a dictionary
over the leaf vector; larger leaf sets are copied to a flat result. The decision uses the number of leaves, without
comparing or deduplicating their values. This keeps arbitrary leaf types, including strings and nested values, entirely
outside the numerical loop. The extension performs no allocation in traversal or per-chunk allocation for its scratch
state. Flattening encoded inputs and constructing variable-sized flat outputs may use DuckDB-managed allocations
outside traversal.

### Numeric types

Feature inputs must be `FLOAT` or `DOUBLE`. Weights and thresholds may use ordinary integer, decimal, `FLOAT`, or
`DOUBLE` literals. DuckDB's numeric promotion rules combine them with the feature type; the resulting computation uses
the `FLOAT` or `DOUBLE` kernel. Integer feature inputs must still be cast explicitly. Leaf values are converted at bind
time to their common DuckDB logical type.

## Building and testing

The repository is based on the official [DuckDB extension template](https://github.com/duckdb/extension-template).

```sh
make debug
make test_debug
```

Release builds use:

```sh
make
make test
```
