CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    price DECIMAL(10, 2),
    quantity INT
);

DROP TABLE Customers CASCADE;
DROP TABLE Orders CASCADE;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    book_id INT,
    customer_id INT,
    order_date DATE,
    quantity INT,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Вставка начальных данных
INSERT INTO Books (book_id, title, author, price, quantity) VALUES
(1, 'Database 101', 'A. Smith', 40.00, 10),
(2, 'Learn SQL', 'B. Johnson', 35.00, 15),
(3, 'Advanced DB', 'C. Lee', 50.00, 5);

INSERT INTO Customers (customer_id, name, email) VALUES
(101, 'John Doe', 'johndoe@example.com'),
(102, 'Jane Doe', 'janedoe@example.com');

START TRANSACTION;

INSERT INTO Orders (order_id, book_id, customer_id, order_date, quantity)
VALUES (1, 1, 101, CURRENT_DATE, 2);

UPDATE Books
SET quantity = quantity - 2
WHERE book_id = 1;

SELECT quantity FROM Books WHERE book_id = 1;

COMMIT;

SELECT quantity FROM Books WHERE book_id = 1;

-- TASK 2
BEGIN;

SELECT quantity
FROM Books
WHERE book_id = 3;

INSERT INTO Orders (order_id, book_id, customer_id, order_date, quantity)
VALUES (2, 3, 102, CURRENT_DATE, 10);

UPDATE Books
SET quantity = quantity - 10
WHERE book_id = 3;

ROLLBACK;

COMMIT;

-- TASK 3
-- session 1
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;

UPDATE Books
SET price = 45.00
WHERE book_id = 1;

COMMIT;

-- session 2
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;

-- before
SELECT price FROM Books WHERE book_id = 1;

-- after
SELECT price FROM Books WHERE book_id = 1;

COMMIT;

-- TASK 4
START TRANSACTION;

UPDATE Customers
SET email = 'newemail@example.com'
WHERE customer_id = 101;

COMMIT;

-- restarting

SELECT * FROM Customers WHERE customer_id = 101;
