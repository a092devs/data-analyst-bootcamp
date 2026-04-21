-- =========================
-- SELECT STATEMENTS
-- =========================

-- Select all columns and all rows from employee_demographics table
SELECT * 
FROM parks_and_recreation.employee_demographics;


-- Select specific columns and create a derived column
-- age_in_10_years = current age + 10
SELECT 
    first_name, 
    last_name, 
    birth_date,
    age,
    age + 10 AS age_in_10_years   -- derived column using AS
FROM parks_and_recreation.employee_demographics;


-- =========================
-- ORDER OF OPERATIONS
-- =========================

-- SQL follows standard arithmetic rules (PEMDAS):
-- P -> Parentheses
-- E -> Exponents
-- M -> Multiplication
-- D -> Division
-- A -> Addition
-- S -> Subtraction
-- Example: age + 10 is evaluated using standard precedence


-- =========================
-- DISTINCT CLAUSE
-- =========================

-- Get unique values of gender (removes duplicates)
SELECT DISTINCT 
    gender
FROM parks_and_recreation.employee_demographics;