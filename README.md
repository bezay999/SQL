# Five small SQL case studies

This is the SQL part of my portfolio. Each folder starts with a small fictional dataset and a few questions I would actually want to answer from it. The schemas and queries are written for SQLite, so there is no server to set up and no account to create.

| Project | What I practiced |
|---|---|
| [Library Loans](01-library-loans/README.md) | Joins, overdue records, grouped counts |
| [Coffee Shop Sales](02-coffee-shop-sales/README.md) | Order lines, revenue, filtering refunds |
| [Course Progress](03-course-progress/README.md) | Many-to-many data, progress rates, CTEs |
| [Movie Ratings](04-movie-ratings/README.md) | Aggregates, ranking, window functions |
| [Hotel Reservations](05-hotel-reservations/README.md) | Date overlap, availability, data-quality checks |

Every project has `schema.sql`, `seed.sql`, and three focused queries. The data is made up, and the queries use fixed reference dates where time matters, so the examples give the same results whenever you run them.

Python 3.9+ is enough to run a query in a temporary in-memory database:

```bash
python3 run_query.py 01-library-loans overdue_loans
```

The project READMEs list their query names and explain the results. To check all schemas, foreign keys, and query outputs at once:

```bash
python3 check_all.py
```
