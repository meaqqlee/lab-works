--task 1
CREATE OR REPLACE FUNCTION increase_value(input_value INTEGER)
RETURNS INTEGER AS $$
BEGIN
    RETURN input_value + 10;
END;
$$ LANGUAGE plpgsql;

--test
SELECT increase_value(5); --15
SELECT increase_value(-10); --0



--task 2
CREATE OR REPLACE FUNCTION compare_numbers(a INTEGER, b INTEGER)
RETURNS TEXT AS $$

BEGIN
    IF a > b THEN
        RETURN 'Greater';
    ELSIF a = b THEN
        RETURN 'Equal';
    ELSE
        RETURN 'Lesser';
    END IF;
END;
$$ LANGUAGE plpgsql;

--test
SELECT compare_numbers(10, 5); --Greater
SELECT compare_numbers(5, 5); --Equal
SELECT compare_numbers(3, 7); --Lesser



-- task3
CREATE OR REPLACE FUNCTION number_series(n INTEGER)
RETURNS TABLE(num INTEGER) AS $$
BEGIN
    RETURN QUERY
    SELECT generate_series(1, n);
END;
$$ LANGUAGE plpgsql;

/*
 DECLARE
    i INTEGER := 1;
 BEGIN
    WHILE i < n LOOP
        RETURN NEXT i;
        i := i + 1;
    END LOOP;
 */



--task4
CREATE OR REPLACE FUNCTION find_employee(emp_name VARCHAR)
RETURNS TABLE(id INTEGER, name VARCHAR, position VARCHAR, salary NUMERIC) AS $$
BEGIN
    RETURN QUERY
    SELECT id, name, position, salary
    FROM employees
    WHERE name = emp_name;
END;
$$ LANGUAGE plpgsql;



--task5
CREATE OR REPLACE FUNCTION list_products(category_name VARCHAR)
RETURNS TABLE(product_id INTEGER, product_name VARCHAR, price NUMERIC) AS $$
BEGIN
    RETURN QUERY
    SELECT product_id, product_name, price
    FROM products
    WHERE category = category_name;
END;
$$ LANGUAGE plpgsql;



--task6
CREATE OR REPLACE FUNCTION calculate_bonus(employee_id INTEGER)
RETURNS NUMERIC AS $$
DECLARE
    bonus NUMERIC;
BEGIN
    SELECT salary * 0.1 INTO bonus
    FROM employees
    WHERE id = employee_id;
    RETURN bonus;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_salary(employee_id INTEGER)
RETURNS VOID AS $$
DECLARE
    bonus NUMERIC;
BEGIN
    bonus := calculate_bonus(employee_id);
    UPDATE employees
    SET salary = salary + bonus
    WHERE id = employee_id;
END;
$$ LANGUAGE plpgsql;



--task7
CREATE OR REPLACE FUNCTION complex_calculation(num INTEGER, text_input VARCHAR)
RETURNS TEXT AS $$
DECLARE
    num_result INTEGER;
    text_result VARCHAR;
BEGIN
    --numeric computation
    BEGIN
        num_result := num * 2;
    END;

    --string manipulation
    BEGIN
        text_result := text_input || ' is processed';
    END;

    -- Combine results
    RETURN text_result || ' and the number is ' || num_result;
END;
$$ LANGUAGE plpgsql;