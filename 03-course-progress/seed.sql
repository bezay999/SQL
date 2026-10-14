INSERT INTO students (student_id, name) VALUES
    (1, 'Ada'), (2, 'Ben'), (3, 'Cara'), (4, 'Dima');

INSERT INTO courses (course_id, title) VALUES
    (1, 'SQL Basics'), (2, 'Python Basics'), (3, 'Data Viz');

INSERT INTO lessons (lesson_id, course_id, title) VALUES
    (1, 1, 'SELECT'), (2, 1, 'JOIN'), (3, 1, 'GROUP BY'),
    (4, 2, 'Functions'), (5, 2, 'Files'),
    (6, 3, 'Charts'), (7, 3, 'Dashboard');

INSERT INTO enrollments (student_id, course_id, joined_on) VALUES
    (1, 1, '2026-09-01'), (1, 2, '2026-09-10'),
    (2, 1, '2026-09-05'),
    (3, 1, '2026-09-07'), (3, 3, '2026-09-08'),
    (4, 2, '2026-09-11');

INSERT INTO completions (student_id, course_id, lesson_id, completed_on) VALUES
    (1, 1, 1, '2026-09-02'), (1, 1, 2, '2026-09-03'), (1, 1, 3, '2026-09-04'),
    (1, 2, 4, '2026-09-12'),
    (2, 1, 1, '2026-09-06'),
    (3, 3, 6, '2026-09-09'), (3, 3, 7, '2026-09-10');
