SELECT m.name AS member, b.title AS book, l.due_on,
       CAST(julianday('2026-10-14') - julianday(l.due_on) AS INTEGER) AS days_late
FROM loans AS l
JOIN members AS m ON m.member_id = l.member_id
JOIN books AS b ON b.book_id = l.book_id
WHERE l.returned_on IS NULL AND l.due_on < '2026-10-14'
ORDER BY days_late DESC, member;
