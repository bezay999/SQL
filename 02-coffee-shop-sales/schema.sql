CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    category TEXT NOT NULL,
    current_price_cents INTEGER NOT NULL CHECK (current_price_cents > 0)
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    ordered_on TEXT NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('completed', 'refunded'))
);

CREATE TABLE order_items (
    order_id INTEGER NOT NULL REFERENCES orders(order_id),
    product_id INTEGER NOT NULL REFERENCES products(product_id),
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    price_cents INTEGER NOT NULL CHECK (price_cents > 0),
    PRIMARY KEY (order_id, product_id)
);

CREATE INDEX orders_by_day ON orders(ordered_on);
