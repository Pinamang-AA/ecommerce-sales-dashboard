-- Query 3: Top 10 Product Categories by Revenue
SELECT
    p.product_category_name,
    SUM(oi.price) AS category_revenue
FROM
    products AS p
JOIN
    order_items AS oi ON p.product_id = oi.product_id
JOIN
    orders AS o ON oi.order_id = o.order_id
WHERE
    o.order_status = 'delivered' AND p.product_category_name IS NOT NULL
GROUP BY
    p.product_category_name
ORDER BY
    category_revenue DESC
LIMIT 10;