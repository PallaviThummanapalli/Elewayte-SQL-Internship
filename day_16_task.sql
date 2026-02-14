CREATE DATABASE intern_training_db;
USE intern_training_db;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(100),
    created_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price INT
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES
(1, 'Pallavi', 'pallavi@gmail.com', '2023-01-10'),
(2, 'Ajay', 'ajay@gmail.com', '2023-02-15'),
(3, 'Priya', 'priya@gmail.com', '2023-03-20'),
(4, 'Ramu', 'ramu@gmail.com', '2023-04-05'),
(5, 'Sitaraa', 'sitaraa@gmail.com', '2023-05-01');

INSERT INTO products VALUES
(101, 'Laptop', 60000),
(102, 'Mobile', 30000),
(103, 'Headphones', 3000),
(104, 'Keyboard', 1500);

INSERT INTO orders VALUES
(1001, 1, 101, 1, '2024-01-05'),
(1002, 1, 103, 2, '2024-01-10'),
(1003, 2, 102, 1, '2024-02-12'),
(1004, 3, 104, 3, '2024-02-20'),
(1005, 3, 101, 1, '2024-03-05'),
(1006, 4, 103, 5, '2024-03-18'),
(1007, 2, 101, 1, '2024-03-25');

SELECT 
    p.product_name,
    SUM(o.quantity) AS total_units_sold
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_units_sold DESC;

SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    SUM(o.quantity * p.price) AS monthly_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY month;

SELECT c.customer_id, c.customer_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

SELECT 
    c.customer_id,
    c.customer_name,
    SUM(o.quantity * p.price) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name
HAVING total_spent > 50000
ORDER BY total_spent DESC;

SELECT 
    c.customer_name,
    COUNT(o.order_id) AS order_count,
    SUM(o.quantity * p.price) AS lifetime_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.customer_name;
