CREATE TABLE students (
    student_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE courses (
    course_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE lessons (
    lesson_id INTEGER PRIMARY KEY,
    course_id INTEGER NOT NULL REFERENCES courses(course_id),
    title TEXT NOT NULL,
    UNIQUE (course_id, title),
    UNIQUE (course_id, lesson_id)
);

CREATE TABLE enrollments (
    student_id INTEGER NOT NULL REFERENCES students(student_id),
    course_id INTEGER NOT NULL REFERENCES courses(course_id),
    joined_on TEXT NOT NULL,
    PRIMARY KEY (student_id, course_id)
);

CREATE TABLE completions (
    student_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    lesson_id INTEGER NOT NULL,
    completed_on TEXT NOT NULL,
    PRIMARY KEY (student_id, lesson_id),
    FOREIGN KEY (student_id, course_id) REFERENCES enrollments(student_id, course_id),
    FOREIGN KEY (course_id, lesson_id) REFERENCES lessons(course_id, lesson_id)
);

CREATE INDEX lessons_by_course ON lessons(course_id);
