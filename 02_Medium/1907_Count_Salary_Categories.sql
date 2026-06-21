-- Write your PostgreSQL query statement below
WITH CatSalaries AS (
    SELECT 
        CASE
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income > 50000 THEN 'High Salary'
            ELSE 'Average Salary'
        END AS category
    FROM Accounts
),

Categories AS (
    SELECT 'Low Salary' AS category
    UNION
    SELECT 'Average Salary'
    UNION
    SELECT 'High Salary'
)

SELECT
    c.category,
    COUNT(cs.category) AS accounts_count
FROM CatSalaries cs
RIGHT JOIN Categories c ON cs.category = c.category
GROUP BY c.category;