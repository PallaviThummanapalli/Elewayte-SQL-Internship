CREATE DATABASE intern_training_db;
USE intern_training_db;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees VALUES
(1,'Aarav','aarav@corp.com','IT',70000),
(2,'Diya','diya@corp.com','HR',48000),
(3,'Kunal','kunal@corp.com','Finance',65000),
(4,'Meera','meera@corp.com','IT',82000),
(5,'Rohan','rohan@corp.com','Marketing',52000),
(6,'Ananya','ananya@corp.com','IT',60000),
(7,'Varun','varun@corp.com','Finance',58000),
(8,'Sneha','sneha@corp.com','HR',50000),
(9,'Rahul','rahul@corp.com','IT',90000),
(10,'Pooja','pooja@corp.com','Marketing',47000);

SELECT * FROM employees
WHERE department = 'IT';

EXPLAIN SELECT * FROM employees
WHERE department = 'IT';

CREATE INDEX idx_department
ON employees(department);

SELECT * FROM employees
WHERE department = 'IT';

EXPLAIN SELECT * FROM employees
WHERE department = 'IT';

CREATE INDEX idx_salary
ON employees(salary);

SELECT * FROM employees
WHERE salary > 60000;

EXPLAIN SELECT * FROM employees
WHERE salary > 60000;

DROP INDEX idx_salary ON employees;

EXPLAIN SELECT * FROM employees
WHERE salary > 60000;
