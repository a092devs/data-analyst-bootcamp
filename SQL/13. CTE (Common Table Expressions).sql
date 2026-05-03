-- =========================
-- CTEs (COMMON TABLE EXPRESSIONS)
-- =========================

-- CTE (WITH clause) creates a temporary named result set
-- that you can reuse in the main query.
-- It improves readability and replaces subqueries.


-- =========================
-- BASIC CTE USAGE
-- =========================

-- Create a CTE with aggregated salary data by gender
WITH CTE_Example AS
(
    SELECT 
        gender, 
        AVG(salary) AS avg_sal, 
        MAX(salary) AS max_sal, 
        MIN(salary) AS min_sal, 
        COUNT(salary) AS count_sal
    FROM employee_demographics dem
    JOIN employee_salary sal
        ON dem.employee_id = sal.employee_id
    GROUP BY gender
)
-- Use the CTE like a table
SELECT AVG(avg_sal) -- average of average salaries
FROM CTE_Example;


-- =========================
-- CTE WITH COLUMN ALIASES
-- =========================

-- Explicitly defining column names for the CTE
WITH CTE_Example (Gender, AVG_sal, MAX_sal, MIN_sal, COUNT_sal) AS
(
    SELECT 
        gender, 
        AVG(salary), 
        MAX(salary), 
        MIN(salary), 
        COUNT(salary)
    FROM employee_demographics dem
    JOIN employee_salary sal
        ON dem.employee_id = sal.employee_id
    GROUP BY gender
)
SELECT *
FROM CTE_Example;


-- =========================
-- CTE VS SUBQUERY (COMMENTED)
-- =========================

-- Same logic using subquery instead of CTE
-- Less readable compared to CTE

-- SELECT AVG(avg_sal)
-- FROM (
--     SELECT 
--         gender, 
--         AVG(salary) AS avg_sal, 
--         MAX(salary) AS max_sal, 
--         MIN(salary) AS min_sal, 
--         COUNT(salary) AS count_sal
--     FROM employee_demographics dem
--     JOIN employee_salary sal
--         ON dem.employee_id = sal.employee_id
--     GROUP BY gender
-- ) example_subquery;


-- =========================
-- MULTIPLE CTEs
-- =========================

-- First CTE: filter employees by birth date
-- Second CTE: filter employees by salary
-- Then join both filtered datasets

WITH CTE_Example AS
(
    SELECT 
        employee_id, 
        gender, 
        birth_date
    FROM employee_demographics 
    WHERE birth_date > '1985-01-01' -- filter younger employees
),
CTE_Example2 AS
(
    SELECT 
        employee_id, 
        salary
    FROM employee_salary
    WHERE salary > 50000 -- filter high salary employees
)
SELECT *
FROM CTE_Example
JOIN CTE_Example2
    ON CTE_Example.employee_id = CTE_Example2.employee_id; -- combine both conditions