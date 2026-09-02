# Dtree

`dtree` is a DuckDB extension that evaluates affine binary decision trees with a variadic scalar function:

```sql
decision_tree(tree, x1, x2, ..., xn) -> T
decision_tree(tree, features_array)   -> T
```

The tree is a constant DuckDB `STRUCT`. Its dimensionality and leaf result type are resolved during binding. The
second form requires a fixed-size DuckDB `ARRAY`; its length supplies the dimensionality.

## Tree representation

The authoring representation is a columnar `STRUCT` with these fields:

| Field | Type | Meaning |
|---|---|---|
| `coefficients` | nested `LIST`/`ARRAY` of `FLOAT` or `DOUBLE` | One coefficient vector per internal node. |
| `thresholds` | `LIST`/`ARRAY` of `FLOAT` or `DOUBLE` | One threshold per internal node. |
| `left_children` | integer `LIST`/`ARRAY` | Child selected when the affine score is below the threshold. |
| `right_children` | integer `LIST`/`ARRAY` | Child selected when the affine score is at or above the threshold. |
| `leaf_values` | `LIST`/`ARRAY` of `T` | The typed values returned by the tree. |
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
        coefficients: [[1.0::DOUBLE, 0.0::DOUBLE], [0.0::DOUBLE, 1.0::DOUBLE]],
        thresholds: [0.0::DOUBLE, 10.0::DOUBLE],
        left_children: [-1, -2],
        right_children: [1, -3],
        leaf_values: ['negative x', 'small y', 'large y']
    },
    x,
    y
)
FROM feature_table;
```

The equivalent fixed-array call is:

```sql
SELECT decision_tree(tree_struct, [x, y]::DOUBLE[2])
FROM feature_table;
```

Leaf values may have any common DuckDB logical type, including nested types:

```sql
SELECT decision_tree(
    {
        coefficients: [[1.0::DOUBLE]],
        thresholds: [0.0::DOUBLE],
        left_children: [-1],
        right_children: [-2],
        leaf_values: [
            {label: 'negative', payload: [10, 11]},
            {label: 'positive', payload: [20, 21]}
        ]
    },
    x
)
FROM feature_table;
```

## Binding and execution

At bind time, `dtree`:

- requires and evaluates the constant tree expression;
- validates dimensions, field lengths, references, reachability, cycles, and tree topology;
- determines the result type from `leaf_values`;
- selects `FLOAT` or `DOUBLE` as the computation type and inserts feature casts;
- rewrites internal nodes into depth-first order and packs their coefficients, threshold, and child references;
- selects the `FLOAT` or `DOUBLE` evaluator.

The baseline evaluator stores coefficients in a compact node-major array and loops over the dimensions at each visited
node. Both the separate-column and fixed `ARRAY` interfaces use this path. Dimension-specific kernels and further
low-level optimizations are intentionally deferred until they can be guided by benchmarks.

The evaluator reads DuckDB vectors through unified vector formats and returns a dictionary selection over the bound
leaf vector. This avoids reconstructing variable-width or nested leaf values per row. A NULL feature, NULL feature
array, or NULL array element produces NULL.

### Numeric types

Coefficients, thresholds, and features must be `FLOAT` or `DOUBLE`. The computation type is selected with two simple
rules:

- all-`FLOAT` inputs and tree parameters compute as `FLOAT`;
- the presence of any `DOUBLE` input or tree parameter promotes computation to `DOUBLE`.

Other numeric types are rejected rather than converted implicitly. They can be cast explicitly by the caller when
loss of range or precision is acceptable.

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
