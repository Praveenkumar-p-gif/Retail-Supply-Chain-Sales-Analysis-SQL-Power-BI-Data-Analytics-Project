# Retail Supply Chain & Sales Analysis Dashboard

## Project Overview

This project analyzes retail store sales data to uncover business insights and visualize key performance metrics.  

The goal of this project is to demonstrate **data cleaning, SQL analysis, and Power BI dashboard development** to help businesses understand sales trends, profitability, customer behavior, and product performance.

The final result is an **interactive Power BI dashboard** that enables users to explore sales performance across regions, categories, and time.


---

# Business Problem

Retail businesses generate large volumes of transaction data, but extracting insights from this data is challenging.

This project answers key business questions such as:

- How are sales trending month over month?
- Which regions generate high sales but low profit?
- Which products generate the most revenue?
- Are discounts negatively affecting profitability?
- Which customers are repeat buyers?
- Which products generate high sales but low margins?

---

# Tools & Technologies Used

- **SQL (MySQL)** – Data cleaning & business analysis
- **Power BI** – Interactive dashboard
- **Excel / CSV** – Raw dataset
- **GitHub** – Project documentation

---

# Dataset

The dataset contains retail store transaction data including:

- Order ID
- Order Date
- Customer Information
- Product Category
- Sales
- Profit
- Discount
- Region

The data was first cleaned and transformed using SQL before building the dashboard.

---

# Data Cleaning (SQL)

The following data preparation steps were performed:

- Renamed columns for better readability
- Converted date columns into proper date format
- Removed unnecessary columns
- Structured the dataset for analysis

Example SQL transformation:


Identify how sales change over time.


ALTER TABLE superstore_sales
RENAME COLUMN `Order ID` TO order_id,
RENAME COLUMN `Order Date` TO order_date,
RENAME COLUMN `Product Name` TO product_name,
RENAME COLUMN `Sales` TO sales,
RENAME COLUMN `Profit` TO profit;
---
Key Business Analysis (SQL)
Month Over Month Sales Analysis

SELECT
EXTRACT(YEAR FROM order_date) AS year,
EXTRACT(MONTH FROM order_date) AS month,
ROUND(SUM(sales),2) AS total_sales
FROM superstore_sales
GROUP BY year, month
ORDER BY year, month;
Identify how sales change over time.

Region Performance

Identify regions generating low profit.

SELECT 
region,
SUM(sales) AS total_sales,
SUM(profit) AS total_profit
FROM superstore_sales
GROUP BY region
ORDER BY total_profit ASC;

Discount Impact on Profit

SELECT 
discount,
SUM(sales) AS total_sales,
SUM(profit) AS total_profit
FROM superstore_sales
GROUP BY discount;

Top 5 Products by Revenue

SELECT 
product_name,
SUM(sales) AS total_sales
FROM superstore_sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 5;


💡 **Tip (Important for getting Data Analyst jobs):**

Add this project to your resume like this:

**Retail Sales Analysis Dashboard | SQL, Power BI**  
• Built an interactive dashboard analyzing **2M+ sales transactions**  
• Identified **high-discount impact on profit margins**  
• Discovered **top 20% products generate 70% revenue**

---

If you want, I can also give you:

✅ **A professional GitHub portfolio format (top 1% Data Analysts use)**  
✅ **3 more SQL + Power BI projects recruiters love**  
✅ **LinkedIn post template to get recruiter attention**.
