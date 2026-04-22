-- =========================
-- SUBQUERIES (NESTED QUERIES)
-- =========================

-- Subquery inside WHERE clause
-- Get employees whose employee_id exists in salary table with dept_id = 1
SELECT *
FROM employee_demographics
WHERE employee_id IN
    (SELECT employee_id
     FROM employee_salary
     WHERE dept_id = 1);


-- =========================
-- SUBQUERY IN SELECT
-- =========================

-- Subquery returning a single value (scalar subquery)
-- Adds average salary as a constant column for each row
SELECT 
    first_name, 
    salary,
    (SELECT AVG(salary)
     FROM employee_salary) AS avg_salary
FROM employee_salary;


-- =========================
-- AGGREGATION WITH GROUP BY
-- =========================

-- Calculate aggregate stats grouped by gender
SELECT 
    gender, 
    AVG(age) AS avg_age, 
    MAX(age) AS max_age, 
    MIN(age) AS min_age, 
    COUNT(age) AS count_age
FROM employee_demographics
GROUP BY gender;


-- =========================
-- SUBQUERY IN FROM (DERIVED TABLE)
-- =========================

-- Using subquery as a temporary table (derived table)
-- Outer query calculates average of max ages from inner query
SELECT AVG(max_age) AS avg_max_age 
FROM
(
    SELECT 
        gender, 
        AVG(age) AS avg_age, 
        MAX(age) AS max_age, 
        MIN(age) AS min_age, 
        COUNT(age) AS count_age
    FROM employee_demographics
    GROUP BY gender
) AS agg_table;