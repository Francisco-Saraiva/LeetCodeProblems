-- Write your PostgreSQL query statement below

-- Solution 1: Find Employees with 1 department, then filter out
-- employees with a primary department OR with 1 department

-- WITH SingleDeptEmp AS (
--     SELECT employee_id
--     FROM Employee
--     GROUP BY employee_id
--     HAVING COUNT(department_id) = 1
-- )

-- SELECT 
--     employee_id,
--     department_id
-- FROM Employee
-- WHERE 
--     primary_flag = 'Y' OR 
--     employee_id IN (SELECT employee_id FROM SingleDeptEmp);

-- Solution 2: Use ROW_NUMBER() to order departments, for each employee, from the Yes ('Y') to No ('N').
-- In each case, prim_dept = 1 will contain either the single department of the employee OR the 'Y' flag department
WITH DeptCount AS (
    SELECT
        *,
        ROW_NUMBER() OVER (PARTITION BY employee_id ORDER BY primary_flag DESC) AS prim_dept
    FROM Employee
)

SELECT employee_id, department_id
FROM DeptCount
WHERE prim_dept = 1;