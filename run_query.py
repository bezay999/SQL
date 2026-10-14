import argparse
from pathlib import Path
import sqlite3


ROOT = Path(__file__).resolve().parent


def open_project(folder):
    project = ROOT / folder
    if not project.is_dir() or project.parent != ROOT:
        raise ValueError("Choose one of the project folders in this repository")
    connection = sqlite3.connect(":memory:")
    connection.execute("PRAGMA foreign_keys = ON")
    try:
        connection.executescript((project / "schema.sql").read_text(encoding="utf-8"))
        connection.executescript((project / "seed.sql").read_text(encoding="utf-8"))
    except Exception:
        connection.close()
        raise
    return connection, project


def run_query(folder, name):
    if not name.replace("_", "").isalnum():
        raise ValueError("Query name may only use letters, numbers, and underscores")
    connection, project = open_project(folder)
    try:
        query = (project / "queries" / f"{name}.sql").read_text(encoding="utf-8")
        cursor = connection.execute(query)
        columns = [item[0] for item in cursor.description]
        return columns, cursor.fetchall()
    finally:
        connection.close()


def main():
    parser = argparse.ArgumentParser(description="Run one SQL portfolio query in memory")
    parser.add_argument("project")
    parser.add_argument("query")
    args = parser.parse_args()
    try:
        columns, rows = run_query(args.project, args.query)
    except (OSError, ValueError, sqlite3.Error) as error:
        parser.error(str(error))
    widths = [max(len(column), *(len(str(row[index])) for row in rows))
              for index, column in enumerate(columns)]
    print("  ".join(column.ljust(widths[index]) for index, column in enumerate(columns)))
    print("  ".join("-" * width for width in widths))
    for row in rows:
        print("  ".join(str(value).ljust(widths[index]) for index, value in enumerate(row)))
    if not rows:
        print("(no rows)")


if __name__ == "__main__":
    main()
