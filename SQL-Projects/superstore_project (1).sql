CREATE TABLE superstore_sales (
    row_id INTEGER,
    order_id VARCHAR(50),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code INTEGER,
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name TEXT,
    sales NUMERIC(12,2)
);

SELECT * FROM superstore_sales;

DROP TABLE superstore_sales;

SELECT COUNT(*) AS total_rows
FROM superstore_sales;

SELECT *
FROM superstore_sales
LIMIT 10;

SELECT
    COUNT(*) AS total_rows,
    COUNT(order_id) AS orders,
    COUNT(customer_id) AS customers,
    COUNT(product_id) AS products,
    COUNT(sales) AS sales_records
FROM superstore_sales;

SELECT
    COUNT(*) AS total_rows,
    COUNT(postal_code) AS postal_codes,
    COUNT(*) - COUNT(postal_code) AS missing_postal_codes
FROM superstore_sales;

SELECT
    COUNT(row_id) AS total_rows,
    MIN(row_id) AS minimum_row_id,
    MAX(row_id) AS maximum_row_id,
    AVG(row_id) AS average_row_id
FROM superstore_sales;

SELECT
    COUNT(sales) AS sales_records,
    SUM(sales) AS total_sales,
    AVG(sales) AS average_sales,
    MIN(sales) AS minimum_sales,
    MAX(sales) AS maximum_sales
FROM superstore_sales;

SELECT
    category,
    COUNT(*) AS number_of_orders,
    SUM(sales) AS total_sales,
    AVG(sales) AS average_sales
FROM superstore_sales
GROUP BY category
ORDER BY total_sales DESC;

SELECT
    CASE
        WHEN sales >= 1000 THEN 'High Sales'
        WHEN sales >= 500 THEN 'Medium Sales'
        ELSE 'Low Sales'
    END AS sales_status,
    COUNT(*) AS number_of_orders,
    SUM(sales) AS total_sales
FROM superstore_sales
GROUP BY
    CASE
        WHEN sales >= 1000 THEN 'High Sales'
        WHEN sales >= 500 THEN 'Medium Sales'
        ELSE 'Low Sales'
    END
ORDER BY total_sales DESC;