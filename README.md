# 🛒 Retail Supply Chain & Sales Analysis Dashboard

An end-to-end **Data Analyst project** that analyzes retail store sales data using **SQL and Power BI** to uncover business insights such as sales trends, customer behavior, product performance, and the impact of discounts on profit.

---

# 📊 Dashboard Preview

![Dashboard](https://github.com/Praveenkumar-p-gif/Retail-Supply-Chain-Sales-Analysis-SQL-Power-BI-Data-Analytics-Project/blob/main/Screenshot%202026-03-10%20103442.png)

---

# 📌 Project Overview

Retail businesses generate large amounts of transaction data every day.  
This project analyzes retail sales data to identify key insights that help businesses improve profitability and decision-making.

The project includes:

• Data Cleaning using SQL  
• Business Insights using SQL Queries  
• Interactive Dashboard using Power BI  

---

# 🎯 Business Questions Solved

This project answers important business questions:

- What are the **monthly sales trends**?
- Which **regions generate low profit**?
- Which **products generate the most revenue**?
- Are **discounts hurting profits**?
- Who are the **repeat customers**?
- Which **products have high sales but low profit**?

---

# 🛠 Tools & Technologies

| Tool | Purpose |
|-----|------|
| SQL (MySQL) | Data cleaning & analysis |
| Power BI | Dashboard visualization |
| Excel / CSV | Dataset |
| GitHub | Project documentation |

---

# 📂 Dataset

The dataset contains retail store transaction data including:

- Order ID
- Order Date
- Customer Name
- Region
- Category
- Product Name
- Sales
- Quantity
- Discount
- Profit

---

# 🧹 Data Cleaning

Data cleaning steps performed using SQL:

- Renamed columns
- Converted text dates to DATE format
- Removed unnecessary columns
- Structured dataset for analysis

Example:

```sql
ALTER TABLE superstore_sales
RENAME COLUMN `Order ID` TO order_id,
RENAME COLUMN `Order Date` TO order_date,
RENAME COLUMN `Product Name` TO product_name,
RENAME COLUMN `Sales` TO sales,
RENAME COLUMN `Profit` TO profit;
```

---

# 📈 SQL Analysis

## 1️⃣ Month Over Month Sales Analysis

```sql
SELECT
EXTRACT(YEAR FROM order_date) AS year,
EXTRACT(MONTH FROM order_date) AS month,
ROUND(SUM(sales),2) AS total_sales
FROM superstore_sales
GROUP BY year, month
ORDER BY year, month;
```

---

## 2️⃣ Region Performance

```sql
SELECT 
region,
ROUND(SUM(sales),2) AS total_sales,
ROUND(SUM(profit),2) AS total_profit
FROM superstore_sales
GROUP BY region
ORDER BY total_profit ASC;
```

---

## 3️⃣ Top 5 Products by Revenue

```sql
SELECT 
product_name,
ROUND(SUM(sales),2) AS total_sales
FROM superstore_sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 5;
```

---

## 4️⃣ Discount Impact on Profit

```sql
SELECT 
discount,
ROUND(SUM(sales),2) AS total_sales,
ROUND(SUM(profit),2) AS total_profit
FROM superstore_sales
GROUP BY discount
ORDER BY total_profit ASC;
```

---

# 📊 Dashboard Features

The Power BI dashboard provides:

✔ Total Sales  
✔ Total Profit  
✔ Profit Margin  
✔ Total Orders  
✔ Repeat Customers  
✔ Monthly Sales Trends  
✔ Top Revenue Products  
✔ Sales vs Profit Analysis  
✔ Discount Impact Analysis  

---

# 🔍 Key Insights

Important insights discovered:

• Sales show **seasonal fluctuations**  
• **High discounts significantly reduce profit margins**  
• **Top products generate majority of revenue**  
• Some products deliver **high sales but very low profit**  
• **Repeat customers contribute major revenue**

---

# 📁 Project Structure

```
Retail-Sales-Analysis
│
├── data
│   └── retail_store_data.csv
│
├── sql
│   └── retail_sales_analysis.sql
│
├── dashboard
│   └── retail_sales_dashboard.pbix
│
├── images
│   └── dashboard.png
│
└── README.md
```

---

# 🚀 Skills Demonstrated

- Data Cleaning
- SQL Window Functions
- Data Analysis
- Business Intelligence
- Dashboard Design
- Data Storytelling

---

# 👨‍💻 Author

**Praveen Kumar**

Aspiring Data Analyst  
Skills: **SQL | Power BI | Python | Excel**

---
