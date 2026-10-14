SELECT p.name,
       COALESCE(SUM(CASE WHEN o.status = 'completed' THEN oi.quantity ELSE 0 END), 0) AS units_sold,
       COALESCE(SUM(CASE WHEN o.status = 'completed' THEN oi.quantity * oi.price_cents ELSE 0 END), 0) AS revenue_cents
FROM products AS p
LEFT JOIN order_items AS oi ON oi.product_id = p.product_id
LEFT JOIN orders AS o ON o.order_id = oi.order_id
GROUP BY p.product_id, p.name
ORDER BY units_sold DESC, p.name;
