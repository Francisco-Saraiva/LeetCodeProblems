-- Write your PostgreSQL query statement below
-- Contains both Inner+Root nodes, but root nodes are easy to filter out later
WITH InnerNodes AS (
    SELECT DISTINCT p_id
    FROM Tree
    WHERE p_id IS NOT NULL
)

SELECT
    id,
    CASE
        WHEN p_id IS NULL THEN 'Root'
        WHEN id IN (SELECT * FROM InnerNodes) THEN 'Inner'
        ELSE 'Leaf'
    END AS "type"
FROM Tree
ORDER BY id ASC;