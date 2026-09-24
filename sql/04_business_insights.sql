-- 04_business_insights.sql

-- 1. Month-over-month revenue change
WITH monthly_revenue AS (
    SELECT DATE_TRUNC('month', order_date::date) AS month,
           SUM(revenue) AS revenue
    FROM sales_data
    GROUP BY 1
),
with_previous AS (
    SELECT month,
           revenue,
           LAG(revenue) OVER (ORDER BY month) AS previous_month_revenue
    FROM monthly_revenue
)
SELECT month,
       ROUND(revenue, 2) AS revenue,
       ROUND(previous_month_revenue, 2) AS previous_month_revenue,
       ROUND(
           100.0 * (revenue - previous_month_revenue)
           / NULLIF(previous_month_revenue, 0), 2
       ) AS mom_growth_pct
FROM with_previous
ORDER BY month;

-- 2. Highest-revenue product
SELECT product,
       ROUND(SUM(revenue), 2) AS total_revenue
FROM sales_data
GROUP BY product
ORDER BY total_revenue DESC
LIMIT 1;

-- 3. Highest-revenue country
SELECT country,
       ROUND(SUM(revenue), 2) AS total_revenue
FROM sales_data
GROUP BY country
ORDER BY total_revenue DESC
LIMIT 1;

-- 4. Revenue by customer tier
SELECT customer_tier,
       ROUND(SUM(revenue), 2) AS total_revenue,
       COUNT(DISTINCT customer_id) AS customers
FROM sales_data
GROUP BY customer_tier
ORDER BY total_revenue DESC;
