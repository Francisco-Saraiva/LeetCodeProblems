-- User that rated the greatest number of movies
WITH GreatestUser AS (
    SELECT
        u.name AS results
    FROM MovieRating mr
    JOIN Users u ON mr.user_id = u.user_id
    GROUP BY u.name
    ORDER BY COUNT(DISTINCT movie_id) DESC, u.name ASC
    LIMIT 1
),

-- Movie with highest average rating in 2020-02
BestMovie AS (
    SELECT
        m.title AS results
    FROM MovieRating mr
    JOIN Movies m ON mr.movie_id = m.movie_id
    WHERE TO_CHAR(created_at, 'YYYY-MM') = '2020-02'
    GROUP BY m.title
    ORDER BY AVG(rating) DESC, m.title ASC
    LIMIT 1
)

-- Use UNION ALL to join both CTEs
SELECT results FROM GreatestUser
UNION ALL
SELECT results FROM BestMovie;