-- Business Analysis Queries
-- Dataset: Amazon Sales
-- Platform: Databricks SQL

-- 1. Total Revenue
SELECT
  ROUND(SUM(amount), 2) AS total_revenue
FROM ecommerce.amazon_sales_clean;

-- 2. Revenue by Category
SELECT
  category,
  ROUND(SUM(amount), 2) AS revenue
FROM ecommerce.amazon_sales_clean
GROUP BY category
ORDER BY revenue DESC;

-- 3. Average Ticket Value
SELECT
  ROUND(SUM(amount) / SUM(qty), 2) AS avg_ticket
FROM ecommerce.amazon_sales_clean;

-- 4. B2B vs B2C Performance
SELECT
  b2b,
  COUNT(*) AS total_orders,
  ROUND(SUM(amount), 2) AS revenue
FROM ecommerce.amazon_sales_clean
GROUP BY b2b;

-- 5. Monthly Sales Trend
SELECT
  DATE_TRUNC('month', sale_date) AS month,
  COUNT(*) AS orders,
  ROUND(SUM(amount), 2) AS revenue
FROM ecommerce.amazon_sales_clean
GROUP BY month
ORDER BY month;
