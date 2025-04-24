# task3_sql_for_data_analysis
📊 SQL for Data Analysis (Task 3) – A hands-on SQL project using a mock Ecommerce dataset to practice writing queries, joins, aggregate functions, subqueries, and views. Includes schema setup, analysis queries. Built with MySQL.

# 📊 Task 3: SQL for Data Analysis

## 🚀 Objective
Use SQL to extract, analyze, and summarize structured data from an Ecommerce dataset using MySQL.

---

## 🛠️ Tools Used
- **MySQL** – For database creation and query execution
- **MySQL Workbench / phpMyAdmin** – For running and visualizing query outputs
- **VSCode / Text Editor** – For writing SQL scripts
- **PDF Viewer** – For viewing screenshots and documentation

---

## 📁 Files Included

| File Name              | Description                                      |
|------------------------|--------------------------------------------------|
| `task3_data_analysis.sql` | SQL script to create schema, insert sample data, and run queries |
| `task3_output.pdf`     | Contains screenshots of outputs |

---

## 📦 Dataset
A mock Ecommerce dataset with the following tables:
- `customers(customer_id, name, email, created_at)`
- `products(product_id, name, category, price)`
- `orders(order_id, customer_id, order_date, total_amount)`
- `order_items(order_item_id, order_id, product_id, quantity, price)`

---

## 🔍 SQL Concepts Used
- `SELECT`, `WHERE`, `ORDER BY`, `GROUP BY`
- `INNER JOIN`, `LEFT JOIN`
- Aggregate functions: `SUM()`, `AVG()`
- Subqueries
- Views (`CREATE VIEW`)
- Indexing for optimization
- `HAVING` clause for post-aggregation filtering

---

## ✅ Sample Analysis Tasks Covered
- Total revenue per customer
- Top 5 products by revenue
- Customers with no orders
- Monthly revenue trend
- Revenue per product view
- Subqueries: products ordered more than once
- Index creation and `EXPLAIN` for performance


---

## 📝 How to Use
1. Clone the repository or download files
2. Open `task3_data_analysis.sql` in MySQL Workbench
3. Run the script step-by-step
4. Refer to `task3_output.pdf` for expected results and explanations

---

## 📧 Contact
Feel free to reach out for any questions or feedback!

---

