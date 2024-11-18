CREATE DATABASE lab8;

CREATE TABLE salesman (
    salesman_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    commission DECIMAL(5, 2)
);

INSERT INTO salesman (name, city, commission)
VALUES
    ('John Doe', 'New York', 0.15),
    ('Jane Smith', 'Los Angeles', 0.12),
    ('Robert Brown', 'Chicago', 0.10),
    ('Emily Davis', 'New York', 0.14),
    ('Michael Johnson', 'Houston', 0.13);

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    grade INT,
    salesman_id INT REFERENCES salesman(salesman_id)
);

INSERT INTO customers (name, city, grade, salesman_id)
VALUES
    ('Alice Green', 'New York', 200, 1),
    ('Bob White', 'Los Angeles', 150, 2),
    ('Charlie Black', 'Chicago', 180, 3),
    ('Diana Blue', 'Houston', 190, 5),
    ('Ethan Gray', 'New York', 200, 4),
    ('Fiona Yellow', 'Chicago', 170, 3);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE,
    customer_id INT REFERENCES customers(customer_id),
    amount DECIMAL(10, 2),
    salesman_id INT REFERENCES salesman(salesman_id)
);

INSERT INTO orders (order_date, customer_id, amount, salesman_id)
VALUES
    ('2024-11-01', 1, 5000.00, 1),
    ('2024-11-02', 2, 3000.00, 2),
    ('2024-11-03', 3, 7000.00, 3),
    ('2024-11-04', 4, 8000.00, 5),
    ('2024-11-05', 5, 6000.00, 4),
    ('2024-11-06', 6, 4000.00, 3);


--task 3
    CREATE ROLE junior_dev LOGIN PASSWORD 'password123';

--task 4
    CREATE VIEW salesman_new_york AS
    SELECT *
    FROM salesman
    WHERE city = 'New York';

--task 5
    CREATE VIEW order_details AS
    SELECT
        o.order_id,
        o.order_date,
        c.name AS customer_name,
        s.name AS salesman_name,
        o.amount
    FROM orders o
    JOIN customers c ON c.customer_id = o.customer_id
    JOIN salesman s ON s.salesman_id = o.salesman_id;

    GRANT ALL PRIVILEGES ON order_details TO junior_dev;

--task 6
    CREATE VIEW highest_grade_customers AS
    SELECT *
    FROM customers
    WHERE grade = (SELECT MAX(grade) FROM customers);

    GRANT SELECT ON highest_grade_customers TO junior_dev;

--task 7
    CREATE VIEW salesman_count_by_city AS
    SELECT city, COUNT(*) AS salesman_count
    FROM salesman
    GROUP BY city;

--task 8
    CREATE VIEW salesman_with_multiple_customers AS
    SELECT s.salesman_id, s.name, COUNT(c.customer_id) AS customer_count
    FROM salesman s
    JOIN customers c ON s.salesman_id = c.salesman_id
    GROUP BY s.salesman_id, s.name
    HAVING COUNT(c.customer_id) > 1;

--task 9
    CREATE ROLE intern;

    GRANT junior_def TO intern;

/*
DROP TABLE orders CASCADE;
DROP TABLE customers CASCADE;
DROP TABLE salesman CASCADE;
*/

--here I'm just revising the topic ( don't pay attention to that ):

/*
CREATE VIEW certain_date AS
SELECT *
FROM orders
WHERE order_date = '2024-01-12';

CREATE VIEW high_value_customers AS
SELECT c.name, o.amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.amount > 5000;

CREATE VIEW top_salesman AS
SELECT name, commission
FROM salesman
WHERE commission > (SELECT AVG(commission) FROM salesman);
*/