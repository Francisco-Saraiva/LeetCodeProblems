-- Write your PostgreSQL query statement below
WITH FirstOrders AS (
    SELECT
        customer_id,
        MIN(order_date) AS fod -- first_order_date
    FROM Delivery
    GROUP BY customer_id
)

SELECT 
   ROUND((COUNT(CASE WHEN fo.fod = d.customer_pref_delivery_date THEN 1 END) 
   / COUNT(*)::numeric) * 100, 2) AS immediate_percentage
FROM FirstOrders fo
JOIN Delivery d 
    ON fo.fod = d.order_date 
    AND fo.customer_id = d.customer_id;