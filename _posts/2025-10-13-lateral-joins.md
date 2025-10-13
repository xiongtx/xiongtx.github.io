---
layout: post
title: Lateral joins
excerpt: An underutilized SQL feature?
---

Lately I've been making use of [lateral joins](https://oracle-base.com/articles/12c/lateral-inline-views-cross-apply-and-outer-apply-joins-12cr1), which simplify (and in some cases optimize) a few common query patterns.

Lateral joins are joins where the right side of a join can reference columns on the left. They're similar to [correlated subqueries](https://www.sqltutorial.org/sql-correlated-subquery/), except they are used in the `FROM` clause and can return multiple rows instead of scalars.

Suppose we have two tables, `CUSTOMERS` and `ORDERS`:

```sql
CREATE TABLE customers (
    id   NUMBER,
    name VARCHAR2(64)
);
```


```sql
CREATE TABLE orders (
    id          NUMBER,
    customer_id NUMBER,
    product     VARCHAR2(64),
    ordered_at  DATE
);
```

Populating some data:

```sql
INSERT INTO customers (
    id,
    name
) VALUES ( 1,
           'alice' );

INSERT INTO customers (
    id,
    name
) VALUES ( 2,
           'bob' );
```

```sql
INSERT INTO orders (
    id,
    customer_id,
    product,
    ordered_at
) VALUES ( 1,
           1,
           'apple',
           sysdate - 7 );

INSERT INTO orders (
    id,
    customer_id,
    product,
    ordered_at
) VALUES ( 2,
           1,
           'apricot',
           sysdate - 6 );

INSERT INTO orders (
    id,
    customer_id,
    product,
    ordered_at
) VALUES ( 3,
           2,
           'banana',
           sysdate - 5 );
```


One common use case is to retrieve one row of the inner table for each row of the outer table based on some condition, e.g. latest by date. Without lateral joins, we could do something like:

```sql
WITH t AS (
    SELECT
        orders.*,
        ROW_NUMBER()
        OVER(PARTITION BY customer_id
             ORDER BY
                 ordered_at DESC
        ) rn
    FROM
        orders
)
SELECT
    c.id   customer_id,
    c.name customer_name,
    t.id   order_id,
    t.product,
    t.ordered_at
FROM
         customers c
    JOIN t ON c.id = t.customer_id
              AND t.rn = 1;
```

| CUSTOMER_ID | CUSTOMER_NAME | ORDER_ID | PRODUCT | ORDERED_AT          |
|:------------|:--------------|:---------|:--------|:--------------------|
| 1           | alice         | 2        | apricot | 2025-10-07 23:20:12 |
| 2           | bob           | 3        | banana  | 2025-10-08 23:20:13 |

Lateral joins provide an arguably more elegant solution:

```sql
SELECT
    c.id   customer_id,
    c.name customer_name,
    t.id   order_id,
    t.product,
    t.ordered_at
FROM
         customers c
    JOIN LATERAL (
        SELECT
            o.*
        FROM
            orders o
        WHERE
            o.customer_id = c.id
        ORDER BY
            ordered_at DESC
        FETCH NEXT 1 ROWS ONLY
    ) t ON TRUE;
```

Since the lateral subquery already returns all relevant rows based on the outer table's row, we can use `CROSS JOIN LATERAL` to avoid the `ON TRUE` join condition:

```sql
SELECT
    c.id   customer_id,
    c.name customer_name,
    t.id   order_id,
    t.product,
    t.ordered_at
FROM
         customers c
    CROSS JOIN LATERAL (
        SELECT
            o.*
        FROM
            orders o
        WHERE
            o.customer_id = c.id
        ORDER BY
            ordered_at DESC
        FETCH NEXT 1 ROWS ONLY
    ) t;
```

Oracle also supports the [`CROSS APPLY`](https://www.mssqltips.com/sqlservertip/1958/sql-server-cross-apply-and-outer-apply/) syntax, which is non-standard and specific to SQl Server.
