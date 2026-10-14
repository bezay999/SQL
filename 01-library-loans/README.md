# Library Loans

A library has books, members, and loan records. I used a fixed date of 2026-10-14 for the overdue question, so the answer does not change next week.

From the repository root, try:

```bash
python3 run_query.py 01-library-loans overdue_loans
python3 run_query.py 01-library-loans popular_books
python3 run_query.py 01-library-loans member_activity
```

The first query finds books that are still out after their due date. The second includes books nobody has borrowed, which is why it uses a left join. The last one compares each member's total and active loans. The seed is intentionally small enough to check the results by eye.
