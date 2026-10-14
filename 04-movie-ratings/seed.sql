INSERT INTO movies (movie_id, title, release_year, genre) VALUES
    (1, 'Moonline', 2024, 'Sci-Fi'),
    (2, 'Glass River', 2022, 'Drama'),
    (3, 'Tiny Planet', 2025, 'Sci-Fi'),
    (4, 'Old Harbor', 2020, 'Drama'),
    (5, 'Quiet Forest', 2023, 'Documentary');

INSERT INTO viewers (viewer_id, name) VALUES
    (1, 'Ada'), (2, 'Ben'), (3, 'Cara'), (4, 'Dima');

INSERT INTO ratings (viewer_id, movie_id, score, rated_on) VALUES
    (1, 1, 5, '2026-10-01'), (2, 1, 4, '2026-10-02'), (3, 1, 5, '2026-10-03'),
    (1, 2, 4, '2026-10-04'), (2, 2, 3, '2026-10-05'),
    (1, 3, 3, '2026-10-06'), (3, 3, 4, '2026-10-07'),
    (2, 4, 5, '2026-10-08'), (3, 4, 4, '2026-10-09');
