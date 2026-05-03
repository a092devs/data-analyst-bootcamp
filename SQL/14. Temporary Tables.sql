-- =========================
-- TEMPORARY TABLES
-- =========================

-- Temporary tables are session-specific tables
-- They exist only during the current session and are automatically dropped after it ends.
-- Useful for storing intermediate results and simplifying complex queries.


-- =========================
-- CREATE TEMP TABLE (MANUAL STRUCTURE)
-- =========================

-- Creating an empty temporary table with defined columns
CREATE TEMPORARY TABLE temp_table
(
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    favourite_movie VARCHAR(100)
);

-- View contents (currently empty)
SELECT *
FROM temp_table;

-- Insert a row into temp table
INSERT INTO temp_table
VALUES (
    'Arsalan', 
    'Akhtar', 
    'Sookshmadarshini'
);

-- Verify inserted data
SELECT *
FROM temp_table;


-- =========================
-- CREATE TEMP TABLE FROM QUERY
-- =========================

-- Create a temp table directly from a SELECT query
-- Structure + data both are copied from source table
CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary >= 50000; -- filter high salary employees

-- View filtered results
SELECT * 
FROM salary_over_50k;