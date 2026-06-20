-- Write your PostgreSQL query statement below
WITH MostRated AS (
    SELECT u.name AS results
    FROM MovieRating mr
    JOIN Users u ON mr.user_id = u.user_id
    GROUP BY u.name
    ORDER BY COUNT(DISTINCT movie_id) DESC, u.name ASC
    LIMIT 1
),

BestMovie AS (
    SELECT m.title AS results
    FROM MovieRating mr
    JOIN Movies m ON mr.movie_id = m.movie_id
    WHERE EXTRACT(YEAR FROM created_at) = 2020 
        AND EXTRACT (MONTH FROM created_at) = 2
    GROUP BY m.title
    ORDER BY AVG(rating) DESC, title ASC
    LIMIT 1
)

SELECT * FROM MostRated
UNION ALL
SELECT * FROM BestMovie;