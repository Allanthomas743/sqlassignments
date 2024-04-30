create database bankingsys;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    DOB DATE,
    email VARCHAR(100),
    phone_number VARCHAR(20),
    address VARCHAR(255)
);

CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(20),
    amount DECIMAL(10, 2),
    transaction_date DATE,
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);
-- task 2
INSERT INTO Transactions (transaction_id, account_id, transaction_type, amount, transaction_date) VALUES
(2011, 1011, 'Deposit', 1200.00, '2024-04-26'),
(2012, 1012, 'Withdrawal', 700.00, '2024-04-27'),
(2013, 1013, 'Deposit', 1600.00, '2024-04-25'),
(2014, 1014, 'Withdrawal', 900.00, '2024-04-26'),
(2015, 1015, 'Deposit', 700.00, '2024-04-24'),
(2016, 1016, 'Deposit', 1100.00, '2024-04-23'),
(2017, 1017, 'Withdrawal', 800.00, '2024-04-25'),
(2018, 1018, 'Deposit', 1700.00, '2024-04-22'),
(2019, 1019, 'Withdrawal', 500.00, '2024-04-26'),
(2020, 1020, 'Deposit', 600.00, '2024-04-21');

INSERT INTO Accounts (account_id, customer_id, account_type, balance) VALUES
(1011, 11, 'Savings', 6500.00),
(1012, 12, 'Current', 13500.00),
(1013, 13, 'Savings', 7800.00),
(1014, 14, 'Current', 11800.00),
(1015, 15, 'Savings', 6100.00),
(1016, 16, 'Current', 10200.00),
(1017, 17, 'Savings', 8700.00),
(1018, 18, 'Current', 14000.00),
(1019, 19, 'Savings', 5300.00),
(1020, 20, 'Current', 12200.00);

INSERT INTO Customers (customer_id, first_name, last_name, DOB, email, phone_number, address) VALUES
(11, 'Sneha', 'Chopra', '1993-08-25', 'sneha@email.com', '2345678901', '789 Vine Street, Delhi'),
(12, 'Amit', 'Sharma', '1995-11-12', 'amit@email.com', '3456789012', '456 Elm Street, Kolkata'),
(13, 'Pooja', 'Gupta', '1990-03-17', 'pooja@email.com', '4567890123', '101 Cedar Street, Mumbai'),
(14, 'Rajesh', 'Malhotra', '1987-06-30', 'rajesh@email.com', '5678901234', '456 Oak Avenue, Pune'),
(15, 'Neha', 'Srivastava', '1992-12-18', 'neha@email.com', '6789012345', '789 Pine Street, Kolkata'),
(16, 'Manoj', 'Singh', '1989-04-05', 'manoj@email.com', '7890123456', '101 Elm Street, Hyderabad'),
(17, 'Preeti', 'Kaur', '1994-10-20', 'preeti@email.com', '8901234567', '456 Pine Avenue, Delhi'),
(18, 'Rahul', 'Sharma', '1991-01-15', 'rahul@email.com', '9012345678', '789 Oak Street, Mumbai'),
(19, 'Simran', 'Kapoor', '1986-07-28', 'simran@email.com', '0123456789', '101 Cedar Avenue, Chennai'),
(20, 'Arun', 'Kumar', '1990-09-03', 'arun@email.com', '1234567890', '456 Maple Street, Bangalore');

SELECT c.first_name, c.last_name, a.account_type, c.email
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id;

SELECT t.*, a.account_type
FROM Transactions t
JOIN Accounts a ON t.account_id = a.account_id
WHERE a.customer_id = 1;

UPDATE Accounts
SET balance = balance + 500
WHERE account_id = 1001;

SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM Customers;

DELETE FROM Accounts
WHERE balance = 0 AND account_type = 'savings';

SELECT * FROM Customers WHERE LOWER(address) LIKE '%chennai%';

SELECT balance FROM Accounts WHERE account_id = 1002;

SELECT * FROM Accounts WHERE account_type = 'current' AND balance > 1000;

SELECT *
FROM Transactions
WHERE account_id = 1002;

SELECT account_id, balance * 3.5/ 100 AS interest_accrued
FROM Accounts
WHERE account_type = 'savings';

SELECT *
FROM Accounts
WHERE balance < 10000;

SELECT *
FROM Customers
WHERE lower(address) NOT LIKE '%chennai%';

--  task 3

SELECT AVG(balance) AS average_balance;

SELECT * FROM Accounts ORDER BY balance DESC LIMIT 10; 

SELECT SUM(amount) AS total_deposits FROM Transactions
WHERE transaction_type = 'deposit' AND transaction_date = '2024-04-24';

SELECT MIN(DOB) AS oldest_customer, MAX(DOB) AS newest_customer FROM Customers;

SELECT t.*, a.account_type FROM Transactions t 
JOIN Accounts a ON t.account_id = a.account_id;

SELECT c.*, a.* FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id;

SELECT t.*, c.* FROM Transactions t
JOIN Accounts a ON t.account_id = a.account_id
JOIN Customers c ON a.customer_id = c.customer_id
WHERE t.account_id = 1004;

SELECT customer_id, COUNT(*) AS num_accounts FROM Accounts
GROUP BY customer_id
HAVING COUNT(*) > 1;

SELECT SUM(
CASE WHEN transaction_type = 'deposit' THEN amount ELSE -amount END) AS difference
FROM Transactions;

SELECT t.account_id, AVG(a.balance) AS average_daily_balance
FROM Transactions t
JOIN Accounts a ON t.account_id = a.account_id
GROUP BY t.account_id;

SELECT account_type, SUM(balance) AS total_balance
FROM Accounts
GROUP BY account_type;

SELECT account_id, COUNT(*) AS num_transactions
FROM Transactions
GROUP BY account_id
ORDER BY num_transactions DESC;

SELECT c.*, SUM(a.balance) AS total_balance
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
GROUP BY c.customer_id
HAVING total_balance > 8000;

SELECT transaction_id, transaction_type, amount, transaction_date, account_id, COUNT(*)
FROM Transactions
GROUP BY transaction_id, transaction_type, amount, transaction_date, account_id
HAVING COUNT(*) > 1;

-- task 4

SELECT c.*
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
WHERE a.balance = (SELECT MAX(balance) FROM Accounts);

SELECT AVG(balance) AS avg_balance
FROM Accounts WHERE customer_id IN 
(SELECT customer_id FROM Accounts GROUP BY customer_id HAVING COUNT(*) > 1);

SELECT a.*
FROM Accounts a
JOIN Transactions t ON a.account_id = t.account_id
WHERE t.amount > (SELECT AVG(amount) FROM Transactions);

SELECT c.*
FROM Customers c
LEFT JOIN Accounts a ON c.customer_id = a.customer_id
LEFT JOIN Transactions t ON a.account_id = t.account_id
WHERE t.account_id IS NULL;

SELECT SUM(balance) AS total_balance
FROM Accounts
WHERE account_id NOT IN (SELECT account_id FROM Transactions);

SELECT t.*
FROM Transactions t
JOIN Accounts a ON t.account_id = a.account_id
WHERE a.balance = (SELECT MIN(balance) FROM Accounts);

SELECT customer_id
FROM Accounts
GROUP BY customer_id
HAVING COUNT(DISTINCT account_type) > 1;

SELECT account_type, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Accounts) AS percentage
FROM Accounts GROUP BY account_type;

SELECT * FROM Transactions
WHERE account_id IN (SELECT account_id FROM Accounts WHERE customer_id = 3);

SELECT account_type, (SELECT SUM(balance) FROM Accounts WHERE account_type = a.account_type) AS total_balance
FROM Accounts a GROUP BY account_type;
