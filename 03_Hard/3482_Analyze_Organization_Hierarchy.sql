-- Write your PostgreSQL query statement below
WITH RECURSIVE Hierarchy AS (
    -- Anchor Query: Select the CEO
    SELECT 
        employee_id,
        employee_name,
        1 AS level
    FROM Employees
    WHERE manager_id IS NULL

    UNION ALL

    -- Recursive Query
    SELECT 
        e.employee_id,
        e.employee_name,
        h.level + 1 AS level
    FROM Employees e
    INNER JOIN Hierarchy h ON e.manager_id = h.employee_id
),

ManagementMap AS(
    -- Anchor Query
    SELECT
        employee_id AS subordinate_id,
        employee_id AS manager_id
    FROM Employees

    UNION ALL

    --Recursive Query
    SELECT
        m.subordinate_id,
        e.manager_id
    FROM ManagementMap m
    INNER JOIN Employees e ON m.manager_id = e.employee_id
    WHERE e.manager_id IS NOT NULL
)

SELECT 
    m.manager_id AS employee_id,
    h.employee_name,
    h.level,
    COUNT(m.subordinate_id) - 1 AS team_size,
    SUM(emp.salary) AS budget
FROM ManagementMap m
JOIN Employees emp ON m.subordinate_id = emp.employee_id
JOIN Hierarchy h ON m.manager_id = h.employee_id
GROUP BY m.manager_id, h.employee_name, h.level
ORDER BY h.level ASC, budget DESC, h.employee_name ASC;
