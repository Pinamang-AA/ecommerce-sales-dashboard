-- Query 1: Overall KPIs
SELECT
    -- Calculate total revenue by summing the price of all items
    SUM(oi.price) AS total_revenue,
    -- Count the number of distinct (unique) orders
    COUNT(DISTINCT o.order_id) AS total_orders,
    -- Calculate Average Order Value by dividing total revenue by the number of orders
    SUM(oi.price) / COUNT(DISTINCT o.order_id) AS average_order_value
FROM
    orders AS o
JOIN
    order_items AS oi ON o.order_id = oi.order_id
WHERE
    -- We only want to consider completed orders
    o.order_status = 'delivered';