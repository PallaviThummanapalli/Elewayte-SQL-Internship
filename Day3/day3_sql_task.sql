CREATE DATABASE intern_training_db;
USE intern_training_db;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT,
    city VARCHAR(50)
);

INSERT INTO students (student_id, name, email, age, city) VALUES
(1, 'Pallavi', 'pallavi@gmail.com', 21, 'Hyderabad'),
(2, 'Sitaraa Sharma', 'sitaraaa@gmail.com', 22, 'Bangalore'),
(3, 'Ajay Verma', 'ajay@gmail.com', 20, 'Delhi'),
(4, 'Priya', 'priya@gmail.com', 23, 'Chennai'),
(5, 'Ramu', 'ramu@gmail.com', 21, 'Hyderabad'),
(6, 'Test User', NULL, 24, 'Mumbai');

SELECT * FROM students
WHERE age > 21;

SELECT * FROM students
WHERE age > 20 AND city = 'Hyderabad';

SELECT * FROM students
WHERE city = 'Delhi' OR city = 'Chennai';

SELECT * FROM students
WHERE name LIKE 'P%';

SELECT * FROM students
WHERE name LIKE '%ra%';

SELECT * FROM students
WHERE name LIKE '_a%';

SELECT * FROM students
WHERE city IN ('Hyderabad', 'Delhi');

SELECT * FROM students
WHERE age BETWEEN 21 AND 23;

SELECT * FROM students
WHERE email IS NULL;

SELECT name, age
FROM students
WHERE age > 20;

SELECT 
    s.student_id AS ID,
    s.name AS StudentName,
    s.email AS EmailID,
    s.city AS City
FROM students s
WHERE s.age >= 21;

SELECT * FROM students
WHERE email LIKE '%gmail.com%';
