-- Query 2: Monthly Sales Trend
SELECT
    -- Truncate the timestamp to the beginning of the month for grouping
    DATE_TRUNC('month', o.order_purchase_timestamp)::DATE AS sales_month,
    -- Sum the price for each month
    SUM(oi.price) AS monthly_revenue
FROM
    orders AS o
JOIN
    order_items AS oi ON o.order_id = oi.order_id
WHERE
    o.order_status = 'delivered'
GROUP BY
    sales_month
ORDER BY
    sales_month;