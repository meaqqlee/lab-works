CREATE DATABASE lab2;

CREATE TABLE "countries" (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(100),
    region_id INT,
    population INT
);

INSERT INTO countries (country_name, region_id, population)
VALUES ('Kazakhstan', 1, 19000000);

INSERT INTO countries (country_id, country_name)
VALUES (2, 'Russia');

INSERT INTO countries (country_name, region_id, population)
VALUES ('Uzbekistan', NULL, 33000000);

INSERT INTO countries (country_name, region_id, population)
VALUES
('China', 3, 1400000000),
('USA', 4, 331000000),
('India', 5, 1380000000);

ALTER TABLE countries
ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

INSERT INTO countries (region_id, population)
VALUES (6, 500000);

INSERT INTO countries DEFAULT VALUES;

CREATE TABLE countries_new (LIKE countries INCLUDING ALL);

INSERT INTO countries_new
SELECT * FROM countries;

UPDATE countries
SET region_id = 1

WHERE region_id IS NULL;

SELECT country_name, population * 1.1 AS "New Population"
FROM countries;

DELETE FROM countries
WHERE population < 100000;

DELETE FROM countries_new
WHERE country_id IN (SELECT country_id FROM countries)
RETURNING *;

DELETE FROM countries
RETURNING *;

SELECT * FROM countries_new;

DROP TABLE "user";