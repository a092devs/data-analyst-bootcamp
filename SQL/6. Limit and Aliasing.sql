-- =========================
-- LIMIT CLAUSE
-- =========================

-- Get only first 3 rows from the table
SELECT *
FROM employee_demographics
LIMIT 3;


-- Get rows with offset
-- LIMIT 2, 1 means:
-- Skip first 2 rows, then return 1 row
-- Commonly used for pagination
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 2, 1;


-- =========================
-- ALIASING
-- =========================

-- Rename column using AS (alias)
-- Makes output more readable
-- Note: AS keyword is optional
SELECT 
    gender, 
    AVG(age) AS avg_age   -- alias for computed column
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40;     -- using alias in HAVING