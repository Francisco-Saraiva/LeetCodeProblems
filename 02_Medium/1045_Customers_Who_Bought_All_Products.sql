-- Write your PostgreSQL query statement below
WITH NumProducts AS (
    SELECT COUNT(product_key) AS num_products
    FROM Product
)

SELECT
    customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT(product_key)) = (SELECT * FROM NumProducts);