-- Write your PostgreSQL query statement below
WITH ActionCounts AS (
    SELECT 
        s.user_id,
        COUNT(CASE WHEN action='confirmed'THEN 1 END) AS confirmed_actions,
        COUNT(DISTINCT(c.time_stamp)) AS num_actions
    FROM Signups s
    LEFT JOIN Confirmations c ON s.user_id = c.user_id
    GROUP BY s.user_id

)

SELECT
    user_id,
    CASE
        WHEN confirmed_actions = 0 AND num_actions = 0 THEN 0
        ELSE ROUND(confirmed_actions*1.0/num_actions::numeric, 2)
    END AS confirmation_rate
FROM ActionCounts;
