# Dtree

`dtree` is a DuckDB extension that evaluates affine binary decision trees with a variadic scalar function:

```sql
decision_tree(tree, x1, x2, ..., xn) -> T
decision_tree(tree, features_array)   -> T
```

The tree is a constant DuckDB `STRUCT`. Coefficients, thresholds, and features may be `FLOAT` or `DOUBLE`; mixed
inputs are evaluated as `DOUBLE`. `T` is the element type of `leaf_values` and may be any concrete DuckDB logical
type. The second form requires a fixed-size array whose length supplies the dimensionality.

## Tree representation

The authoring representation is a columnar `STRUCT` with these fields:

| Field | Type | Meaning |
|---|---|---|
| `coefficients` | nested `LIST`/`ARRAY` of `FLOAT` or `DOUBLE` | One coefficient vector per internal node. |
| `thresholds` | `LIST`/`ARRAY` of `FLOAT` or `DOUBLE` | One threshold per internal node. |
| `left_children` | integer `LIST`/`ARRAY` | Child selected when the affine score is below the threshold. |
| `right_children` | integer `LIST`/`ARRAY` | Child selected when the affine score is at or above the threshold. |
| `leaf_values` | `LIST`/`ARRAY` of `T` | The values returned by the tree. |
| `root` | integer, optional | Root reference; defaults to internal node `0`. |

A nonnegative child reference is an internal-node index. A negative reference identifies leaf `-(reference + 1)`:
`-1` is leaf 0, `-2` is leaf 1, and so on.

For internal node `i`, evaluation computes:

```text
score = sum(coefficients[i][j] * x[j])
```

It follows `left_children[i]` when `score < thresholds[i]` and `right_children[i]` otherwise.

Example:

```sql
SELECT decision_tree(
    {
        coefficients: [[1.0::FLOAT, 0.0::FLOAT], [0.0::FLOAT, 1.0::FLOAT]],
        thresholds: [0.0::FLOAT, 10.0::FLOAT],
        left_children: [-1, -2],
        right_children: [1, -3],
        leaf_values: [10, 20, 30]
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
- validates dimensions, field lengths, references, reachability, cycles, and tree topology;
- promotes `FLOAT` and `DOUBLE` parameters and features to one computation type;
- rewrites nodes into depth-first order and packs their parameters and child references into typed execution arrays;
- records whether every leaf has the same depth;
- selects a `FLOAT` or `DOUBLE` kernel specialized for feature counts one through five, or a runtime-size kernel for
  larger counts;
- removes the constant tree argument from runtime execution.

Fixed-size kernels store each node's coefficients directly beside its threshold and topology. The general evaluator
stores coefficients feature-major and loops over the runtime dimension. Both advance eight independent rows together
so the processor can overlap their otherwise dependent traversals. Trees whose leaves all have the same depth use a
fixed-depth loop; other shapes track which rows have reached a leaf. The left/right choice itself is branchless. The
separate-column and fixed-array interfaces share the same traversal implementations.

Traversal writes leaf indices into one reusable selection buffer allocated by DuckDB's function-local initialization.
After traversal, results with fewer than `STANDARD_VECTOR_SIZE / 2` authored leaves use that selection as a dictionary
over the leaf vector; larger leaf sets are copied to a flat result. The decision uses the number of leaves, without
comparing or deduplicating their values. This keeps arbitrary leaf types, including strings and nested values, entirely
outside the numerical loop. The extension performs no allocation in traversal or per-chunk allocation for its scratch
state. Flattening encoded inputs and constructing variable-sized flat outputs may use DuckDB-managed allocations
outside traversal.

### Numeric types

Coefficients, thresholds, and features must be `FLOAT` or `DOUBLE`. If any of them is `DOUBLE`, all parameters and
features are evaluated by the `DOUBLE` kernel; otherwise the `FLOAT` kernel is used. Integer inputs must be cast
explicitly. Leaf values retain their common DuckDB logical type without conversion.

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
