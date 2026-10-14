SELECT room.room_number, room.nightly_rate_cents
FROM rooms AS room
WHERE NOT EXISTS (
    SELECT 1
    FROM reservations AS stay
    WHERE stay.room_id = room.room_id
      AND stay.status = 'confirmed'
      AND stay.check_in < '2026-10-22'
      AND stay.check_out > '2026-10-20'
)
ORDER BY room.room_number;
