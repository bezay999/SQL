SELECT v.name,
       COUNT(r.movie_id) AS movies_rated,
       ROUND(AVG(r.score), 2) AS average_given
FROM viewers AS v
LEFT JOIN ratings AS r ON r.viewer_id = v.viewer_id
GROUP BY v.viewer_id, v.name
ORDER BY movies_rated DESC, v.name;
