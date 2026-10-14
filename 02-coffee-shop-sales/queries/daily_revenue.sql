SELECT o.ordered_on,
       COUNT(DISTINCT o.order_id) AS orders_count,
       SUM(oi.quantity * oi.price_cents) AS revenue_cents
FROM orders AS o
JOIN order_items AS oi ON oi.order_id = o.order_id
WHERE o.status = 'completed'
GROUP BY o.ordered_on
ORDER BY o.ordered_on;
