WITH progress AS (
    SELECT e.student_id, e.course_id,
           (SELECT COUNT(*) FROM lessons AS l WHERE l.course_id = e.course_id) AS lessons_total,
           (SELECT COUNT(*)
            FROM completions AS cp
            JOIN lessons AS l ON l.lesson_id = cp.lesson_id
            WHERE cp.student_id = e.student_id AND l.course_id = e.course_id) AS lessons_done
    FROM enrollments AS e
)
SELECT c.title,
       COUNT(p.student_id) AS enrolled,
       SUM(CASE WHEN p.lessons_total > 0 AND p.lessons_done = p.lessons_total THEN 1 ELSE 0 END) AS completed
FROM courses AS c
LEFT JOIN progress AS p ON p.course_id = c.course_id
GROUP BY c.course_id, c.title
ORDER BY enrolled DESC, c.title;
