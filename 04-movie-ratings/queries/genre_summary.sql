SELECT m.genre,
       COUNT(r.score) AS rating_count,
       ROUND(AVG(r.score), 2) AS average_score
FROM movies AS m
LEFT JOIN ratings AS r ON r.movie_id = m.movie_id
GROUP BY m.genre
ORDER BY rating_count DESC, m.genre;
