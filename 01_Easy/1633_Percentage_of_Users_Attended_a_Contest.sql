-- Write your PostgreSQL query statement below
WITH UserCount AS (
    SELECT
        COUNT(user_id) AS num_users
    FROM Users
)

SELECT
    contest_id,
    ROUND((COUNT(user_id)::numeric / (SELECT num_users FROM UserCount)*100), 2) AS percentage
FROM Register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id ASC;