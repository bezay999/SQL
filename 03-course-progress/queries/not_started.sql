SELECT s.name AS student, c.title AS course, e.joined_on
FROM enrollments AS e
JOIN students AS s ON s.student_id = e.student_id
JOIN courses AS c ON c.course_id = e.course_id
WHERE NOT EXISTS (
    SELECT 1
    FROM completions AS cp
    JOIN lessons AS l ON l.lesson_id = cp.lesson_id
    WHERE cp.student_id = e.student_id AND l.course_id = e.course_id
)
ORDER BY e.joined_on, s.name;
