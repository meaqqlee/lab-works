-- task 1
SELECT * FROM countries WHERE name = 'string';

CREATE INDEX idx_country_name ON countries(name);

-- task 2
SELECT * FROM employees WHERE name = 'string' AND surname = 'string';

CREATE INDEX idx_employee_name_surname ON employees(name, surname);

-- task 3
SELECTC * FROM employees WHERE salary < value1 AND salary > value2;

CREATE UNIQUE INDEX idx_employee_salary_range ON employees(salary);

-- task 4
SELECT * FROM employees WHERE substring(name from 1 for 4) = 'abcd';

CREATE INDEX idx_employee_name_substr ON employees((substring(name FROM 1 FOR 4)));

-- task 5
SELECT * FROM employees e
JOIN departments d ON d.department_id = e.department_id
WHERE d.budget > value2 AND e.salary < value2;

CREATE INDEX idx_employee_department_salary_budget ON employees(department_id, salary);
CREATE INDEX idx_department_budget ON department(budget);