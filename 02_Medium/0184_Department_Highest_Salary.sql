SELECT d.name AS "Department", e.name AS "Employee", e.salary AS "Salary"
FROM
(
SELECT departmentId, max(salary) AS "max_salary"
FROM Employee
GROUP BY departmentId
ORDER BY departmentId
) AS t1
JOIN Department AS d ON d.id = t1.departmentid
JOIN Employee AS e ON e.departmentid = t1.departmentid
WHERE t1.max_salary = e.salary
;
