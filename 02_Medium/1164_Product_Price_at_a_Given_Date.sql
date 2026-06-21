-- Write your PostgreSQL query statement below
WITH LatestDate AS (
    SELECT
        product_id,
        MAX(CASE WHEN change_date <= '2019-08-16' THEN change_date END) AS latest_date
    FROM Products
    GROUP BY product_id
)

SELECT 
    ld.product_id,
    COALESCE(new_price, 10) AS price
FROM LatestDate ld
LEFT JOIN Products p 
    ON ld.product_id = p.product_id
    AND ld.latest_date = p.change_date;