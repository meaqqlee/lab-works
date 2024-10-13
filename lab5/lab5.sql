CREATE DATABASE lab5;

CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DEC(3, 2)
);


INSERT INTO salesman (salesman_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', NULL, 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INTEGER,
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);

INSERT INTO customers (customer_id, customer_name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Davis', 'London', NULL, 5005),
(3004, 'Fabian John', 'Paris', 300, 5006),
(3007, 'Brad Guzab', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    purchase_amount DEC(10, 2),
    order_date DATE,
    customer_id INT,
    salesman_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);

INSERT INTO orders (order_id, purchase_amount, order_date, customer_id, salesman_id) VALUES
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001);

SELECT SUM(purchase_amount) AS total_purchase_amount FROM orders;

SELECT AVG(purchase_amount) AS avarage_purchase_amount FROM orders;

SELECT COUNT(*) FROM customers WHERE customer_name IS NOT NULL;

SELECT MIN(purchase_amount) FROM orders;
SELECT purchase_amount AS min_purchase FROM orders ORDER BY purchase_amount LIMIT 1;

SELECT COUNT(*) FROM customers WHERE customer_name LIKE '$b';

SELECT order_id FROM orders WHERE customer_id IN (SELECT customer_id FROM customers WHERE city = 'New York');

SELECT customer_id FROM orders WHERE purchase_amount > 10;

SELECT SUM(grade) AS total_grade FROM customers;

SELECT * FROM customers WHERE customer_name IS NOT NULL;

SELECT MAX(grade) FROM customers;
SELECT grade FROM customers ORDER BY grade DESC LIMIT 1;
--wh gr is nt nl