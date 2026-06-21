-- Write your PostgreSQL query statement below
WITH Rcount AS (
    SELECT requester_id AS id, COUNT(requester_id) AS req_friends
    FROM RequestAccepted
    GROUP BY requester_id
),

Acount AS (
    SELECT accepter_id AS id, COUNT(accepter_id) AS acc_friends
    FROM RequestAccepted
    GROUP BY accepter_id
)

SELECT
    id,
    COALESCE(req_friends, 0) + COALESCE(acc_friends, 0) AS num
FROM Rcount
FULL OUTER JOIN Acount USING(id)
GROUP BY id
ORDER BY num DESC
LIMIT 1;