E-commerce Sales Dashboard (SQL & Tableau)
View the Live Interactive Dashboard on Tableau Public
Project Overview
This project is an end-to-end data analysis of the Brazilian E-commerce (Olist) dataset. The primary goal was to use SQL to perform data analysis and build an interactive dashboard in Tableau to track and analyze key sales performance indicators (KPIs) and trends.

This project demonstrates the complete data analysis workflow: from loading raw data into a database, writing complex SQL queries for analysis, to visualizing the insights in a business-facing dashboard.

Tools Used
Database: PostgreSQL

Querying & Analysis: SQL

Visualization: Tableau

Database Client: DBeaver

Data Source
The dataset used is the "Brazilian E-commerce Public Dataset by Olist," which is publicly available on Kaggle. It contains nearly 100,000 orders with data on products, customers, payments, and sellers, stored across multiple tables.

Business Questions Answered
This dashboard was built to answer key business questions:

What are our overall KPIs? (Total Revenue, Total Orders, Average Order Value)

What is the monthly sales trend? (Are we growing? Are there seasonal patterns?)

Which product categories are our top performers? (Where should we focus marketing?)

Who are our most valuable customers? (Who should we target for loyalty programs?)

SQL Queries
The core of the analysis was done in SQL. The following queries were used to create the data sources for the Tableau dashboard.

(Note: This is where you show off your code. Use the "```sql" markdown for formatting.)

1. Overall KPIs
SQL

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
2. Monthly Sales Trend
SQL

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
3. Top 10 Product Categories
SQL

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
