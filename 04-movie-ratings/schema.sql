CREATE TABLE movies (
    movie_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL UNIQUE,
    release_year INTEGER NOT NULL CHECK (release_year BETWEEN 1900 AND 2100),
    genre TEXT NOT NULL
);

CREATE TABLE viewers (
    viewer_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE ratings (
    viewer_id INTEGER NOT NULL REFERENCES viewers(viewer_id),
    movie_id INTEGER NOT NULL REFERENCES movies(movie_id),
    score INTEGER NOT NULL CHECK (score BETWEEN 1 AND 5),
    rated_on TEXT NOT NULL,
    PRIMARY KEY (viewer_id, movie_id)
);

CREATE INDEX ratings_by_movie ON ratings(movie_id);
