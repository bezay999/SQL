import sqlite3

from run_query import open_project, run_query


EXPECTED = {
    "01-library-loans": {
        "overdue_loans": [
            ("Cara", "Night Trains", "2026-09-24", 20),
            ("Ben", "The Last Map", "2026-10-04", 10),
        ],
        "popular_books": [
            ("Small Gardens", 2), ("The Last Map", 2),
            ("Night Trains", 1), ("Python by Example", 0),
        ],
        "member_activity": [("Ada", 2, 1), ("Ben", 2, 1), ("Cara", 1, 1)],
    },
    "02-coffee-shop-sales": {
        "daily_revenue": [
            ("2026-10-10", 2, 2100), ("2026-10-11", 1, 600),
            ("2026-10-12", 1, 750),
        ],
        "best_sellers": [
            ("Croissant", 4, 1400), ("Espresso", 3, 900),
            ("Latte", 2, 900), ("Tea", 1, 250), ("Muffin", 0, 0),
        ],
        "basket_sizes": [(1, 3, 950), (2, 3, 1150), (4, 2, 600), (5, 2, 750)],
    },
    "03-course-progress": {
        "course_progress": [
            ("Cara", "Data Viz", 2, 2, 100.0),
            ("Ada", "Python Basics", 2, 1, 50.0),
            ("Dima", "Python Basics", 2, 0, 0.0),
            ("Ada", "SQL Basics", 3, 3, 100.0),
            ("Ben", "SQL Basics", 3, 1, 33.3),
            ("Cara", "SQL Basics", 3, 0, 0.0),
        ],
        "not_started": [
            ("Cara", "SQL Basics", "2026-09-07"),
            ("Dima", "Python Basics", "2026-09-11"),
        ],
        "course_popularity": [
            ("SQL Basics", 3, 1), ("Python Basics", 2, 0), ("Data Viz", 1, 1),
        ],
    },
    "04-movie-ratings": {
        "top_movies": [
            (1, "Moonline", 3, 4.67), (2, "Old Harbor", 2, 4.5),
            (3, "Glass River", 2, 3.5), (3, "Tiny Planet", 2, 3.5),
        ],
        "genre_summary": [
            ("Sci-Fi", 5, 4.2), ("Drama", 4, 4.0), ("Documentary", 0, None),
        ],
        "viewer_activity": [
            ("Ada", 3, 4.0), ("Ben", 3, 4.0),
            ("Cara", 3, 4.33), ("Dima", 0, None),
        ],
    },
    "05-hotel-reservations": {
        "available_rooms": [("201", 12000)],
        "stay_revenue": [
            ("101", 2, 60000), ("102", 2, 48000), ("201", 1, 36000),
        ],
        "overlap_audit": [("101", 1, 2, "2026-10-20", "2026-10-21")],
    },
}

INVALID_INSERT = {
    "01-library-loans": "INSERT INTO loans VALUES (99, 999, 1, '2026-10-01', '2026-10-02', NULL)",
    "02-coffee-shop-sales": "INSERT INTO order_items VALUES (1, 1, -2, 300)",
    "03-course-progress": "INSERT INTO completions VALUES (4, 1, 1, '2026-10-01')",
    "04-movie-ratings": "INSERT INTO ratings VALUES (4, 1, 6, '2026-10-01')",
    "05-hotel-reservations": "INSERT INTO reservations VALUES (99, 1, 1, '2026-10-20', '2026-10-20', 'confirmed')",
}


def main():
    total_queries = 0
    for folder, queries in EXPECTED.items():
        connection, _ = open_project(folder)
        try:
            if connection.execute("PRAGMA integrity_check").fetchone()[0] != "ok":
                raise AssertionError(f"{folder}: database integrity check failed")
            if connection.execute("PRAGMA foreign_key_check").fetchall():
                raise AssertionError(f"{folder}: broken foreign key")
            try:
                connection.execute(INVALID_INSERT[folder])
            except sqlite3.IntegrityError:
                pass
            else:
                raise AssertionError(f"{folder}: invalid row was accepted")
        finally:
            connection.close()

        for name, expected in queries.items():
            _, actual = run_query(folder, name)
            if actual != expected:
                raise AssertionError(f"{folder}/{name}: expected {expected}, got {actual}")
            total_queries += 1
        print(f"{folder}: schema, constraints, and {len(queries)} queries passed")
    print(f"{len(EXPECTED)} projects and {total_queries} queries passed")


if __name__ == "__main__":
    main()
