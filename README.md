# Dtree

`dtree` is a DuckDB extension that evaluates affine binary decision trees with a variadic scalar function:

```sql
decision_tree(tree, x1, x2, ..., xn) -> T
decision_tree(tree, features_array)   -> T
```

The tree is a constant DuckDB `STRUCT`. Features must be `FLOAT` or `DOUBLE`; weights and thresholds may use any
numeric type and are converted to the computation type at bind time. `T` is the type of the values list and may be any
concrete DuckDB logical type. The second form requires a fixed-size array whose length supplies the dimensionality.

## Tree representation

The tree has four fields:

| Field | Type | Meaning |
|---|---|---|
| `weights` | numeric nested `LIST`/`ARRAY` | One weight vector per internal node, in feature-argument order. |
| `thresholds` | numeric `LIST`/`ARRAY` | One comparison threshold per internal node. |
| `children` | signed-integer nested `LIST`/`ARRAY` | Two references per node, ordered `[above, below]`. |
| `values` | `LIST`/`ARRAY` | The leaf values. |

Node `i` evaluates:

```text
score = sum(weights[i][j] * x[j])
```

With `children[i] = [above, below]`, it follows `above` when `score >= thresholds[i]` and `below` otherwise.
Non-negative child references select another internal node. A negative reference `-k-1` returns `values[k]`. The root
is always node `0`. Thus equality follows `above`; a `NaN` score follows `below`.

`weights`, `thresholds`, and `children` must contain the same number of entries. Every internal node and leaf value
must be reachable from node `0`; cycles and shared internal nodes are rejected.

Example:

```sql
SELECT decision_tree(
    {
        weights: [[1, 0], [0, 1]],
        thresholds: [0, 10],
        children: [[1, -1], [-3, -2]],
        values: [10, 20, 30]
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
- validates the node and leaf arrays and checks each weight vector against the feature count;
- determines the leaf type and numeric computation type;
- validates and follows the indexed topology from root node `0`;
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
After traversal, fixed-size scalar leaf values are copied to a flat result. Variable-size and nested values use
dictionary encoding when there are fewer than `STANDARD_VECTOR_SIZE / 2` authored leaves; larger leaf sets are copied
to a flat result. `STRUCT` results have a flat outer vector, with the same decision applied independently to each
child. Fixed-size scalar children use direct typed indexed-copy loops, while other children follow the dictionary
policy above. The dictionary decision uses the number of leaves without comparing or deduplicating their values. This
keeps arbitrary leaf handling entirely outside the numerical loop. The extension performs no allocation in traversal
or per-chunk allocation for its scratch state. Flattening encoded inputs and constructing variable-sized outputs may
use DuckDB-managed allocations outside traversal.

### Numeric types

Feature inputs must be `FLOAT` or `DOUBLE`. Weights and thresholds may use ordinary integer, decimal, `FLOAT`, or
`DOUBLE` literals. DuckDB's numeric promotion rules combine them with the feature type; the resulting computation uses
the `FLOAT` or `DOUBLE` kernel. Integer feature inputs must still be cast explicitly. DuckDB assigns one common logical
type to the elements of `values`; that becomes the function's result type.

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
