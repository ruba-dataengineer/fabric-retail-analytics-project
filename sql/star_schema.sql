1)Bronze Layer (Raw Tables) - Create raw tables.

Products Table:
CREATE TABLE bronze_products (
    product_id VARCHAR(10),
    product_name VARCHAR(50),
    category VARCHAR(50)
);


Orders Table:
CREATE TABLE bronze_orders (
    order_id INT,
    customer_id INT,
    product_id VARCHAR(10),
    order_date DATE,
    sales_amount INT
);

Customers Table
CREATE TABLE bronze_customers (
    customer_id INT,
    total_sales INT
);


2)Silver Layer (Cleaned Data)

Silver Orders
CREATE VIEW silver_orders_vw AS
SELECT
    order_id,
    customer_id,
    product_id,
    order_date,
    sales_amount
FROM bronze_orders
WHERE order_id IS NOT NULL;

Silver Products
CREATE VIEW silver_products_vw AS
SELECT
    product_id,
    product_name,
    category
FROM bronze_products
WHERE product_id IS NOT NULL;

Silver Customers
CREATE VIEW silver_customers_vw AS
SELECT
    customer_id,
    total_sales
FROM bronze_customers;

3) Gold Layer (Analytics Model) - Create dimension + fact views for reporting.

Product Dimension
CREATE VIEW dim_products AS
SELECT
    product_id,
    product_name,
    category
FROM silver_products_vw;

Customer Dimension
CREATE VIEW dim_customers AS
SELECT
    customer_id,
    total_sales
FROM silver_customers_vw;

Fact Sales
CREATE VIEW fact_sales AS
SELECT
    o.order_id,
    o.customer_id,
    o.product_id,
    o.order_date,
    o.sales_amount,
    p.product_name,
    p.category
FROM silver_orders_vw o
JOIN silver_products_vw p
ON o.product_id = p.product_id;

4) Queries Used in the Dashboard

Total Sales
SELECT SUM(sales_amount) AS Total_Sales
FROM fact_sales;

Total Orders
SELECT COUNT(order_id) AS Total_Orders
FROM fact_sales;

Total Customers
SELECT COUNT(DISTINCT customer_id) AS Total_Customers
FROM fact_sales;

Sales Over Time
SELECT
    order_date,
    SUM(sales_amount) AS Sales
FROM fact_sales
GROUP BY order_date
ORDER BY order_date;

Sales by Category
SELECT
    category,
    SUM(sales_amount) AS Sales
FROM fact_sales
GROUP BY category
ORDER BY Sales DESC;

Top Products
SELECT
    product_name,
    SUM(sales_amount) AS Sales
FROM fact_sales
GROUP BY product_name
ORDER BY Sales DESC;

Sales by Customer
SELECT
    customer_id,
    SUM(sales_amount) AS Sales
FROM fact_sales
GROUP BY customer_id
ORDER BY Sales DESC;

Recent Orders
SELECT
    order_id,
    order_date,
    sales_amount
FROM fact_sales
ORDER BY order_date DESC;
