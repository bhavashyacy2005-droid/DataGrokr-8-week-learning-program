CREATE DATABASE dimensional_db;

USE dimensional_db;

CREATE TABLE Dim_Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50)
);

CREATE TABLE Dim_Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE Dim_Store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    city VARCHAR(50)
);

CREATE TABLE Dim_Date (
    date_id INT PRIMARY KEY,
    sale_date DATE NOT NULL,
    month INT,
    year INT
);

CREATE TABLE Fact_Sales (
    sale_id INT PRIMARY KEY,
    date_id INT,
    customer_id INT,
    product_id INT,
    store_id INT,
    quantity INT,
    sales_amount DECIMAL(10,2),
    discount DECIMAL(10,2),
    FOREIGN KEY (date_id) REFERENCES Dim_Date(date_id),
    FOREIGN KEY (customer_id) REFERENCES Dim_Customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES Dim_Product(product_id),
    FOREIGN KEY (store_id) REFERENCES Dim_Store(store_id)
);

INSERT INTO Dim_Customer VALUES
(1, 'Bhavashya', 'Bangalore'),
(2, 'Rahul', 'Chennai'),
(3, 'Priya', 'Mumbai'),
(4, 'Arjun', 'Delhi'),
(5, 'Sneha', 'Hyderabad'),
(6, 'Kiran', 'Bangalore'),
(7, 'Ananya', 'Pune'),
(8, 'Rohit', 'Chennai'),
(9, 'Neha', 'Mumbai'),
(10, 'Vivek', 'Delhi');

INSERT INTO Dim_Product VALUES
(101, 'Laptop', 'Electronics', 65000),
(102, 'Smartphone', 'Electronics', 30000),
(103, 'Headphones', 'Electronics', 2500),
(104, 'Keyboard', 'Accessories', 1500),
(105, 'Mouse', 'Accessories', 800),
(106, 'Monitor', 'Electronics', 15000),
(107, 'Backpack', 'Bags', 2000),
(108, 'Shoes', 'Fashion', 3500),
(109, 'T-Shirt', 'Fashion', 900),
(110, 'Watch', 'Fashion', 5000);

INSERT INTO Dim_Store VALUES
(1, 'Bangalore Store', 'Bangalore'),
(2, 'Chennai Store', 'Chennai'),
(3, 'Mumbai Store', 'Mumbai'),
(4, 'Delhi Store', 'Delhi');

INSERT INTO Dim_Date VALUES
(1, '2026-01-05', 1, 2026),
(2, '2026-01-12', 1, 2026),
(3, '2026-01-20', 1, 2026),
(4, '2026-02-03', 2, 2026),
(5, '2026-02-10', 2, 2026),
(6, '2026-02-18', 2, 2026),
(7, '2026-03-02', 3, 2026),
(8, '2026-03-11', 3, 2026),
(9, '2026-03-22', 3, 2026),
(10, '2026-04-05', 4, 2026),
(11, '2026-04-15', 4, 2026),
(12, '2026-04-25', 4, 2026);

INSERT INTO Fact_Sales VALUES
(1, 1, 1, 101, 1, 1, 65000, 2000),
(2, 2, 2, 102, 2, 1, 30000, 1000),
(3, 3, 3, 103, 3, 2, 5000, 200),
(4, 4, 4, 104, 4, 2, 3000, 100),
(5, 5, 5, 105, 2, 3, 2400, 100),
(6, 6, 6, 106, 1, 1, 15000, 500),
(7, 7, 7, 107, 3, 2, 4000, 200),
(8, 8, 8, 108, 2, 2, 7000, 300),
(9, 9, 9, 109, 3, 4, 3600, 100),
(10, 10, 10, 110, 4, 1, 5000, 200),
(11, 11, 1, 102, 1, 2, 60000, 2000),
(12, 12, 2, 101, 2, 1, 65000, 3000),
(13, 1, 3, 106, 3, 2, 30000, 1000),
(14, 2, 4, 108, 4, 3, 10500, 500),
(15, 3, 5, 109, 2, 5, 4500, 200),
(16, 4, 6, 103, 1, 3, 7500, 300),
(17, 5, 7, 104, 3, 4, 6000, 200),
(18, 6, 8, 105, 2, 5, 4000, 100),
(19, 7, 9, 101, 3, 1, 65000, 2500),
(20, 8, 10, 102, 4, 2, 60000, 1500),
(21, 9, 1, 103, 1, 4, 10000, 400),
(22, 10, 2, 106, 2, 2, 30000, 1000),
(23, 11, 3, 107, 3, 3, 6000, 300),
(24, 12, 4, 110, 4, 2, 10000, 500);

SELECT * FROM Dim_Customer;

SELECT * FROM Dim_Product;

SELECT * FROM Dim_Store;

SELECT * FROM Dim_Date;

SELECT * FROM Fact_Sales;

SELECT
    f.sale_id,
    d.sale_date,
    c.customer_name,
    p.product_name,
    p.category,
    s.store_name,
    f.quantity,
    f.sales_amount,
    f.discount
FROM Fact_Sales f
JOIN Dim_Customer c
ON f.customer_id = c.customer_id
JOIN Dim_Product p
ON f.product_id = p.product_id
JOIN Dim_Store s
ON f.store_id = s.store_id
JOIN Dim_Date d
ON f.date_id = d.date_id;

SELECT
    p.product_name,
    SUM(f.sales_amount) AS total_sales
FROM Fact_Sales f
JOIN Dim_Product p
ON f.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC;

SELECT
    p.category,
    SUM(f.sales_amount) AS total_sales
FROM Fact_Sales f
JOIN Dim_Product p
ON f.product_id = p.product_id
GROUP BY p.category
ORDER BY total_sales DESC;

SELECT
    c.customer_name,
    SUM(f.sales_amount) AS total_spending
FROM Fact_Sales f
JOIN Dim_Customer c
ON f.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_spending DESC;

SELECT
    s.store_name,
    SUM(f.sales_amount) AS total_sales
FROM Fact_Sales f
JOIN Dim_Store s
ON f.store_id = s.store_id
GROUP BY s.store_name
ORDER BY total_sales DESC;

SELECT
    d.month,
    d.year,
    SUM(f.sales_amount) AS monthly_sales
FROM Fact_Sales f
JOIN Dim_Date d
ON f.date_id = d.date_id
GROUP BY d.year, d.month
ORDER BY d.year, d.month;

SELECT
    p.product_name,
    SUM(f.quantity) AS total_quantity
FROM Fact_Sales f
JOIN Dim_Product p
ON f.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC;

SELECT
    p.product_name,
    SUM(f.sales_amount) AS total_sales,
    RANK() OVER (
        ORDER BY SUM(f.sales_amount) DESC
    ) AS sales_rank
FROM Fact_Sales f
JOIN Dim_Product p
ON f.product_id = p.product_id
GROUP BY p.product_name;

SELECT
    c.customer_name,
    SUM(f.sales_amount) AS total_spending,
    RANK() OVER (
        ORDER BY SUM(f.sales_amount) DESC
    ) AS customer_rank
FROM Fact_Sales f
JOIN Dim_Customer c
ON f.customer_id = c.customer_id
GROUP BY c.customer_name;

SELECT
    p.category,
    p.product_name,
    SUM(f.sales_amount) AS total_sales,
    RANK() OVER (
        PARTITION BY p.category
        ORDER BY SUM(f.sales_amount) DESC
    ) AS category_rank
FROM Fact_Sales f
JOIN Dim_Product p
ON f.product_id = p.product_id
GROUP BY p.category, p.product_name;

SELECT
    p.product_name,
    SUM(f.sales_amount) AS total_sales,
    DENSE_RANK() OVER (
        ORDER BY SUM(f.sales_amount) DESC
    ) AS sales_rank
FROM Fact_Sales f
JOIN Dim_Product p
ON f.product_id = p.product_id
GROUP BY p.product_name;

WITH monthly_sales AS (
    SELECT
        d.year,
        d.month,
        SUM(f.sales_amount) AS total_sales
    FROM Fact_Sales f
    JOIN Dim_Date d
    ON f.date_id = d.date_id
    GROUP BY d.year, d.month
)
SELECT
    year,
    month,
    total_sales
FROM monthly_sales
ORDER BY year, month;

WITH monthly_sales AS (
    SELECT
        d.year,
        d.month,
        SUM(f.sales_amount) AS total_sales
    FROM Fact_Sales f
    JOIN Dim_Date d
    ON f.date_id = d.date_id
    GROUP BY d.year, d.month
),
monthly_comparison AS (
    SELECT
        year,
        month,
        total_sales,
        LAG(total_sales) OVER (
            ORDER BY year, month
        ) AS previous_month_sales
    FROM monthly_sales
)
SELECT
    year,
    month,
    total_sales,
    previous_month_sales,
    total_sales - previous_month_sales AS sales_difference
FROM monthly_comparison
ORDER BY year, month;

WITH monthly_sales AS (
    SELECT
        d.year,
        d.month,
        SUM(f.sales_amount) AS total_sales
    FROM Fact_Sales f
    JOIN Dim_Date d
    ON f.date_id = d.date_id
    GROUP BY d.year, d.month
),
monthly_comparison AS (
    SELECT
        year,
        month,
        total_sales,
        LAG(total_sales) OVER (
            ORDER BY year, month
        ) AS previous_month_sales
    FROM monthly_sales
)
SELECT
    year,
    month,
    total_sales,
    previous_month_sales,
    ROUND(
        ((total_sales - previous_month_sales)
        / previous_month_sales) * 100,
        2
    ) AS growth_percentage
FROM monthly_comparison
ORDER BY year, month;

SELECT
    p.category,
    SUM(f.sales_amount) AS total_sales
FROM Fact_Sales f
JOIN Dim_Product p
ON f.product_id = p.product_id
GROUP BY ROLLUP(p.category);

SELECT
    s.store_name,
    p.category,
    SUM(f.sales_amount) AS total_sales
FROM Fact_Sales f
JOIN Dim_Store s
ON f.store_id = s.store_id
JOIN Dim_Product p
ON f.product_id = p.product_id
GROUP BY ROLLUP(s.store_name, p.category);

SELECT
    d.year,
    d.month,
    p.category,
    SUM(f.sales_amount) AS total_sales
FROM Fact_Sales f
JOIN Dim_Date d
ON f.date_id = d.date_id
JOIN Dim_Product p
ON f.product_id = p.product_id
GROUP BY ROLLUP(d.year, d.month, p.category);

SELECT
    c.city,
    SUM(f.sales_amount) AS total_sales
FROM Fact_Sales f
JOIN Dim_Customer c
ON f.customer_id = c.customer_id
GROUP BY c.city
ORDER BY total_sales DESC;

SELECT
    p.category,
    AVG(f.sales_amount) AS average_sale
FROM Fact_Sales f
JOIN Dim_Product p
ON f.product_id = p.product_id
GROUP BY p.category;

SELECT
    p.product_name,
    SUM(f.sales_amount) AS total_sales
FROM Fact_Sales f
JOIN Dim_Product p
ON f.product_id = p.product_id
GROUP BY p.product_name
HAVING SUM(f.sales_amount) > 20000
ORDER BY total_sales DESC;

SELECT
    c.customer_name,
    COUNT(f.sale_id) AS number_of_purchases
FROM Fact_Sales f
JOIN Dim_Customer c
ON f.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY number_of_purchases DESC;

SELECT
    s.store_name,
    COUNT(f.sale_id) AS number_of_sales
FROM Fact_Sales f
JOIN Dim_Store s
ON f.store_id = s.store_id
GROUP BY s.store_name
ORDER BY number_of_sales DESC;

SELECT
    d.month,
    SUM(f.sales_amount) AS monthly_sales,
    SUM(SUM(f.sales_amount)) OVER (
        ORDER BY d.month
    ) AS running_total
FROM Fact_Sales f
JOIN Dim_Date d
ON f.date_id = d.date_id
GROUP BY d.month
ORDER BY d.month;

SELECT
    p.category,
    p.product_name,
    SUM(f.sales_amount) AS total_sales,
    SUM(SUM(f.sales_amount)) OVER (
        PARTITION BY p.category
        ORDER BY SUM(f.sales_amount) DESC
    ) AS category_running_total
FROM Fact_Sales f
JOIN Dim_Product p
ON f.product_id = p.product_id
GROUP BY p.category, p.product_name;

SELECT
    c.customer_name,
    SUM(f.sales_amount) AS total_spending,
    NTILE(4) OVER (
        ORDER BY SUM(f.sales_amount) DESC
    ) AS customer_group
FROM Fact_Sales f
JOIN Dim_Customer c
ON f.customer_id = c.customer_id
GROUP BY c.customer_name;

SELECT
    d.month,
    SUM(f.sales_amount) AS monthly_sales,
    LAG(SUM(f.sales_amount)) OVER (
        ORDER BY d.month
    ) AS previous_month
FROM Fact_Sales f
JOIN Dim_Date d
ON f.date_id = d.date_id
GROUP BY d.month
ORDER BY d.month;

SELECT
    d.month,
    SUM(f.sales_amount) AS monthly_sales,
    LEAD(SUM(f.sales_amount)) OVER (
        ORDER BY d.month
    ) AS next_month_sales
FROM Fact_Sales f
JOIN Dim_Date d
ON f.date_id = d.date_id
GROUP BY d.month
ORDER BY d.month;

EXPLAIN
SELECT
    p.product_name,
    SUM(f.sales_amount) AS total_sales
FROM Fact_Sales f
JOIN Dim_Product p
ON f.product_id = p.product_id
GROUP BY p.product_name;

CREATE INDEX idx_fact_product
ON Fact_Sales(product_id);

CREATE INDEX idx_fact_customer
ON Fact_Sales(customer_id);

CREATE INDEX idx_fact_date
ON Fact_Sales(date_id);

CREATE INDEX idx_fact_store
ON Fact_Sales(store_id);

EXPLAIN
SELECT
    p.product_name,
    SUM(f.sales_amount) AS total_sales
FROM Fact_Sales f
JOIN Dim_Product p
ON f.product_id = p.product_id
GROUP BY p.product_name;

EXPLAIN
SELECT
    c.customer_name,
    SUM(f.sales_amount) AS total_spending
FROM Fact_Sales f
JOIN Dim_Customer c
ON f.customer_id = c.customer_id
GROUP BY c.customer_name;

SELECT
    p.product_name,
    SUM(f.sales_amount) AS total_sales,
    SUM(f.discount) AS total_discount,
    SUM(f.sales_amount - f.discount) AS net_sales
FROM Fact_Sales f
JOIN Dim_Product p
ON f.product_id = p.product_id
GROUP BY p.product_name
ORDER BY net_sales DESC;

SELECT
    p.category,
    SUM(f.quantity) AS total_quantity,
    SUM(f.sales_amount) AS total_sales,
    SUM(f.discount) AS total_discount
FROM Fact_Sales f
JOIN Dim_Product p
ON f.product_id = p.product_id
GROUP BY p.category
ORDER BY total_sales DESC;

SELECT
    s.store_name,
    p.category,
    SUM(f.sales_amount) AS total_sales
FROM Fact_Sales f
JOIN Dim_Store s
ON f.store_id = s.store_id
JOIN Dim_Product p
ON f.product_id = p.product_id
GROUP BY s.store_name, p.category
ORDER BY s.store_name, total_sales DESC;