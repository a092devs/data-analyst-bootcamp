-- =========================
-- VIEW BASE TABLES
-- =========================

-- View all records from employee demographics table
SELECT *
FROM employee_demographics;

-- View all records from employee salary table
SELECT *
FROM employee_salary;


-- =========================
-- INNER JOIN
-- =========================

-- INNER JOIN returns only matching records from both tables
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal   -- JOIN = INNER JOIN by default
    ON dem.employee_id = sal.employee_id;

-- Selecting specific columns after INNER JOIN
SELECT dem.employee_id, age, occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
    ON dem.employee_id = sal.employee_id;


-- =========================
-- OUTER JOINS
-- =========================

-- LEFT JOIN returns all records from LEFT table + matching from RIGHT
-- Non-matching rows from RIGHT will be NULL
SELECT *
FROM employee_demographics AS dem
LEFT JOIN employee_salary AS sal   -- LEFT OUTER JOIN
    ON dem.employee_id = sal.employee_id;

-- RIGHT JOIN returns all records from RIGHT table + matching from LEFT
-- Non-matching rows from LEFT will be NULL
SELECT *
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal  -- RIGHT OUTER JOIN
    ON dem.employee_id = sal.employee_id;


-- =========================
-- SELF JOIN
-- =========================

-- SELF JOIN: joining table with itself
-- Here we match employee with next employee (id + 1)
SELECT *
FROM employee_salary emp1
JOIN employee_salary emp2
    ON emp1.employee_id + 1 = emp2.employee_id;

-- More readable version with aliases
SELECT 
    emp1.employee_id AS emp_id,
    emp1.first_name,
    emp1.last_name,
    emp2.employee_id AS emp_santa_id,
    emp2.first_name AS santa_first_name,
    emp2.last_name AS santa_last_name
FROM employee_salary emp1
JOIN employee_salary emp2
    ON emp1.employee_id + 1 = emp2.employee_id;


-- =========================
-- MULTIPLE TABLE JOIN
-- =========================

-- Joining 3 tables together
-- Combines demographics + salary + department info
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
    ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments AS pd
    ON sal.dept_id = pd.department_id;

-- View department table
SELECT *
FROM parks_departments;