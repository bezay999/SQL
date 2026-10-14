INSERT INTO rooms (room_id, room_number, nightly_rate_cents) VALUES
    (1, '101', 10000), (2, '102', 8000), (3, '201', 12000);

INSERT INTO guests (guest_id, name) VALUES
    (1, 'Ada'), (2, 'Ben'), (3, 'Cara'), (4, 'Dima');

INSERT INTO reservations
    (reservation_id, room_id, guest_id, check_in, check_out, status) VALUES
    (1, 1, 1, '2026-10-18', '2026-10-21', 'confirmed'),
    (2, 1, 2, '2026-10-20', '2026-10-23', 'confirmed'),
    (3, 2, 3, '2026-10-19', '2026-10-22', 'confirmed'),
    (4, 3, 4, '2026-10-20', '2026-10-24', 'cancelled'),
    (5, 3, 1, '2026-10-22', '2026-10-25', 'confirmed'),
    (6, 2, 2, '2026-10-23', '2026-10-26', 'confirmed');
