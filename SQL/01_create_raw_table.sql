-- Create RAW table from CSV stored in Databricks Volume

CREATE TABLE ecommerce.amazon_sales_raw AS
SELECT
  `Order ID`        AS order_id,
  Date              AS sale_date,
  Status            AS status,
  Fulfilment        AS fulfilment,
  `Sales Channel `  AS sales_channel,
  `Courier Status`  AS courier_status,
  Style             AS style,
  SKU               AS sku,
  ASIN              AS asin,
  Category          AS category,
  Size              AS size,
  Qty               AS qty,
  Amount            AS amount,
  Currency          AS currency,
  B2B               AS b2b
FROM read_files(
  '/Volumes/workspace/ecommerce/raw_data/',
  format => 'csv',
  header => true,
  inferSchema => true
);
