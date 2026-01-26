CREATE DATABASE intern_training_db;
USE intern_training_db;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    department VARCHAR(50),
    salary INT,
    join_date DATE
);

INSERT INTO employees (emp_id, name, email, department, salary, join_date) VALUES
(201, 'Arjun Rao', 'arjun@company.com', 'IT', 62000, '2021-06-12'),
(202, 'Meena Patel', 'meena@company.com', 'HR', 48000, '2022-02-25'),
(203, 'Kiran Das', 'kiran@company.com', 'Finance', 56000, '2020-10-18'),
(204, 'Neha Singh', 'neha@company.com', 'Marketing', 51000, '2023-04-09'),
(205, 'Rohit Sharma', 'rohit@company.com', 'IT', 70000, '2019-08-30'),
(206, 'Dummy User', NULL, 'Support', 42000, '2024-01-05');

SELECT * FROM employees;

SELECT * FROM employees
WHERE department = 'IT';

SELECT * FROM employees
WHERE salary < 50000;

UPDATE employees
SET salary = 75000
WHERE emp_id = 205;

UPDATE employees
SET department = 'HR'
WHERE emp_id = 206;

SELECT * FROM employees;

DELETE FROM employees
WHERE emp_id = 206;

SELECT * FROM employees;

START TRANSACTION;

DELETE FROM employees
WHERE department = 'Marketing';

ROLLBACK;

SELECT * FROM employees;

START TRANSACTION;

DELETE FROM employees
WHERE department = 'Finance';

COMMIT;

SELECT * FROM employees;
