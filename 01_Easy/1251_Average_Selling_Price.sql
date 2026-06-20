-- Write your PostgreSQL query statement below
-- Solution 1
SELECT t1.product_id, 
    COALESCE(ROUND((SUM(total_cost)::numeric / NULLIF(SUM(units), 0)),2), 0) AS average_price
FROM (
    SELECT Prices.product_id, COALESCE((price * units), 0) AS total_cost, COALESCE(units, 0) AS units
    FROM Prices LEFT JOIN UnitsSold ON Prices.product_id = UnitsSold.product_id
    AND UnitsSold.purchase_date BETWEEN Prices.start_date AND Prices.end_Date
) AS t1
GROUP BY product_id
;
-- Write your PostgreSQL query statement below
-- Solution 2
WITH SalesInfo AS (
    SELECT 
        p.product_id,
        p.price * us.units AS sell_value,
        us.units
    FROM Prices p
    LEFT JOIN UnitsSold us ON p.product_id = us.product_id
    AND us.purchase_date BETWEEN p.start_date AND p.end_date
)

SELECT 
    product_id,
    COALESCE(
        ROUND(SUM(sell_value) * 1.0 / SUM(units)::numeric, 2), 0
    ) AS average_price
FROM SalesInfo
GROUP BY product_id;
