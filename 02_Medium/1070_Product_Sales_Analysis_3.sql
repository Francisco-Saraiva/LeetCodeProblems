-- Write your PostgreSQL query statement below
WITH MinYear AS (
    SELECT
        product_id,
        MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
)

SELECT product_id, year AS first_year, quantity, price
FROM Sales
WHERE (product_id, year) IN (SELECT * FROM MinYear);
