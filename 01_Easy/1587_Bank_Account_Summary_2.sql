-- Write your PostgreSQL query statement below

SELECT
    u.name,
    SUM(amount) AS balance
FROM Users u
JOIN Transactions t ON u.account = t.account
GROUP BY u.account, u.name
HAVING SUM(amount) > 10000;