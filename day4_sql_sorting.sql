CREATE DATABASE intern_training_db;
USE intern_training_db;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT,
    city VARCHAR(50),
    score INT
);

INSERT INTO students (student_id, name, email, age, city, score) VALUES
(1, 'Pallavi', 'pallavi@gmail.com', 21, 'Hyderabad', 85),
(2, 'Sitaraa Sharma', 'sitaraaa@gmail.com', 22, 'Bangalore', 92),
(3, 'Ajay Verma', 'ajay@gmail.com', 20, 'Delhi', 78),
(4, 'Priya', 'priya@gmail.com', 23, 'Chennai', 88),
(5, 'Ramu', 'ramu@gmail.com', 21, 'Hyderabad', 80),
(6, 'Test User', NULL, 24, 'Mumbai', 70);

SELECT * FROM students
ORDER BY age ASC;

SELECT * FROM students
ORDER BY age DESC;

SELECT * FROM students
ORDER BY city ASC, age DESC;

SELECT * FROM students
ORDER BY score DESC
LIMIT 3;

SELECT * FROM students
WHERE city = 'Hyderabad'
ORDER BY score DESC;

SELECT * FROM students
ORDER BY score DESC
LIMIT 2 OFFSET 0;

SELECT * FROM students
ORDER BY score DESC
LIMIT 2 OFFSET 2;

SELECT 
    student_id,
    name,
    score
FROM students
ORDER BY score DESC
LIMIT 5;
