CREATE DATABASE intern_training_db;
USE intern_training_db;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    joining_date DATE
);

INSERT INTO employees VALUES
(1, 'Aarav', 'IT', 70000, '2021-06-12'),
(2, 'Diya', 'IT', 82000, '2020-03-18'),
(3, 'Kunal', 'IT', 60000, '2022-01-10'),
(4, 'Meena', 'HR', 48000, '2021-11-05'),
(5, 'Rohan', 'HR', 52000, '2019-07-22'),
(6, 'Ananya', 'Finance', 65000, '2020-09-14'),
(7, 'Varun', 'Finance', 58000, '2022-02-01'),
(8, 'Sneha', 'Finance', 72000, '2018-05-30');

SELECT 
    emp_id,
    name,
    department,
    salary,
    ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS row_num
FROM employees;

SELECT 
    emp_id,
    name,
    department,
    salary,
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank_num
FROM employees;

SELECT 
    emp_id,
    name,
    department,
    salary,
    DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dense_rank_num
FROM employees;

SELECT 
    emp_id,
    name,
    department,
    salary,
    SUM(salary) OVER (PARTITION BY department ORDER BY salary) AS running_total
FROM employees;

SELECT 
    emp_id,
    name,
    department,
    salary,
    LAG(salary) OVER (PARTITION BY department ORDER BY salary) AS prev_salary,
    LEAD(salary) OVER (PARTITION BY department ORDER BY salary) AS next_salary
FROM employees;

SELECT *
FROM (
    SELECT 
        emp_id,
        name,
        department,
        salary,
        ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS rn
    FROM employees
) t
WHERE rn = 1;
