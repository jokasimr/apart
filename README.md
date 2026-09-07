# dtree

`dtree` is a DuckDB extension for evaluating affine binary decision trees directly in SQL. It is intended for applying a fixed tree efficiently to many rows while keeping both the data and the computation inside DuckDB.

## Usage

The extension provides two forms of the `decision_tree` scalar function:

```sql
decision_tree(tree, x1, x2, ..., xn) -> T
decision_tree(tree, features)         -> T
```

The first form accepts one or more feature arguments. The second accepts a fixed-size DuckDB `ARRAY`. Feature values must be `FLOAT` or `DOUBLE`.

The tree must be constant for the query. Its leaf values must have one common type, which becomes the return type `T`. Leaf values may use any DuckDB type, including `STRUCT`, `LIST`, and `ARRAY`.

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
LOAD dtree;

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

The equivalent array form is:

```sql
SELECT decision_tree(example_tree(), [x, y]::FLOAT[2]) AS result
FROM measurements;
```

Weights and thresholds may use any numeric type and are converted to the feature computation type. Integer features must be cast to `FLOAT` or `DOUBLE`. If any feature is `NULL`, the result is `NULL`.

## Building and testing

```sh
make
make test
```
