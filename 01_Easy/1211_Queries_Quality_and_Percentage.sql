-- Write your PostgreSQL query statement below
SELECT
    query_name,
    ROUND(AVG(rating::numeric/position), 2) AS quality,
    ROUND((COUNT(CASE WHEN rating < 3 THEN 1 END)::numeric / COUNT(*))*100, 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name;