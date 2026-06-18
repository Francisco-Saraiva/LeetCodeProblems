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
