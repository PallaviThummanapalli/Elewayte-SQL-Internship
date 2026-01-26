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

SELECT COUNT(*) FROM students;

SELECT SUM(score) FROM students;

SELECT AVG(score) FROM students;

SELECT MIN(score) FROM students;

SELECT MAX(score) FROM students;

SELECT age, COUNT(*) 
FROM students
GROUP BY age;

SELECT city, COUNT(*) 
FROM students
GROUP BY city;

SELECT age, AVG(score)
FROM students
GROUP BY age;

SELECT age, COUNT(*) 
FROM students
GROUP BY age
HAVING COUNT(*) > 1;

SELECT city, AVG(score)
FROM students
GROUP BY city
HAVING AVG(score) > 80;

SELECT COUNT(email) FROM students;

SELECT AVG(score) FROM students WHERE score IS NOT NULL;
