-- Create CLEAN table with business-ready data

CREATE TABLE ecommerce.amazon_sales_clean AS
SELECT
  order_id,
  CAST(sale_date AS DATE) AS sale_date,
  category,
  sales_channel,
  courier_status,
  sku,
  qty,
  amount,
  currency,
  b2b
FROM ecommerce.amazon_sales_raw
WHERE amount IS NOT NULL
  AND qty > 0;
