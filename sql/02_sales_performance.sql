-- 02_sales_performance.sql

-- 1. Monthly revenue
SELECT DATE_TRUNC('month', order_date::date) AS month,
       ROUND(SUM(revenue), 2) AS monthly_revenue
FROM sales_data
GROUP BY 1
ORDER BY 1;

-- 2. Average order value
SELECT ROUND(AVG(revenue), 2) AS average_order_value
FROM sales_data;

-- 3. Product revenue
SELECT product,
       SUM(quantity) AS units_sold,
       ROUND(SUM(revenue), 2) AS total_revenue
FROM sales_data
GROUP BY product
ORDER BY total_revenue DESC;

-- 4. Sales representative performance
SELECT sales_rep,
       COUNT(*) AS orders,
       ROUND(SUM(revenue), 2) AS total_revenue,
       ROUND(AVG(revenue), 2) AS average_order_value
FROM sales_data
GROUP BY sales_rep
ORDER BY total_revenue DESC;

-- 5. Industry performance
SELECT industry,
       ROUND(SUM(revenue), 2) AS total_revenue
FROM sales_data
GROUP BY industry
ORDER BY total_revenue DESC;

