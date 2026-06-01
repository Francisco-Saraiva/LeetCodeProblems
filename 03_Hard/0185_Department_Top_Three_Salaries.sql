-- Write your PostgreSQL query statement below
SELECT t1.Department, t1.Employee, t1.Salary
FROM (
    SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary,
    DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) AS place
    FROM Employee AS e
    JOIN Department AS d ON e.departmentId = d.id
) AS t1
WHERE place <= 3
;