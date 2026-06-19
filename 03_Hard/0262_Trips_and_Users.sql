-- Write your PostgreSQL query statement below
-- Solution 1
-- SELECT Cancelled.request_at AS "Day", 
--    ROUND((Cancelled.count / CAST(Total.count AS NUMERIC)), 2) AS "Cancellation Rate"
-- FROM (
--     SELECT t.request_at, COUNT(CASE WHEN t.status != 'completed' THEN 1 END)
--     FROM Trips t
--     JOIN Users u1 ON t.client_id = u1.users_id
--     JOIN Users u2 ON t.driver_id = u2.users_id
--     WHERE (t.request_at >= '2013-10-01') AND (t.request_at <= '2013-10-03')
--     AND u1.banned = 'No' AND u2.banned = 'No'
--     GROUP BY t.request_at
--     ORDER BY t.request_at
-- ) AS Cancelled 
-- JOIN (
--     SELECT t.request_at, COUNT(t.id)
--     FROM Trips t
--     JOIN Users u1 ON t.client_id = u1.users_id
--     JOIN Users u2 ON t.driver_id = u2.users_id
--     WHERE (t.request_at >= '2013-10-01') AND (t.request_at <= '2013-10-03')
--     AND u1.banned = 'No' AND u2.banned = 'No'
--     GROUP BY t.request_at
--     ORDER BY t.request_at
-- ) AS Total 
-- USING(request_at)
-- ;

-- Solution 2
WITH ValidTrips AS (
    SELECT 
        t.id,
        t.request_at AS day,
        t.status
    FROM Trips t
    JOIN Users c ON t.client_id = c.users_id
    JOIN Users d ON t.driver_id = d.users_id
    WHERE request_at BETWEEN '2013-10-01' AND '2013-10-03'
    AND c.banned = 'No'
    AND d.banned = 'No'
),

CompletedTrips AS (
    SELECT
        day,
        COUNT(id) AS num_trips
    FROM ValidTrips
    GROUP BY day
), 

CancelledTrips AS (
    SELECT
        day,
        SUM(CASE WHEN status IN ('cancelled_by_driver', 'cancelled_by_client') THEN 1 ELSE 0 END) AS cancelled_trips
    FROM ValidTrips
    GROUP BY day
)

SELECT
    day,
    ROUND((cancelled_trips * 1.0 / num_trips)::numeric, 2) AS "Cancellation Rate"
FROM CompletedTrips CoT
JOIN CancelledTrips CaT USING(day);
