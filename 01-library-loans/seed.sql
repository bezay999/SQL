INSERT INTO books (book_id, title, genre) VALUES
    (1, 'The Last Map', 'Fiction'),
    (2, 'Small Gardens', 'Nonfiction'),
    (3, 'Night Trains', 'Fiction'),
    (4, 'Python by Example', 'Technology');

INSERT INTO members (member_id, name) VALUES
    (1, 'Ada'), (2, 'Ben'), (3, 'Cara');

INSERT INTO loans (loan_id, book_id, member_id, borrowed_on, due_on, returned_on) VALUES
    (1, 1, 1, '2026-09-01', '2026-09-15', '2026-09-13'),
    (2, 1, 2, '2026-09-20', '2026-10-04', NULL),
    (3, 2, 1, '2026-10-01', '2026-10-15', NULL),
    (4, 3, 3, '2026-09-10', '2026-09-24', NULL),
    (5, 2, 2, '2026-08-01', '2026-08-15', '2026-08-14');
