-- CREATE DATABASE
CREATE DATABASE retail_db;
USE retail_db;
Select count(*) from superstore_sales;

-- RENAME COLUMN
ALTER TABLE superstore_sales
RENAME COLUMN `Row ID` TO row_id,
RENAME COLUMN `Order ID` TO order_id,
RENAME COLUMN `Order Date` TO order_date,
RENAME COLUMN `Ship Date` TO ship_date,
RENAME COLUMN `Ship Mode` TO ship_mode,
RENAME COLUMN `Customer ID` TO customer_id,
RENAME COLUMN `Customer Name` TO customer_name,
RENAME COLUMN `Segment` TO segment,
RENAME COLUMN `Country` TO country,
RENAME COLUMN `City` TO city,
RENAME COLUMN `State` TO state,
RENAME COLUMN `Postal Code` TO postal_code,
RENAME COLUMN `Region` TO region,
RENAME COLUMN `Product ID` TO product_id,
RENAME COLUMN `Category` TO category,
RENAME COLUMN `Sub-Category` TO sub_category,
RENAME COLUMN `Product Name` TO product_name,
RENAME COLUMN `Sales` TO sales,
RENAME COLUMN `Quantity` TO quantity,
RENAME COLUMN `Discount` TO discount,
RENAME COLUMN `Profit` TO profit;
SET SQL_SAFE_UPDATES = 0;

-- FORMAT ORDERDATE COLUMN
UPDATE superstore_sales
SET order_date = STR_TO_DATE(order_date, '%m/%d/%Y');

-- CHANGE DATATYPE OF COLUMN
ALTER TABLE superstore_sales
MODIFY order_date DATE;

-- FORMAT ORDERDATE COLUMN
UPDATE superstore_sales
SET ship_date = STR_TO_DATE(ship_date, '%m/%d/%Y');

-- CHANGE DATATYPE OF COLUMN
ALTER TABLE superstore_sales
MODIFY ship_date DATE;

-- REMOVE UNNECESSARY COLUMNS
ALTER TABLE superstore_sales
drop column country,
drop postal_code;

-- Q1: MONTH-OVER-MONTH ANALYSIS
-- 1)
 SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    ROUND (SUM(sales),2) AS total_sales
FROM superstore_sales
GROUP BY year, month
ORDER BY year, month;


-- 2)
 WITH monthly_sales AS (
    SELECT
        EXTRACT(YEAR FROM order_date) AS year,
        EXTRACT(MONTH FROM order_date) AS month,
        SUM(sales) AS total_sales
    FROM superstore_sales
    GROUP BY year, month
)
SELECT
    year,
    month,
    total_sales,
    ROUND(total_sales - LAG(total_sales) OVER (PARTITION BY year ORDER BY month) ,2)AS month_change
FROM monthly_sales
ORDER BY year, month;

-- Q2: REGION THAT IS UNDERRATED
SELECT 
    region,
    round(SUM(sales) , 2) AS total_sales,
    round(SUM(profit) , 2) AS total_profit
FROM superstore_sales
GROUP BY region
ORDER BY total_profit ASC;

-- Q3:Which category are underperforming
Select 
category,
    round(SUM(sales) , 2) AS total_sales,
    round(SUM(profit) , 2) AS total_profit,
     round((SUM(profit) / SUM(sales)) * 100 ,2) AS profit_margin
FROM superstore_sales
GROUP BY category
ORDER BY profit_margin ASC;

-- Q4: ARE DISCOUNT HURTING PROFIT
SELECT 
    discount,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit
FROM superstore_sales
GROUP BY discount
ORDER BY  total_profit ASC;

-- Q5: Top 5 products by revenue?
select 
product_name,
round(sum(sales),2) as total_sales
from superstore_sales
group by product_name
order by total_sales DESC
limit 5;

-- Q6: Which month had highest growth?
 WITH monthly_sales AS (
    SELECT
        EXTRACT(YEAR FROM order_date)  AS year,
        EXTRACT(MONTH FROM order_date) AS month,
        SUM(sales) AS total_sales
    FROM superstore_sales
    GROUP BY year, month
)
, monthly_growth AS (
    SELECT
        year,
        month,
        total_sales,
       ROUND(total_sales
        - LAG(total_sales) OVER (ORDER BY year, month),2)AS sales_growth
    FROM monthly_sales
)
SELECT
    year,
    month,
    sales_growth
FROM monthly_growth
ORDER BY sales_growth DESC
LIMIT 1;

-- Q8: Find which month has the highest sales in each year (2014–2017)
WITH monthly_sales AS (
    SELECT
        EXTRACT(YEAR FROM order_date)  AS year,
        EXTRACT(MONTH FROM order_date) AS month,
        SUM(sales) AS total_sales
    FROM superstore_sales
    GROUP BY year, month
)
, ranked_months AS (
    SELECT
        year,
        month,
        total_sales,
        RANK() OVER (PARTITION BY year ORDER BY total_sales DESC) AS sales_rank
    FROM monthly_sales
)
SELECT
    year,
    month,
    total_sales
FROM ranked_months
WHERE sales_rank = 1
ORDER BY year;

-- Q8: Who are repeat customers?
SELECT
    customer_id,
    COUNT(DISTINCT order_id) AS total_orders
FROM superstore_sales
GROUP BY customer_id
HAVING COUNT(DISTINCT order_id) > 1;

-- Q9 Number of repeat customers
SELECT
    COUNT(*) AS repeat_customer_count
FROM (
    SELECT customer_id
    FROM superstore_sales
    GROUP BY customer_id
    HAVING COUNT(DISTINCT order_id) > 1
) rc;

-- Q10 repeat customers contribution 
WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS order_count,
        SUM(sales) AS total_sales
    FROM superstore_sales
    GROUP BY customer_id
)
SELECT
    CASE
        WHEN order_count > 1 THEN 'Repeat Customers'
        ELSE 'One-Time Customers'
    END AS customer_type,
    ROUND(SUM(total_sales),2) AS sales_contribution
FROM customer_orders
GROUP BY customer_type;

-- Q11: Which products bring high sales but low profit
SELECT
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_pct
FROM superstore_sales
GROUP BY product_name
HAVING SUM(sales) > 10000
ORDER BY profit_margin_pct ASC;


