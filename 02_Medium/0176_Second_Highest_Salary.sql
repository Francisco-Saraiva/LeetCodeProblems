-- Write your PostgreSQL query statement below
SELECT (  -- Outer select forces NULL in case there the Inner select is empty
    SELECT
        DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    OFFSET 1 LIMIT 1
) AS SecondHighestSalary