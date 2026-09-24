-- 01_data_exploration.sql
-- Sales Performance Analysis
-- PostgreSQL syntax

-- 1. Inspect the dataset
SELECT *
FROM sales_data
LIMIT 20;

-- 2. Number of transactions
SELECT COUNT(*) AS total_transactions
FROM sales_data;

-- 3. Date range
SELECT MIN(order_date) AS first_order,
       MAX(order_date) AS last_order
FROM sales_data;

-- 4. Total revenue
SELECT ROUND(SUM(revenue), 2) AS total_revenue
FROM sales_data;

-- 5. Revenue by country
SELECT country,
       ROUND(SUM(revenue), 2) AS total_revenue
FROM sales_data
GROUP BY country
ORDER BY total_revenue DESC;

