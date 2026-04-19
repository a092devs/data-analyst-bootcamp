-- =========================
-- WHERE CLAUSE (Filtering rows)
-- =========================

-- Get all columns where first_name is exactly 'Leslie'
SELECT *
FROM employee_salary
WHERE first_name = 'Leslie';


-- Get employees with salary greater than or equal to 50,000
SELECT *
FROM employee_salary
WHERE salary >= 50000;


-- Get all employees who are NOT Female
-- != means "not equal to"
SELECT *
FROM employee_demographics
WHERE gender != 'Female';


-- Get employees born after January 1, 1985
-- Date format: 'YYYY-MM-DD'
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01';


-- =========================
-- LOGICAL OPERATORS (AND, OR, NOT)
-- =========================

-- Get employees born after 1985 AND gender is male
-- Both conditions must be true
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
AND gender = 'male';


-- Get employees who:
-- 1. were born after 1985 OR
-- 2. are NOT male
-- OR means at least one condition must be true
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR NOT gender = 'male';


-- Use parentheses to control logic (important!)
-- Get employees where:
-- (name is Leslie AND age is 44) OR age > 55
SELECT *
FROM employee_demographics
WHERE (first_name = 'Leslie' AND age = 44)
OR age > 55;


-- =========================
-- LIKE (Pattern matching)
-- % = any number of characters
-- _ = exactly one character
-- =========================

-- Names starting with 'a'
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a%';


-- Names containing 'n' anywhere
SELECT *
FROM employee_demographics
WHERE first_name LIKE '%n%';


-- Names starting with 'a' and exactly 3 letters total
-- (a + 2 underscores = 3 characters)
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a__';


-- Names starting with 'a' and at least 4 characters
-- (a + 3 fixed chars + anything after)
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a___%';