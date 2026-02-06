CREATE DATABASE intern_training_db;
USE intern_training_db;

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    age INT CHECK (age BETWEEN 18 AND 60),
    salary INT CHECK (salary >= 10000),
    status VARCHAR(20) CHECK (status IN ('ACTIVE','INACTIVE')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (user_id, username, email, age, salary, status) VALUES
(1, 'pallavi', 'pallavi@gmail.com', 21, 30000, 'ACTIVE'),
(2, 'ajay', 'ajay@gmail.com', 25, 40000, 'ACTIVE'),
(3, 'priya', 'priya@gmail.com', 30, 50000, 'INACTIVE');

INSERT INTO users (user_id, username, email, age, salary, status)
VALUES (4, 'invalid_age', 'agefail@gmail.com', 15, 25000, 'ACTIVE');

INSERT INTO users (user_id, username, email, age, salary, status)
VALUES (5, 'invalid_salary', 'salaryfail@gmail.com', 28, 5000, 'ACTIVE');

INSERT INTO users (user_id, username, email, age, salary, status)
VALUES (6, 'invalid_status', 'statusfail@gmail.com', 26, 30000, 'PENDING');

INSERT INTO users (user_id, username, email, age, salary, status)
VALUES (7, 'pallavi', 'duplicate@gmail.com', 24, 35000, 'ACTIVE');

SELECT * FROM users;
