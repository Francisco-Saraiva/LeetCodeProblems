-- Write your PostgreSQL query statement below
-- Solution 1
-- SELECT t1.Department, t1.Employee, t1.Salary
-- FROM (
--     SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary,
--     DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) AS place
--     FROM Employee AS e
--     JOIN Department AS d ON e.departmentId = d.id
-- ) AS t1
-- WHERE place <= 3
-- ;

-- Solution 2
-- Write your PostgreSQL query statement below
WITH RankedSalaries AS (
    SELECT 
        d.name AS d,
        e.name AS e,
        e.salary AS s,
        DENSE_RANK() OVER(PARTITION BY d.id ORDER BY e.salary DESC) AS rank
    FROM Employee e
    JOIN Department d ON e.departmentId = d.id
)

SELECT 
    d AS "Department",
    e AS "Employee",
    s AS "Salary"
FROM RankedSalaries
WHERE rank <= 3;