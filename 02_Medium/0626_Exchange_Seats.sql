-- Write your PostgreSQL query statement below
WITH NumStudents AS (
    SELECT COUNT(id) AS num_students
    FROM Seat
)

SELECT
    CASE
        aWHEN id % 2 = 1 AND id = (SELECT * FROM NumStudents) THEN id
        WHEN id % 2 = 1 THEN id+1
        WHEN id % 2 = 0 THEN id-1
    END AS id,
    student
FROM Seat
ORDER BY id;