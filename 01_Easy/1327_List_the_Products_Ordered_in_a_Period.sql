-- Write your PostgreSQL query statement below
SELECT
    p.product_name,
    SUM(o.unit) AS unit
FROM Products p
JOIN Orders o USING(product_id)
WHERE TO_CHAR(o.order_date, 'YYYY-MM') = '2020-02'
GROUP BY product_id, p.product_name
HAVING SUM(o.unit) >= 100;