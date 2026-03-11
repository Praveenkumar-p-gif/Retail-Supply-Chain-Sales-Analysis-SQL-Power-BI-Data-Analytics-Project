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

```sql
ALTER TABLE superstore_sales
RENAME COLUMN `Order ID` TO order_id,
RENAME COLUMN `Order Date` TO order_date,
RENAME COLUMN `Product Name` TO product_name,
RENAME COLUMN `Sales` TO sales,
RENAME COLUMN `Profit` TO profit;
