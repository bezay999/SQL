# Course Progress

This one starts with a question a small learning platform might ask: who is making progress, and who enrolled but has not started? Students can take several courses, and every course has its own lessons.

```bash
python3 run_query.py 03-course-progress course_progress
python3 run_query.py 03-course-progress not_started
python3 run_query.py 03-course-progress course_popularity
```

The progress query measures finished lessons against all lessons in that course. The last query uses a CTE to count enrollments and fully completed students without pretending that a student who finished one lesson finished the whole course.
