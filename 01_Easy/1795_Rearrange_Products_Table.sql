-- Write your PostgreSQL query statement below
WITH Store1 AS (
    SELECT
        product_id,
        'store1' AS store,
        store1 AS price
    FROM Products
    WHERE store1 IS NOT NULL
),

Store2 AS (
    SELECT
        product_id,
        'store2' AS store,
        store2 AS price
    FROM Products
    WHERE store2 IS NOT NULL    
),

Store3 AS (
    SELECT
        product_id,
        'store3' AS store,
        store3 AS price
    FROM Products
    WHERE store3 IS NOT NULL 
)

SELECT * FROM Store1
UNION ALL
SELECT * FROM Store2
UNION ALL
SELECT * FROM Store3;
