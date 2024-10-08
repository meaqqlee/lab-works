CREATE DATABASE lab4;

CREATE TABLE Warehouse (
    code INT PRIMARY KEY,
    location VARCHAR(255),
    capacity INT
);

CREATE TABLE Boxes (
    code CHAR(4) PRIMARY KEY,
    contents VARCHAR(255),
    value REAL,
    warehouse INT,
    FOREIGN KEY (warehouse)
    REFERENCES warehouse(code)
);

INSERT INTO Warehouse (code, location, capacity) VALUES
(1, 'Chicago', 3),
(2, 'Chicago', 4),
(3, 'New York', 7),
(4, 'Los Angeles', 2),
(5, 'San Francisco', 8);

INSERT INTO Boxes (code, contents, value, warehouse) VALUES
('OMN7', 'Rocks', 30, 1),
('4HBP', 'Rocks', 250, 1),
('4RT3', 'Scissors', 10, 3),
('73GH', 'Rocks', 200, 1),
('BNG', 'Papers', 50, 2),
('8VGJ', 'Papers', 250, 2),
('Y6F7', 'Papers', 175, 4),
('LL08', 'Rocks', 80, 4),
('POH6', 'Scissors', 125, 1),
('P2T6', 'Scissors', 75, 2),
('TU55', 'Papers', 90, 5);

SELECT * FROM Warehouse;

SELECT * FROM Boxes WHERE value > 150;

SELECT DISTINCT contents FROM Boxes;

SELECT Warehouse, COUNT(*) AS boxCount FROM Boxes GROUP BY  Warehouse ORDER BY Warehouse;

SELECT Warehouse, COUNT(*) AS boxCount FROM Boxes GROUP BY Warehouse HAVING COUNT(*) > 2;

INSERT INTO warehouse (code, location, capacity) VALUES
(6, 'New York', 3);
SELECT * FROM Warehouse;

INSERT INTO Boxes (code, contents, value, warehouse) VALUES
('H5RT', 'Papers', 200, 2);
/* SELECT * FROM Boxes; */

/*
SELECT code FROM Boxes ORDER BY value DESC LIMIT 1 OFFSET 2;
*/

UPDATE Boxes SET value = value * 0.75 WHERE code = (SELECT code FROM Boxes ORDER BY value DESC LIMIT 1 OFFSET 2);

DELETE FROM Boxes WHERE value < 150
RETURNING *;

DELETE FROM Boxes WHERE warehouse = (SELECT code FROM Warehouse WHERE location = 'New York')
RETURNING *;