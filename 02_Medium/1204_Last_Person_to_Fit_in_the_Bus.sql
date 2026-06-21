-- Write your PostgreSQL query statement below
WITH CumSum AS (
    SELECT
        person_name,
        turn,
        SUM(weight) OVER(ORDER BY turn) AS cum_weight
    FROM Queue
)

SELECT 
    person_name
FROM CumSum
WHERE cum_weight <= 1000
ORDER BY turn DESC
LIMIT 1;