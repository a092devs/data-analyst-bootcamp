-- =========================
-- BASIC STRING FUNCTION
-- =========================

-- LENGTH(): returns number of characters in a string
SELECT LENGTH('skyfall');


-- =========================
-- VIEW TABLE
-- =========================

-- View all records
SELECT *
FROM employee_demographics;


-- =========================
-- LENGTH() WITH COLUMN
-- =========================

-- Get length of each first_name
SELECT first_name, LENGTH(first_name)
FROM employee_demographics;

-- Using alias and ordering by column position
SELECT first_name, LENGTH(first_name) AS len
FROM employee_demographics
ORDER BY 2;   -- refers to 2nd column (len)


-- =========================
-- CASE CONVERSION
-- =========================

-- Convert to uppercase
SELECT UPPER('sky');

-- Convert to lowercase
SELECT LOWER('SKY');

-- Apply UPPER() on column values
SELECT first_name, UPPER(first_name)
FROM employee_demographics;


-- =========================
-- TRIM FUNCTIONS
-- =========================

-- TRIM(): removes spaces from both sides
SELECT TRIM('            sky          ');

-- LTRIM(): removes spaces from left side
SELECT LTRIM('            sky          ');

-- RTRIM(): removes spaces from right side
SELECT RTRIM('            sky          ');


-- =========================
-- SUBSTRING & POSITION FUNCTIONS
-- =========================

-- Extract parts of strings
SELECT 
    first_name, 
    LEFT(first_name, 4),        -- first 4 characters
    RIGHT(first_name, 4),       -- last 4 characters
    SUBSTRING(first_name, 3, 2),-- from position 3, take 2 chars
    birth_date,
    SUBSTRING(birth_date, 6, 2) AS birth_month -- extract month
FROM employee_demographics;


-- =========================
-- REPLACE FUNCTION
-- =========================

-- Replace 'a' with 'z' in first_name
SELECT first_name, REPLACE(first_name, 'a', 'z')
FROM employee_demographics;


-- =========================
-- LOCATE FUNCTION
-- =========================

-- Find position of substring
SELECT LOCATE('s', 'Arsalan');  -- returns index of 's'

-- Find substring position in column
SELECT first_name, LOCATE('An', first_name)
FROM employee_demographics;


-- =========================
-- CONCAT FUNCTION
-- =========================

-- Combine first and last name into full name
SELECT 
    first_name, 
    last_name,
    CONCAT(first_name, ' ', last_name) AS full_name
FROM employee_demographics;