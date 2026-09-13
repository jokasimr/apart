# apart

`apart` is a DuckDB extension for evaluating affine, or oblique, decision trees directly in SQL. It aims to do so efficiently both for deep and shallow trees and for decisions involving few or many variables.

## Usage

The extension provides two forms of the `decision_tree` scalar function:

```sql
decision_tree(tree, x1, x2, ..., xn) -> T
decision_tree(tree, features) -> T
```

The first form accepts one or more feature arguments. The second accepts a fixed-size DuckDB `ARRAY`. Feature values may be integers, decimals, `FLOAT`, or `DOUBLE`.

The tree must be constant for the query. Its leaf values must have one common type, which becomes the return type `T` of the function. Leaf values may use any DuckDB type, including `STRUCT`, `LIST`, and `ARRAY`.

## Tree format

A tree is a `STRUCT` with four fields:

| Field | Type | Contents |
|---|---|---|
| `weights` | nested `LIST` or `ARRAY` | One numeric weight vector per internal node, in feature-argument order. |
| `thresholds` | `LIST` or `ARRAY` | One numeric threshold per internal node. |
| `children` | nested `LIST` or `ARRAY` | Two signed integer references per internal node, ordered `[above, below]`. |
| `values` | `LIST` or `ARRAY` | The values returned by the leaves. |

Node `i` evaluates:

```text
sum(weights[i][j] * x[j]) >= thresholds[i]
```

If the condition is true, evaluation follows the first child reference (`above`). Otherwise, it follows the second (`below`). Equality therefore follows `above`.

> **NaN:** Node comparisons use native IEEE floating-point semantics, not DuckDB's SQL ordering for NaN. If the score or threshold is NaN, the condition is false and evaluation follows `below`.

Child references use this encoding:

```text
 1  -> first node
 2  -> second node
-1  -> first leaf value
-2  -> second leaf value
-3  -> third leaf value
```

Positive references index `weights`, `thresholds`, and `children`; negative references index `values`. References are one-based, matching DuckDB list indexing, and `0` is invalid.

The root is always node `1`. `weights`, `thresholds`, and `children` must have the same length, and every weight vector must have one entry per feature. Weights, thresholds, and child references cannot be `NULL`; leaf values may be. All nodes and leaf values must be reachable from the root. Cycles and shared internal nodes are not allowed.

## Example

This tree returns `negative` when `x < 0`. Otherwise, it returns `low` when `y < 10` and `high` when `y >= 10`.

```sql
LOAD apart;

CREATE MACRO example_tree() AS {
    weights: [
        [1.0, 0.0],
        [0.0, 1.0]
    ],
    thresholds: [0.0, 10.0],
    children: [
        [2, -1],
        [-3, -2]
    ],
    values: ['negative', 'low', 'high']
};

SELECT decision_tree(example_tree(), x, y) AS result
FROM measurements;
```

Features can also be passed as an array:

```sql
SELECT decision_tree(example_tree(), [x, y]::FLOAT[2]) AS result
FROM measurements;
```

The computation type is selected from all weights, thresholds, and features: if any is `DOUBLE`, use `DOUBLE`; otherwise, if any is `FLOAT`, use `FLOAT`; otherwise, use `DOUBLE`. Feature conversions follow DuckDB's implicit casting rules. These conversions can lose precision. If any feature is `NULL`, the result is `NULL`.

See [example use cases](examples/README.md).


## Fixed depth (optional optimization)

Decision trees where each leaf is at the same depth are called "fixed depth trees". They can be evaluated more efficiently because every row traverses the same number of nodes.

Variable-depth trees can be converted explicitly with `fixed_depth`:

```sql
decision_tree(fixed_depth(tree), x1, x2, ..., xn) -> T
```

`fixed_depth(tree)` pads every shallow leaf to the tree's existing maximum depth without changing the result. This lets `decision_tree` use fixed-depth optimizations and can speed up evaluation *if the original tree was already close to fixed depth*. But if the tree is skewed with some leaves near the root and others at much deeper levels, or if the distribution of input features is such that most rows reach a shallow leaf, then adding padding and making the depth fixed might not be beneficial.

An already fixed-depth tree is returned unchanged. The conversion happens once during binding; the helper has no per-row execution cost.

Padding creates a complete topology with `2^D - 1` internal nodes for maximum depth `D`. To prevent accidental
excessive expansion for deep sparse trees, the helper rejects padding that would create more than 1,000,000 internal nodes.


## Building and testing

```sh
make
make test
```

## Benchmarks

The [benchmark dashboard](https://jokasimr.github.io/apart/) lists published results by revision. When a baseline is available, each report compares the complete traversal matrix against it. Raw samples, the tested extension, and the generated results are retained as artifacts by the benchmark workflow. See [benchmark/README.md](benchmark/README.md) for the matrix definition and local usage.
