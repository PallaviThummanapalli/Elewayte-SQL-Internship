CREATE DATABASE intern_training_db;
USE intern_training_db;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees (emp_id, name, department, salary) VALUES
(301, 'Aarav', 'IT', 70000),
(302, 'Diya', 'HR', 48000),
(303, 'Kunal', 'Finance', 65000),
(304, 'Meera', 'IT', 82000),
(305, 'Rohan', 'Marketing', 52000),
(306, 'Anaya', 'Finance', 60000);

SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT department, avg_salary
FROM (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
) t;

SELECT emp_id, name, salary,
       (SELECT AVG(salary) FROM employees) AS company_avg_salary
FROM employees;

SELECT *
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);

SELECT e.emp_id, e.name, e.salary
FROM employees e
JOIN (
    SELECT AVG(salary) AS avg_sal
    FROM employees
) a
ON e.salary > a.avg_sal;

SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees WHERE salary IS NOT NULL);
