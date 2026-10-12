
CREATE DATABASE de_pipeline_db;

\connect de_pipeline_db

DROP TABLE IF EXISTS Fact_Sales CASCADE;
DROP TABLE IF EXISTS Staging_Sales CASCADE;
DROP TABLE IF EXISTS Dim_Customer CASCADE;

CREATE TABLE Dim_Customer (
    customer_id INT PRIMARY KEY,
    customer_code VARCHAR(20) UNIQUE NOT NULL,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);

INSERT INTO Dim_Customer VALUES
(1, 'C101', 'Rahul', 'Bangalore'),
(2, 'C102', 'Priya', 'Chennai'),
(3, 'C103', 'Arjun', 'Mumbai');

CREATE TABLE Staging_Sales (
    sale_id INT,
    customer_code VARCHAR(20),
    customer_name VARCHAR(100),
    city VARCHAR(50),
    sale_date DATE,
    product_name VARCHAR(100),
    quantity INT,
    sales_amount NUMERIC(10,2)
);

COPY Staging_Sales
FROM '/absolute/path/to/sales_data.csv'
WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');

SELECT * FROM Staging_Sales;

MERGE INTO Dim_Customer AS target
USING (
    SELECT DISTINCT
        customer_code,
        customer_name,
        city
    FROM Staging_Sales
) AS source
ON target.customer_code = source.customer_code

WHEN MATCHED THEN
    UPDATE SET
        customer_name = source.customer_name,
        city = source.city

WHEN NOT MATCHED THEN
    INSERT (
        customer_id,
        customer_code,
        customer_name,
        city
    )
    VALUES (
        (SELECT COALESCE(MAX(customer_id), 0) + 1
         FROM Dim_Customer),
        source.customer_code,
        source.customer_name,
        source.city
    );

CREATE TABLE Fact_Sales (
    sale_id INT,
    customer_id INT,
    sale_date DATE NOT NULL,
    product_name VARCHAR(100),
    quantity INT,
    sales_amount NUMERIC(10,2),
    PRIMARY KEY (sale_id, sale_date),
    FOREIGN KEY (customer_id)
        REFERENCES Dim_Customer(customer_id)
) PARTITION BY RANGE (sale_date);

CREATE TABLE Fact_Sales_2026_Jan
PARTITION OF Fact_Sales
FOR VALUES FROM ('2026-01-01') TO ('2026-02-01');

CREATE TABLE Fact_Sales_2026_Feb
PARTITION OF Fact_Sales
FOR VALUES FROM ('2026-02-01') TO ('2026-03-01');

CREATE TABLE Fact_Sales_2026_Mar
PARTITION OF Fact_Sales
FOR VALUES FROM ('2026-03-01') TO ('2026-04-01');

CREATE TABLE Fact_Sales_Other
PARTITION OF Fact_Sales DEFAULT;

INSERT INTO Fact_Sales (
    sale_id,
    customer_id,
    sale_date,
    product_name,
    quantity,
    sales_amount
)
SELECT
    s.sale_id,
    d.customer_id,
    s.sale_date,
    s.product_name,
    s.quantity,
    s.sales_amount
FROM Staging_Sales s
JOIN Dim_Customer d
    ON s.customer_code = d.customer_code;

SELECT * FROM Dim_Customer;

SELECT * FROM Fact_Sales;

SELECT
    sale_date,
    SUM(sales_amount) AS total_sales
FROM Fact_Sales
GROUP BY sale_date
ORDER BY sale_date;

EXPLAIN
SELECT *
FROM Fact_Sales
WHERE sale_date >= '2026-01-01'
  AND sale_date < '2026-02-01';

CREATE INDEX idx_fact_sales_customer
ON Fact_Sales(customer_id);

CREATE INDEX idx_fact_sales_date
ON Fact_Sales(sale_date);

EXPLAIN ANALYZE
SELECT
    customer_id,
    SUM(sales_amount) AS total_sales
FROM Fact_Sales
WHERE sale_date >= '2026-01-01'
  AND sale_date < '2026-02-01'
GROUP BY customer_id;
