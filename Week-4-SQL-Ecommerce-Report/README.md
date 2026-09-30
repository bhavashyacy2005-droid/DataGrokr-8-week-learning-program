# E-Commerce SQL Report

This is my Week 4 SQL mini-project. I created a small e-commerce database and used SQL queries to explore customers, products, orders, and sales.

The main purpose of this project was to practice SQL concepts such as `JOIN`, `GROUP BY`, aggregate functions, `NULL` handling, sorting, filtering, and database constraints.

## About the Project

The database contains four main tables:

* Customers
* Products
* Orders
* Order_Items

These tables are connected using primary keys and foreign keys to represent a simple e-commerce system.

## What I Worked On

I created more than 35 SQL queries covering different types of operations.

Some of the queries are used to:

* Display customers and products
* Find the cheapest and most expensive products
* Find products based on price or category
* Calculate average product prices
* Find total orders and quantities sold
* Calculate total sales
* Find customer spending
* Find the top-selling products
* Find customers with the highest spending
* Find products that have not been ordered
* Find customers who have not placed an order
* Handle `NULL` values
* Filter orders based on their status
* Use `JOIN` between multiple tables

## SQL Concepts Used

The project includes:

* `CREATE DATABASE`
* `CREATE TABLE`
* `INSERT`
* `SELECT`
* `WHERE`
* `ORDER BY`
* `GROUP BY`
* `HAVING`
* `JOIN`
* `LEFT JOIN`
* `DISTINCT`
* `COUNT`
* `SUM`
* `AVG`
* `LIMIT`
* `IS NULL`
* `COALESCE`
* Primary Key
* Foreign Key
* `NOT NULL`
* `UNIQUE`
* `CHECK`
* `ALTER TABLE`

## Database Structure

```text
Customers
    |
    | customer_id
    |
    v
Orders
    |
    | order_id
    |
    v
Order_Items
    |
    | product_id
    |
    v
Products
```

## How to Run

I used **MySQL** for this project.

1. Open MySQL Workbench.
2. Open the SQL file.
3. Connect to your MySQL server.
4. Run the SQL script.
5. The database, tables, sample data, and queries will be created.

## What I Learned

This project helped me understand how different tables in a database can be connected and how SQL can be used to get useful information from that data.

I got practice with joins, aggregate functions, grouping, filtering, handling missing values, and using constraints while creating tables.

