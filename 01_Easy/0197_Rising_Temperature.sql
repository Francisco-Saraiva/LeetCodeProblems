-- Write your PostgreSQL query statement below
-- Solution 1: self-join, Nlog(N) to N^2 depending on the query optimizer
SELECT w2.id
FROM Weather AS w1, Weather as w2
WHERE w2.temperature > w1.temperature
AND w2.recordDate = w1.recordDate + 1
;

-- Write your PostgreSQL query statement below
-- Solution 2: Nlog(N) AT ALL TIMES
WITH TempComparison AS (
    SELECT
        id,
        temperature,
        recordDate,
        LAG(temperature, 1) OVER(ORDER BY recordDate) AS prev_temp,
        LAG(recordDate, 1) OVER(ORDER BY recordDate) AS prev_date
    FROM Weather
)

SELECT id
FROM TempComparison
WHERE prev_temp IS NOT NULL 
    AND temperature > prev_temp
    AND recordDate - prev_date = 1;
