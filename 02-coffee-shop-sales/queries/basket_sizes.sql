SELECT o.order_id,
       SUM(oi.quantity) AS items_count,
       SUM(oi.quantity * oi.price_cents) AS total_cents
FROM orders AS o
JOIN order_items AS oi ON oi.order_id = o.order_id
WHERE o.status = 'completed'
GROUP BY o.order_id
ORDER BY o.order_id;
