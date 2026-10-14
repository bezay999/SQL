# Coffee Shop Sales

An order can contain several products, and a refund should not quietly count as revenue. This case study keeps prices on the order line, because a menu price might change later.

```bash
python3 run_query.py 02-coffee-shop-sales daily_revenue
python3 run_query.py 02-coffee-shop-sales best_sellers
python3 run_query.py 02-coffee-shop-sales basket_sizes
```

The amounts are stored in cents instead of floating-point currency. `daily_revenue` and `best_sellers` leave refunded orders out. The bestseller query still shows a product that has not sold yet.
