CREATE TABLE books (
    book_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL UNIQUE,
    genre TEXT NOT NULL
);

CREATE TABLE members (
    member_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE loans (
    loan_id INTEGER PRIMARY KEY,
    book_id INTEGER NOT NULL REFERENCES books(book_id),
    member_id INTEGER NOT NULL REFERENCES members(member_id),
    borrowed_on TEXT NOT NULL,
    due_on TEXT NOT NULL,
    returned_on TEXT,
    CHECK (due_on >= borrowed_on),
    CHECK (returned_on IS NULL OR returned_on >= borrowed_on)
);

CREATE INDEX loans_by_book ON loans(book_id);
CREATE INDEX loans_by_member ON loans(member_id);
