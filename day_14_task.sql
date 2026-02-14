CREATE DATABASE intern_training_db;
USE intern_training_db;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

DELIMITER $$

CREATE PROCEDURE insert_employee (
    IN p_emp_id INT,
    IN p_name VARCHAR(50),
    IN p_department VARCHAR(50),
    IN p_salary INT
)
BEGIN
    IF p_salary <= 0 THEN
        SIGNAL SQLSTATE '45000';
    ELSE
        INSERT INTO employees VALUES (p_emp_id, p_name, p_department, p_salary);
    END IF;
END$$

DELIMITER ;

CALL insert_employee(501, 'Arjun', 'IT', 60000);
CALL insert_employee(502, 'Meena', 'HR', 45000);
CALL insert_employee(503, 'Kiran', 'Finance', 55000);

SELECT * FROM employees;

DELIMITER $$

CREATE FUNCTION calculate_bonus(emp_salary INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN emp_salary * 10 / 100;
END$$

DELIMITER ;

SELECT emp_id, name, salary, calculate_bonus(salary) AS bonus
FROM employees;
