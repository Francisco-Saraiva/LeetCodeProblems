-- Write your PostgreSQL query statement below

WITH Managers AS (
    SELECT DISTINCT manager_id
    FROM Employees
    WHERE manager_id IS NOT NULL
),

ManagersInCompany AS (
    SELECT DISTINCT employee_id
    FROM Employees
    WHERE employee_id IN (SELECT manager_id FROM Managers)
)

SELECT
    employee_id
FROM Employees
WHERE manager_id NOT IN (SELECT * FROM ManagersInCompany)
AND manager_id IS NOT NULL
AND salary < 30000
ORDER BY employee_id;