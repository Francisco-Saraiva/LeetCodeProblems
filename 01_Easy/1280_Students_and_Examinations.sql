SELECT 
    s.student_id, s.student_name, sbj.subject_name,
    COUNT(CASE WHEN s.student_id = e.student_id AND e.subject_name = sbj.subject_name THEN 1 END) AS attended_exams
FROM Students s
CROSS JOIN Subjects sbj
CROSS JOIN Examinations e
GROUP BY s.student_id, s.student_name, sbj.subject_name
ORDER BY s.student_id, sbj.subject_name;