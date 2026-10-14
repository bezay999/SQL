SELECT room.room_number,
       COUNT(stay.reservation_id) AS confirmed_stays,
       COALESCE(SUM(CAST(julianday(stay.check_out) - julianday(stay.check_in) AS INTEGER)
                    * room.nightly_rate_cents), 0) AS booked_cents
FROM rooms AS room
LEFT JOIN reservations AS stay
    ON stay.room_id = room.room_id AND stay.status = 'confirmed'
GROUP BY room.room_id, room.room_number
ORDER BY booked_cents DESC, room.room_number;
