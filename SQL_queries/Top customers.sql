-- Query 4: Top 10 Customers by Total Spending
SELECT
    c.customer_unique_id,
    SUM(oi.price) AS total_spent
FROM
    customers AS c
JOIN
    orders AS o ON c.customer_id = o.customer_id
JOIN
    order_items AS oi ON o.order_id = oi.order_id
WHERE
    o.order_status = 'delivered'
GROUP BY
    c.customer_unique_id
ORDER BY
    total_spent DESC
LIMIT 10;