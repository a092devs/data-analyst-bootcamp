-- =========================
-- GROUP BY CLAUSE
-- =========================

-- View all data from employee_demographics table
SELECT *
FROM employee_demographics;


-- Get unique genders (GROUP BY groups rows with same values)
SELECT gender
FROM employee_demographics
GROUP BY gender;


-- Get average age for each gender
SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender;


-- Get multiple aggregate values per gender:
-- AVG  -> average age
-- MAX  -> oldest age
-- MIN  -> youngest age
-- COUNT -> number of records
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;


-- =========================
-- ORDER BY CLAUSE
-- =========================

-- Sort data by first_name in ascending order (default)
SELECT *
FROM employee_demographics
ORDER BY first_name ASC;


-- Sort data by first_name in descending order
SELECT *
FROM employee_demographics
ORDER BY first_name DESC;


-- Sort by gender first, then by age (descending)
SELECT *
FROM employee_demographics
ORDER BY gender, age DESC;


-- Sort using column positions (NOT recommended)
-- 4 -> 4th column
-- 5 -> 5th column
-- Problem: Hard to read & breaks if column order changes
SELECT *
FROM employee_demographics
ORDER BY 4, 5;