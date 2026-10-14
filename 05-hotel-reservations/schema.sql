CREATE TABLE rooms (
    room_id INTEGER PRIMARY KEY,
    room_number TEXT NOT NULL UNIQUE,
    nightly_rate_cents INTEGER NOT NULL CHECK (nightly_rate_cents > 0)
);

CREATE TABLE guests (
    guest_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE reservations (
    reservation_id INTEGER PRIMARY KEY,
    room_id INTEGER NOT NULL REFERENCES rooms(room_id),
    guest_id INTEGER NOT NULL REFERENCES guests(guest_id),
    check_in TEXT NOT NULL,
    check_out TEXT NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('confirmed', 'cancelled')),
    CHECK (check_out > check_in)
);

CREATE INDEX reservations_by_room_dates ON reservations(room_id, check_in, check_out);
