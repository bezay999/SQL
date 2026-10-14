WITH scores AS (
    SELECT m.title,
           COUNT(r.score) AS rating_count,
           AVG(r.score) AS average_score_raw
    FROM movies AS m
    JOIN ratings AS r ON r.movie_id = m.movie_id
    GROUP BY m.movie_id, m.title
    HAVING COUNT(r.score) >= 2
)
SELECT DENSE_RANK() OVER (ORDER BY average_score_raw DESC) AS position,
       title, rating_count, ROUND(average_score_raw, 2) AS average_score
FROM scores
ORDER BY position, title;
