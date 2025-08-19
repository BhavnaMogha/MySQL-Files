 # Zomato-Dataset-Analysis-Using-MySQL

Using Mysql, Excel and dataset analysis

📌 Overview
This project analyzes a sample Zomato dataset using SQL queries to extract meaningful insights about customer behavior, spending patterns, and restaurant visits.
The dataset is divided into four relational tables. By applying JOIN operations and various SQL clauses, we uncover key trends and answer specific business questions.

🛠 Requirements
SQL Database (e.g., MySQL Workbench, PostgreSQL, or any RDBMS)

Zomato Dataset Tables (Create Table & Insert Data scripts provided in script.sql)

⚙ Database Setup
1.Create a new database in your preferred SQL environment.

2.Run the script.sql file to create tables and insert dataset values.

3.Verify that all four tables are properly created and populated.

📊 Sample Queries

1️⃣ Number of days each customer visited Zomato

SELECT userid, COUNT(DISTINCT created_date) AS visit_days
FROM sale
GROUP BY userid;

2️⃣ Total amount spent by each customer

SELECT s.userid, SUM(p.price) AS total_expenditure
FROM sale AS s
LEFT JOIN product AS p
ON s.product_id = p.product_id
GROUP BY s.userid
ORDER BY s.userid;

📌 Key Features
Use of JOINs for multi-table data analysis

Aggregation with COUNT, SUM functions

Grouping results with GROUP BY

Sorting data for clear presentation

🙌 Acknowledgments
Inspired by real-world restaurant data analytics to improve decision-making.
Feel free to contribute, suggest improvements, or extend the queries for deeper insights.
