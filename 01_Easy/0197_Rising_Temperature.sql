-- Write your PostgreSQL query statement below
SELECT w2.id
FROM Weather AS w1, Weather as w2
WHERE w2.temperature > w1.temperature
AND w2.recordDate = w1.recordDate + 1
; 