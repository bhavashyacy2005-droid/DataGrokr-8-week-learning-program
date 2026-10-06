# SQL Dimensional Report

This is my Week 5 SQL mini-project. In this project, I worked with a simple e-commerce sales database and used a **star schema** to organize the data.

The main goal of the project was to practice some of the more advanced SQL concepts such as window functions, CTEs, month-over-month analysis, ROLLUP, and query optimization.

## About the Project

The database contains a central sales table connected to different dimension tables.

The main tables are:

- `Fact_Sales` – stores the sales transactions
- `Dim_Customer` – stores customer information
- `Dim_Product` – stores product information
- `Dim_Store` – stores store details
- `Dim_Date` – stores date-related information

The `Fact_Sales` table is connected to the dimension tables using foreign keys, forming a simple star schema.

## What I Worked On

### Star Schema

I created a fact table and four dimension tables and connected them using primary and foreign keys.

This makes it easier to combine sales information with customer, product, store, and date details.

### Window Functions

I used window functions to rank products and customers based on their sales.

Some of the functions used are:

- `RANK()`
- `DENSE_RANK()`
- `LAG()`
- `LEAD()`
- `NTILE()`

I also used window functions to calculate running totals.

### CTE and Month-over-Month Report

I used Common Table Expressions (CTEs) to first calculate monthly sales and then compare the current month's sales with the previous month.

The report includes:

- Monthly sales
- Previous month's sales
- Difference between months
- Percentage growth

### ROLLUP

I used `ROLLUP` to calculate totals along with grouped results. This was useful for getting category totals and overall totals.

### Query Optimization

I used `EXPLAIN` to look at how MySQL executes queries.

I also created indexes on commonly used columns such as:

- `product_id`
- `customer_id`
- `date_id`
- `store_id`

This helped me understand the basic idea of improving query performance using indexes.

## Technologies Used

- MySQL
- SQL
- MySQL Workbench

```

The complete project is contained in a single SQL file. It includes the database creation, tables, sample data, queries, reports, and optimization examples.

## How to Run

Open the `dimensional_report.sql` file in **MySQL Workbench**.

Run the script from the beginning to:

1. Create the database
2. Create the tables
3. Insert the sample data
4. Run the SQL queries
5. Generate the reports
6. Check query execution using `EXPLAIN`

The project requires **MySQL 8.0 or above** because it uses CTEs and window functions.

## What I Learned

Through this project, I got practice with designing a simple star schema and using SQL for analysis rather than only basic data retrieval.

I also learned how window functions can be used for rankings and comparisons, how CTEs can make complex queries easier to manage, and how `EXPLAIN` and indexes can be used to understand query performance.
