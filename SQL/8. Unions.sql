-- =========================
-- VIEW BASE TABLE
-- =========================

-- View all records from employee demographics table
SELECT *
FROM employee_demographics;


-- =========================
-- UNION (DISTINCT)
-- =========================

-- UNION combines results from two queries
-- Removes duplicate rows by default (UNION DISTINCT)
SELECT first_name, last_name
FROM employee_demographics
UNION
SELECT first_name, last_name
FROM employee_salary;


-- =========================
-- UNION ALL
-- =========================

-- UNION ALL combines results but keeps duplicates
-- Faster than UNION because no duplicate filtering
SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary;


-- =========================
-- UNION WITH CONDITIONS + LABELING
-- =========================

-- Combining multiple queries with custom labels
-- Each SELECT must have same number of columns and compatible data types
SELECT first_name, last_name, 'Old Man' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'

UNION

SELECT first_name, last_name, 'Old Lady' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'

UNION

SELECT first_name, last_name, 'Highly Paid' AS Label
FROM employee_salary
WHERE salary > 70000

-- ORDER BY applies to the final combined result
ORDER BY first_name, last_name;