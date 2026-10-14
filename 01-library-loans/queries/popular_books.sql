SELECT b.title, COUNT(l.loan_id) AS times_borrowed
FROM books AS b
LEFT JOIN loans AS l ON l.book_id = b.book_id
GROUP BY b.book_id, b.title
ORDER BY times_borrowed DESC, b.title;
