CREATE DATABASE intern_training_db;
USE intern_training_db;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL,
    location VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    salary INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO departments (department_id, department_name, location) VALUES
(1, 'IT', 'Hyderabad'),
(2, 'HR', 'Bangalore'),
(3, 'Finance', 'Delhi'),
(4, 'Marketing', 'Chennai');

INSERT INTO employees (emp_id, name, email, salary, department_id) VALUES
(101, 'Arjun', 'arjun@company.com', 60000, 1),
(102, 'Meena', 'meena@company.com', 48000, 2),
(103, 'Kiran', 'kiran@company.com', 55000, 3),
(104, 'Neha', 'neha@company.com', 50000, NULL),
(105, 'Rohit', 'rohit@company.com', 70000, 1);

SELECT e.emp_id, e.name, d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;

SELECT e.emp_id, e.name, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;

SELECT e.emp_id, e.name, d.department_name
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id;

SELECT e.emp_id, e.name, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
UNION
SELECT e.emp_id, e.name, d.department_name
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id;
