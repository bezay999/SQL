# Hotel Reservations

Dates are the tricky part here. A guest checks out in the morning, so a new guest can check in that same day. I treat stays as half-open ranges: check-in is included, check-out is not.

```bash
python3 run_query.py 05-hotel-reservations available_rooms
python3 run_query.py 05-hotel-reservations stay_revenue
python3 run_query.py 05-hotel-reservations overlap_audit
```

The availability question uses the fictional dates 2026-10-20 through 2026-10-22. Cancelled reservations do not block rooms or count toward revenue. The seed deliberately has one double-booking; `overlap_audit` finds it. That is a data-quality example, not a booking system ready for real guests.
