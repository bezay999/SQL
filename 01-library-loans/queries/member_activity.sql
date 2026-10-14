SELECT m.name,
       COUNT(l.loan_id) AS total_loans,
       COUNT(CASE WHEN l.returned_on IS NULL THEN 1 END) AS active_loans
FROM members AS m
LEFT JOIN loans AS l ON l.member_id = m.member_id
GROUP BY m.member_id, m.name
ORDER BY total_loans DESC, m.name;
