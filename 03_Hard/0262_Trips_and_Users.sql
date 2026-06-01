-- Write your PostgreSQL query statement below
SELECT Cancelled.request_at AS "Day", 
   ROUND((Cancelled.count / CAST(Total.count AS NUMERIC)), 2) AS "Cancellation Rate"
FROM (
    SELECT t.request_at, COUNT(CASE WHEN t.status != 'completed' THEN 1 END)
    FROM Trips t
    JOIN Users u1 ON t.client_id = u1.users_id
    JOIN Users u2 ON t.driver_id = u2.users_id
    WHERE (t.request_at >= '2013-10-01') AND (t.request_at <= '2013-10-03')
    AND u1.banned = 'No' AND u2.banned = 'No'
    GROUP BY t.request_at
    ORDER BY t.request_at
) AS Cancelled 
JOIN (
    SELECT t.request_at, COUNT(t.id)
    FROM Trips t
    JOIN Users u1 ON t.client_id = u1.users_id
    JOIN Users u2 ON t.driver_id = u2.users_id
    WHERE (t.request_at >= '2013-10-01') AND (t.request_at <= '2013-10-03')
    AND u1.banned = 'No' AND u2.banned = 'No'
    GROUP BY t.request_at
    ORDER BY t.request_at
) AS Total 
USING(request_at)
;
