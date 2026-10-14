SELECT room.room_number,
       first.reservation_id AS first_booking,
       second.reservation_id AS second_booking,
       MAX(first.check_in, second.check_in) AS overlap_starts,
       MIN(first.check_out, second.check_out) AS overlap_ends
FROM reservations AS first
JOIN reservations AS second
    ON second.room_id = first.room_id
   AND second.reservation_id > first.reservation_id
   AND second.status = 'confirmed'
   AND first.check_in < second.check_out
   AND second.check_in < first.check_out
JOIN rooms AS room ON room.room_id = first.room_id
WHERE first.status = 'confirmed'
ORDER BY room.room_number, first_booking;
