INSERT INTO products (product_id, name, category, current_price_cents) VALUES
    (1, 'Espresso', 'Drink', 300),
    (2, 'Latte', 'Drink', 450),
    (3, 'Croissant', 'Food', 350),
    (4, 'Tea', 'Drink', 250),
    (5, 'Muffin', 'Food', 400);

INSERT INTO orders (order_id, ordered_on, status) VALUES
    (1, '2026-10-10', 'completed'),
    (2, '2026-10-10', 'completed'),
    (3, '2026-10-11', 'refunded'),
    (4, '2026-10-11', 'completed'),
    (5, '2026-10-12', 'completed');

INSERT INTO order_items (order_id, product_id, quantity, price_cents) VALUES
    (1, 1, 2, 300), (1, 3, 1, 350),
    (2, 2, 1, 450), (2, 3, 2, 350),
    (3, 2, 2, 450),
    (4, 4, 1, 250), (4, 3, 1, 350),
    (5, 1, 1, 300), (5, 2, 1, 450);
