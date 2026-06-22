-- Write your PostgreSQL query statement below
-- Solution 1

-- WITH Orders2019 AS (
--     SELECT
--         o.buyer_id,
--         COUNT(order_id) AS orders_in_2019
--     FROM Users u
--     JOIN Orders o ON u.user_id = o.buyer_id
--     WHERE EXTRACT(YEAR FROM o.order_date) = 2019
--     GROUP BY o.buyer_id
-- )

-- SELECT 
--     u.user_id AS buyer_id,
--     join_date,
--     COALESCE(orders_in_2019, 0) AS orders_in_2019
-- FROM Users u
-- LEFT JOIN Orders2019 O ON u.user_id = O.buyer_id;

-- Write your PostgreSQL query statement below
-- Solution 2: More efficient
SELECT
    u.user_id AS buyer_id,
    u.join_date,
    COUNT(CASE WHEN EXTRACT(YEAR FROM o.order_date) = 2019 THEN 1 END) AS orders_in_2019
FROM Users u
LEFT JOIN Orders o ON u.user_id = o.buyer_id
GROUP BY u.user_id, u.join_date;
