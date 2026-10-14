SELECT s.name AS student, c.title AS course,
       COUNT(l.lesson_id) AS lessons_total,
       COUNT(cp.lesson_id) AS lessons_done,
       ROUND(100.0 * COUNT(cp.lesson_id) / COUNT(l.lesson_id), 1) AS percent_done
FROM enrollments AS e
JOIN students AS s ON s.student_id = e.student_id
JOIN courses AS c ON c.course_id = e.course_id
JOIN lessons AS l ON l.course_id = e.course_id
LEFT JOIN completions AS cp
    ON cp.student_id = e.student_id AND cp.lesson_id = l.lesson_id
GROUP BY e.student_id, e.course_id, s.name, c.title
ORDER BY c.title, s.name;
