-- Write your PostgreSQL query statement below

WITH StadiumId AS (
    SELECT 
        id,
        visit_date,
        people,
        LAG(id, 1) OVER (ORDER BY id) AS prev_visit_id
    FROM Stadium
    WHERE people >= 100
),

StadiumFlagged AS (
    SELECT
        *,
        CASE 
            WHEN prev_visit_id IS NULL THEN 1
            WHEN id = prev_visit_id + 1 THEN 0
            ELSE 1
        END AS seq_start
    FROM StadiumId
),

StadiumGrouped AS (
    SELECT 
        *,
        SUM(seq_start) OVER(ORDER BY id) AS group_id
    FROM StadiumFlagged
), 

ValidGroupIds AS (
    SELECT
        group_id
    FROM StadiumGrouped
    GROUP BY group_id
    HAVING COUNT(group_id) >= 3
)

SELECT
    id,
    visit_date,
    people
FROM StadiumGrouped
WHERE group_id IN (SELECT * FROM ValidGroupIds)
ORDER BY visit_date ASC;