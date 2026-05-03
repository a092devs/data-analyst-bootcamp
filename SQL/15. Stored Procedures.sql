-- =========================
-- STORED PROCEDURES
-- =========================

-- A stored procedure is a saved SQL block that can be executed later.
-- It helps reuse logic, improve performance, and reduce repetition.
-- You can also pass parameters to make it dynamic.


-- =========================
-- BASIC STORED PROCEDURE
-- =========================

-- View base table
SELECT *
FROM employee_salary;

-- Create a simple stored procedure
CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary
WHERE salary >= 50000; -- filter high salary employees

-- Execute the procedure
CALL large_salaries();


-- =========================
-- STORED PROCEDURE WITH MULTIPLE QUERIES
-- =========================

-- DELIMITER is used to temporarily change the statement end symbol
-- so we can use multiple SQL statements inside the procedure

DELIMITER $$

CREATE PROCEDURE large_salaries2()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000; -- first result set

	SELECT *
	FROM employee_salary
	WHERE salary >= 10000; -- second result set
END $$

DELIMITER ;

-- Execute procedure
CALL large_salaries2();


-- =========================
-- STORED PROCEDURE WITH PARAMETERS
-- =========================

-- This procedure accepts an input parameter (employee_id)
-- and returns data for that specific employee

DELIMITER $$

CREATE PROCEDURE large_salaries3(p_employee_id INT)
BEGIN
	SELECT 
		first_name, 
		last_name, 
		salary
	FROM employee_salary
	WHERE employee_id = p_employee_id; -- dynamic filtering
END $$

DELIMITER ;

-- Execute procedure with argument
CALL large_salaries3(1);