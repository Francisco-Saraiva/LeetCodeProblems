-- Write your PostgreSQL query statement below
WITH DailyAmount AS (
    SELECT
        ROW_NUMBER() OVER(ORDER BY visited_on) AS id,
        visited_on,
        SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
    ORDER BY visited_on ASC
),

Report AS (
    SELECT
        id,
        visited_on,
        SUM(amount) OVER(
            ORDER BY id
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS amount,
        AVG(amount) OVER(
            ORDER BY id
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS average_amount
    FROM DailyAmount
)

SELECT
    visited_on,
    amount,
    ROUND(average_amount::numeric, 2) AS average_amount
FROM Report
WHERE id >= 7;
