-- Write your PostgreSQL query statement below
WITH ManagersStats AS (
    SELECT
        reports_to AS employee_id,
        COUNT(reports_to) AS reports_count,
        ROUND(AVG(age), 0) AS average_age
    FROM Employees
    WHERE reports_to IS NOT NULL
    GROUP BY reports_to
)

SELECT 
    employee_id,
    e.name,
    ms.reports_count,
    ms.average_age
FROM ManagersStats ms
JOIN Employees e USING(employee_id)
ORDER BY employee_id;