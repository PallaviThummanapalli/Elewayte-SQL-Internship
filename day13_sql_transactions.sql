CREATE DATABASE intern_training_db;
USE intern_training_db;

CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    account_holder VARCHAR(50),
    balance INT
);

INSERT INTO accounts VALUES
(1, 'Pallavi', 50000),
(2, 'Ajay', 30000),
(3, 'Priya', 40000);

SELECT * FROM accounts;

START TRANSACTION;

UPDATE accounts
SET balance = balance - 10000
WHERE account_id = 1;

UPDATE accounts
SET balance = balance + 10000
WHERE account_id = 2;

COMMIT;

SELECT * FROM accounts;

START TRANSACTION;

UPDATE accounts
SET balance = balance - 20000
WHERE account_id = 2;

UPDATE accounts
SET balance = balance + 20000
WHERE account_id = 3;

ROLLBACK;

SELECT * FROM accounts;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

START TRANSACTION;

SELECT * FROM accounts
WHERE account_id = 1;

COMMIT;
