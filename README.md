# Sales Performance Analysis Using SQL

## Project Overview

This project analyzes fictional B2B technology sales data to understand revenue performance, customer behavior, product performance, geographic trends and sales representative performance.

The project is designed to demonstrate practical SQL skills and business-oriented analytical thinking.

## Business Questions

- What is total revenue?
- How does revenue change over time?
- Which countries generate the most revenue?
- Which products generate the most revenue?
- Who are the highest-value customers?
- Which industries generate the most revenue?
- Which sales representatives generate the most revenue?
- What percentage of revenue comes from the top 10 customers?
- How can customers be segmented based on revenue?
- How do customers rank within their country?
- What is month-over-month revenue growth?

## Tools

- PostgreSQL
- SQL
- Excel
- GitHub

## SQL Skills Demonstrated

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- Aggregate functions
- CASE statements
- CTEs
- Subqueries
- JOINs
- Window functions
- LAG
- RANK
- Date functions
- Customer segmentation

## Dataset

The dataset contains 1,500 fictional B2B sales transactions covering January 2025 through June 2026.

It includes:

- Order information
- Customer information
- Country and industry
- Customer tier
- Products and categories
- Quantity
- Unit price
- Discounts
- Revenue
- Sales representative

The dataset is fictional and created for portfolio purposes.

## Project Structure

```text
sales-performance-sql-analysis/
├── README.md
├── data/
│   └── sales_data.csv
├── sql/
│   ├── 01_data_exploration.sql
│   ├── 02_sales_performance.sql
│   ├── 03_customer_analysis.sql
│   └── 04_business_insights.sql
└── results/
    └── expected_results.csv
```

## Analytical Approach

The project begins with basic data exploration and progressively uses more advanced SQL techniques.

### 1. Data Exploration

The first stage checks the dataset, transaction count, date range and overall revenue.

### 2. Sales Performance

The second stage analyzes monthly revenue, products, sales representatives and industries.

### 3. Customer Analysis

The third stage identifies top customers, segments customers by revenue and ranks customers within their country.

### 4. Business Insights

The final stage uses CTEs and window functions to calculate month-over-month revenue changes and summarize key commercial findings.

## Business Insights

The `results/expected_results.csv` file contains benchmark results generated from the dataset. After loading the CSV into PostgreSQL, your queries should reproduce these figures.

## About This Project

This portfolio project combines commercial experience with SQL and data analysis. The goal is to demonstrate the ability to translate business questions into SQL analysis and communicate findings in a business context.
