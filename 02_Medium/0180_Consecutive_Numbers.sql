
-- Solution 1: 3 self joins
-- SELECT L1.num AS "ConsecutiveNums" FROM Logs L1, Logs L2, Logs L3
-- WHERE L1.num = L2.num
-- AND L2.num = L3.num
-- AND L1.id + 1 = L2.id
-- AND L2.id + 1 = L3.id 
-- GROUP BY L1.num;

-- Write your PostgreSQL query statement below
-- Solution 2: Using LAG() to get 2 previous numbers
WITH ThreeConsecutiveNums AS (
    SELECT
        num,
        LAG(num, 1) OVER(ORDER BY id) AS prev_num_1,
        LAG(num, 2) OVER(ORDER BY id) AS prev_num_2
    FROM Logs
)

SELECT DISTINCT num AS ConsecutiveNums
FROM ThreeConsecutiveNums
WHERE 
    num = prev_num_1 AND 
    prev_num_1 = prev_num_2;