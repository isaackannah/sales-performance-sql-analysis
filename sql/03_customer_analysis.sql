-- 03_customer_analysis.sql

-- 1. Top 10 customers
SELECT customer_name,
       country,
       industry,
       customer_tier,
       ROUND(SUM(revenue), 2) AS total_revenue
FROM sales_data
GROUP BY customer_name, country, industry, customer_tier
ORDER BY total_revenue DESC
LIMIT 10;

-- 2. Customer segmentation
WITH customer_revenue AS (
    SELECT customer_id,
           customer_name,
           SUM(revenue) AS total_revenue
    FROM sales_data
    GROUP BY customer_id, customer_name
)
SELECT customer_name,
       ROUND(total_revenue, 2) AS total_revenue,
       CASE
           WHEN total_revenue >= 50000 THEN 'High Value'
           WHEN total_revenue >= 20000 THEN 'Medium Value'
           ELSE 'Low Value'
       END AS customer_segment
FROM customer_revenue
ORDER BY total_revenue DESC;

-- 3. Revenue concentration: top 10 customers
WITH customer_revenue AS (
    SELECT customer_id, SUM(revenue) AS total_revenue
    FROM sales_data
    GROUP BY customer_id
),
ranked AS (
    SELECT *,
           RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
    FROM customer_revenue
)
SELECT ROUND(
           100.0 * SUM(CASE WHEN revenue_rank <= 10 THEN total_revenue ELSE 0 END)
           / SUM(total_revenue), 2
       ) AS top_10_revenue_share_pct
FROM ranked;

-- 4. Customer ranking within country
SELECT customer_name,
       country,
       ROUND(SUM(revenue), 2) AS total_revenue,
       RANK() OVER (
           PARTITION BY country
           ORDER BY SUM(revenue) DESC
       ) AS country_rank
FROM sales_data
GROUP BY customer_name, country
ORDER BY country, country_rank;
