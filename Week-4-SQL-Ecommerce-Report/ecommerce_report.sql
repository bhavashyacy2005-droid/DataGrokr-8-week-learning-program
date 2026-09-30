-- WEEK 4 - SQL E-COMMERCE REPORT

-- 1. Create Database

CREATE DATABASE ecommerce_db;

USE ecommerce_db;


-- 2. CREATE TABLES

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(30),
    FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Items (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id)
        REFERENCES Orders(order_id),
    FOREIGN KEY (product_id)
        REFERENCES Products(product_id)
);


-- 3. INSERT CUSTOMER DATA

INSERT INTO Customers VALUES
(1, 'Bhavashya', 'bhavashya@gmail.com', 'Bangalore'),
(2, 'Rahul', 'rahul@gmail.com', 'Chennai'),
(3, 'Priya', 'priya@gmail.com', 'Mumbai'),
(4, 'Arjun', 'arjun@gmail.com', 'Delhi'),
(5, 'Sneha', 'sneha@gmail.com', NULL),
(6, 'Kiran', 'kiran@gmail.com', 'Hyderabad'),
(7, 'Ananya', 'ananya@gmail.com', 'Bangalore'),
(8, 'Rohit', 'rohit@gmail.com', NULL),
(9, 'Neha', 'neha@gmail.com', 'Pune'),
(10, 'Vivek', 'vivek@gmail.com', 'Chennai');


-- 4. INSERT PRODUCT DATA

INSERT INTO Products VALUES
(101, 'Laptop', 'Electronics', 65000),
(102, 'Smartphone', 'Electronics', 30000),
(103, 'Headphones', 'Electronics', 2500),
(104, 'Keyboard', 'Accessories', 1500),
(105, 'Mouse', 'Accessories', 800),
(106, 'Monitor', 'Electronics', 15000),
(107, 'Backpack', 'Bags', 2000),
(108, 'Shoes', 'Fashion', 3500),
(109, 'T-Shirt', 'Fashion', 900),
(110, 'Watch', 'Fashion', 5000),
(111, 'Tablet', 'Electronics', 22000),
(112, 'USB Cable', 'Accessories', 500);


-- 5. INSERT ORDER DATA

INSERT INTO Orders VALUES
(1001, 1, '2026-09-01', 'Delivered'),
(1002, 2, '2026-09-02', 'Delivered'),
(1003, 3, '2026-09-03', 'Shipped'),
(1004, 1, '2026-09-04', 'Delivered'),
(1005, 4, '2026-09-05', 'Cancelled'),
(1006, 5, '2026-09-06', 'Delivered'),
(1007, 6, '2026-09-07', 'Shipped'),
(1008, 7, '2026-09-08', 'Delivered'),
(1009, 8, '2026-09-09', 'Delivered'),
(1010, 9, '2026-09-10', 'Shipped'),
(1011, 10, '2026-09-11', 'Delivered'),
(1012, 2, '2026-09-12', 'Delivered');


-- 6. INSERT ORDER ITEM DATA

INSERT INTO Order_Items VALUES
(1, 1001, 101, 1),
(2, 1001, 103, 2),
(3, 1002, 102, 1),
(4, 1002, 105, 2),
(5, 1003, 106, 1),
(6, 1003, 104, 1),
(7, 1004, 111, 1),
(8, 1004, 112, 3),
(9, 1005, 108, 1),
(10, 1006, 107, 2),
(11, 1006, 109, 3),
(12, 1007, 110, 1),
(13, 1007, 103, 1),
(14, 1008, 101, 1),
(15, 1008, 105, 1),
(16, 1009, 108, 2),
(17, 1010, 102, 1),
(18, 1010, 104, 2),
(19, 1011, 106, 2),
(20, 1011, 112, 2),
(21, 1012, 102, 1),
(22, 1012, 103, 1);


-- 7. BASIC QUERIES

-- Query 1: Display all customers
SELECT * FROM Customers;

-- Query 2: Display all products
SELECT * FROM Products;

-- Query 3: Display products costing more than 5000
SELECT *
FROM Products
WHERE price > 5000;

-- Query 4: Display Electronics products
SELECT *
FROM Products
WHERE category = 'Electronics';

-- Query 5: Sort products by price
SELECT *
FROM Products
ORDER BY price ASC;

-- Query 6: Find the cheapest product
SELECT *
FROM Products
ORDER BY price ASC
LIMIT 1;

-- Query 7: Find the most expensive product
SELECT *
FROM Products
ORDER BY price DESC
LIMIT 1;

-- Query 8: Count total customers
SELECT COUNT(*) AS total_customers
FROM Customers;


-- 8. AGGREGATE QUERIES

-- Query 9: Average product price
SELECT AVG(price) AS average_price
FROM Products;

-- Query 10: Count total products
SELECT COUNT(*) AS total_products
FROM Products;

-- Query 11: Count products by category
SELECT category, COUNT(*) AS product_count
FROM Products
GROUP BY category;

-- Query 12: Average price by category
SELECT category, AVG(price) AS average_price
FROM Products
GROUP BY category;

-- Query 13: Count total orders
SELECT COUNT(*) AS total_orders
FROM Orders;

-- Query 14: Total quantity sold
SELECT SUM(quantity) AS total_quantity
FROM Order_Items;

-- Query 15: Total sales
SELECT SUM(Products.price * Order_Items.quantity) AS total_sales
FROM Order_Items
JOIN Products
ON Order_Items.product_id = Products.product_id;


-- 9. JOIN QUERIES

-- Query 16: Display customers and their orders
SELECT Customers.name, Orders.order_id, Orders.order_date
FROM Customers
JOIN Orders
ON Customers.customer_id = Orders.customer_id;

-- Query 17: Display customer names and order status
SELECT Customers.name, Orders.order_id, Orders.status
FROM Customers
JOIN Orders
ON Customers.customer_id = Orders.customer_id;

-- Query 18: Display orders with product names
SELECT Orders.order_id, Products.product_name
FROM Orders
JOIN Order_Items
ON Orders.order_id = Order_Items.order_id
JOIN Products
ON Order_Items.product_id = Products.product_id;

-- Query 19: Display complete order details
SELECT
    Orders.order_id,
    Customers.name,
    Products.product_name,
    Order_Items.quantity,
    Products.price
FROM Orders
JOIN Customers
ON Orders.customer_id = Customers.customer_id
JOIN Order_Items
ON Orders.order_id = Order_Items.order_id
JOIN Products
ON Order_Items.product_id = Products.product_id;

-- Query 20: Calculate customer spending
SELECT
    Customers.name,
    SUM(Products.price * Order_Items.quantity) AS total_spending
FROM Customers
JOIN Orders
ON Customers.customer_id = Orders.customer_id
JOIN Order_Items
ON Orders.order_id = Order_Items.order_id
JOIN Products
ON Order_Items.product_id = Products.product_id
GROUP BY Customers.name;

-- Query 21: Display products that have been sold
SELECT DISTINCT Products.product_name
FROM Products
JOIN Order_Items
ON Products.product_id = Order_Items.product_id;

-- Query 22: Products that have never been ordered
SELECT Products.product_name
FROM Products
LEFT JOIN Order_Items
ON Products.product_id = Order_Items.product_id
WHERE Order_Items.product_id IS NULL;

-- Query 23: Customers who never placed an order
SELECT Customers.name
FROM Customers
LEFT JOIN Orders
ON Customers.customer_id = Orders.customer_id
WHERE Orders.order_id IS NULL;

-- Query 24: Display orders with customer and product
SELECT
    Orders.order_id,
    Customers.name,
    Products.product_name,
    Order_Items.quantity
FROM Orders
JOIN Customers
ON Orders.customer_id = Customers.customer_id
JOIN Order_Items
ON Orders.order_id = Order_Items.order_id
JOIN Products
ON Order_Items.product_id = Products.product_id;


-- 10. TOP PRODUCTS AND CUSTOMERS

-- Query 25: Top-selling products by quantity
SELECT
    Products.product_name,
    SUM(Order_Items.quantity) AS total_sold
FROM Products
JOIN Order_Items
ON Products.product_id = Order_Items.product_id
GROUP BY Products.product_name
ORDER BY total_sold DESC;

-- Query 26: Top 5 products by quantity
SELECT
    Products.product_name,
    SUM(Order_Items.quantity) AS total_sold
FROM Products
JOIN Order_Items
ON Products.product_id = Order_Items.product_id
GROUP BY Products.product_name
ORDER BY total_sold DESC
LIMIT 5;

-- Query 27: Top customers by spending
SELECT
    Customers.name,
    SUM(Products.price * Order_Items.quantity) AS spending
FROM Customers
JOIN Orders
ON Customers.customer_id = Orders.customer_id
JOIN Order_Items
ON Orders.order_id = Order_Items.order_id
JOIN Products
ON Order_Items.product_id = Products.product_id
GROUP BY Customers.name
ORDER BY spending DESC;

-- Query 28: Customers spending more than 10000
SELECT
    Customers.name,
    SUM(Products.price * Order_Items.quantity) AS spending
FROM Customers
JOIN Orders
ON Customers.customer_id = Orders.customer_id
JOIN Order_Items
ON Orders.order_id = Order_Items.order_id
JOIN Products
ON Order_Items.product_id = Products.product_id
GROUP BY Customers.name
HAVING spending > 10000;

-- Query 29: Best-selling category
SELECT
    Products.category,
    SUM(Order_Items.quantity) AS quantity_sold
FROM Products
JOIN Order_Items
ON Products.product_id = Order_Items.product_id
GROUP BY Products.category
ORDER BY quantity_sold DESC;

-- Query 30: Highest-value order
SELECT
    Orders.order_id,
    SUM(Products.price * Order_Items.quantity) AS order_value
FROM Orders
JOIN Order_Items
ON Orders.order_id = Order_Items.order_id
JOIN Products
ON Order_Items.product_id = Products.product_id
GROUP BY Orders.order_id
ORDER BY order_value DESC
LIMIT 1;


-- 11. NULL HANDLING

-- Query 31: Find customers with NULL city
SELECT *
FROM Customers
WHERE city IS NULL;

-- Query 32: Replace NULL city with Unknown
SELECT
    name,
    COALESCE(city, 'Unknown') AS city
FROM Customers;

-- Query 33: Find customers with missing email
SELECT *
FROM Customers
WHERE email IS NULL;


-- 12. MORE USEFUL QUERIES

-- Query 34: Delivered orders
SELECT *
FROM Orders
WHERE status = 'Delivered';

-- Query 35: Cancelled orders
SELECT *
FROM Orders
WHERE status = 'Cancelled';

-- Query 36: Number of orders by status
SELECT
    status,
    COUNT(*) AS order_count
FROM Orders
GROUP BY status;

-- Query 37: Products priced between 1000 and 10000
SELECT *
FROM Products
WHERE price BETWEEN 1000 AND 10000;

-- Query 38: Customers from Bangalore
SELECT *
FROM Customers
WHERE city = 'Bangalore';


-- 13. DDL EXAMPLES

-- Query 39: Add a new column
ALTER TABLE Customers
ADD phone VARCHAR(15);

-- Query 40: Create a new table
CREATE TABLE Reviews (
    review_id INT PRIMARY KEY,
    product_id INT,
    rating INT,
    FOREIGN KEY (product_id)
        REFERENCES Products(product_id)
);

-- Query 41: Add a constraint
ALTER TABLE Reviews
ADD CONSTRAINT check_rating
CHECK (rating BETWEEN 1 AND 5);

-- Query 42: Display table structure
DESCRIBE Customers;