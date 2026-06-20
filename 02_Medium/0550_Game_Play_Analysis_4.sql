-- Solution 1: should have better performance
WITH FirstLogin AS (
    SELECT player_id, MIN(event_date) AS min_date
    FROM Activity
    GROUP BY player_id
),

ConsecutivePlayers AS (
    SELECT 
        DISTINCT player_id
    FROM Activity
    JOIN FirstLogin USING(player_id)
    WHERE event_date - min_date = 1
)

SELECT
    ROUND(COUNT(cp.player_id) * 1.0 / COUNT(fl.player_id), 2) AS fraction
FROM FirstLogin fl
LEFT JOIN ConsecutivePlayers cp ON fl.player_id = cp.player_id;

-- Solution 2: should have lower performance
WITH FirstLogins AS(
    SELECT
        player_id,
        MIN(event_date) AS fl_date -- first login (fl) date
    FROM Activity
    GROUP BY player_id
)

SELECT
    ROUND(COUNT(CASE WHEN fl.fl_date + 1 = a.event_date THEN 1 END) / COUNT(DISTINCT a.player_id)::numeric, 2) AS fraction
FROM FirstLogins fl
JOIN Activity a ON fl.player_id = a.player_id;

