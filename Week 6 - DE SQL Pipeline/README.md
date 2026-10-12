# Week 6 – Data Engineering SQL Pipeline

## Overview

This project demonstrates a simple data engineering pipeline using SQL and PostgreSQL. The main aim is to understand how raw sales data can be loaded, processed, and stored in a structured format for analysis.

The project uses sample sales data stored in a CSV file. The data is first loaded into a staging table, where it can be prepared for further processing. A `MERGE` statement is used to update existing customer details and insert new customers into the dimension table.

The sales data is then stored in a partitioned fact table. The table is divided into monthly partitions based on the sale date, making it easier to organize and query sales records over different periods.

## Concepts Covered

- **CSV Data Loading:** Uses the `COPY` command to load sales data into PostgreSQL.
- **MERGE on Dimension:** Updates existing customer records and inserts new customer records when they are not already present.
- **Table Partitioning:** Organizes sales records into monthly partitions based on their dates.
- **EXPLAIN:** Examines the query execution plan to understand how PostgreSQL processes a query.
- **EXPLAIN ANALYZE:** Runs a query and displays its actual execution details.
- **Indexes:** Uses indexes on customer and date columns to explore query performance.

## Technologies Used

- PostgreSQL
- SQL
- CSV

## How It Works

The pipeline begins by loading the CSV data into a staging table. The customer information is then merged into the dimension table, ensuring that existing records can be updated and new records can be added. After that, the sales records are transferred to the partitioned fact table by matching customer codes with customer IDs.

Finally, SQL queries are used to summarize sales, examine query execution plans, and explore the effect of indexes on query performance.

## Learning Outcome

Through this project, I learned how data moves through a basic data engineering pipeline, from CSV loading to structured storage and analysis. I also gained practical experience with dimension tables, fact tables, data merging, partitioning, and query performance analysis in PostgreSQL.
