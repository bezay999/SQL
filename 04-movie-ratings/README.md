# Movie Ratings

Ratings are more useful with a little context. A film with one five-star vote should not automatically outrank one with several strong votes, and an unrated film should not disappear from every report.

```bash
python3 run_query.py 04-movie-ratings top_movies
python3 run_query.py 04-movie-ratings genre_summary
python3 run_query.py 04-movie-ratings viewer_activity
```

`top_movies` requires at least two ratings and uses `DENSE_RANK` to handle ties. The genre and viewer reports use left joins, so a new genre or viewer with no ratings still shows up. These are fictional films and people.
