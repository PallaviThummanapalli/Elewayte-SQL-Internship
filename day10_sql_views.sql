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
(401, 'Arjun', 'arjun@company.com', 70000, 1),
(402, 'Meena', 'meena@company.com', 48000, 2),
(403, 'Kiran', 'kiran@company.com', 65000, 3),
(404, 'Neha', 'neha@company.com', 52000, 4),
(405, 'Rohit', 'rohit@company.com', 82000, 1);

CREATE VIEW employee_department_view AS
SELECT 
    e.emp_id,
    e.name,
    e.email,
    e.salary,
    d.department_name,
    d.location
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;

SELECT * FROM employee_department_view;

SELECT * FROM employee_department_view
WHERE salary > 60000;

SELECT * FROM employee_department_view
ORDER BY salary DESC;

INSERT INTO employee_department_view (emp_id, name, email, salary, department_name, location)
VALUES (406, 'TestUser', 'test@company.com', 50000, 'IT', 'Hyderabad');

DROP VIEW employee_department_view;

CREATE VIEW employee_department_view AS
SELECT 
    e.emp_id,
    e.name,
    e.email,
    e.salary,
    d.department_name,
    d.location
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;
