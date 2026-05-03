-- =========================
-- TRIGGERS
-- =========================

-- A trigger is automatically executed when a specific event occurs
-- (INSERT, UPDATE, DELETE) on a table.
-- It helps enforce rules or keep tables in sync.

-- View base tables
SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary; 


-- =========================
-- CREATE TRIGGER (AFTER INSERT)
-- =========================

-- This trigger runs AFTER a new row is inserted into employee_salary
-- FOR EACH ROW means it runs once per inserted row
-- NEW refers to the newly inserted row values

DELIMITER $$

CREATE TRIGGER employee_insert
AFTER INSERT ON employee_salary
FOR EACH ROW
BEGIN
	INSERT INTO employee_demographics(employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name); -- copy data from inserted row
END $$

DELIMITER ;


-- Test trigger (this insert will automatically fire the trigger)
INSERT INTO employee_salary(employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES (13, 'John', 'Doe', 'Fox News CEO', 1000000, NULL);


-- =========================
-- EVENTS
-- =========================

-- Events are scheduled tasks that run automatically at a defined time or interval
-- (similar to a cron job inside the database)

SELECT * 
FROM employee_demographics;

SHOW EVENTS; -- list existing events


-- =========================
-- CREATE EVENT
-- =========================

-- This event runs every 30 seconds
-- Deletes employees aged 60 or above

DROP EVENT IF EXISTS delete_retirees;

DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE
	FROM employee_demographics
    WHERE age >= 60; -- remove retirees
END $$
DELIMITER ;


-- =========================
-- CHECK EVENT STATUS
-- =========================

-- Ensure event scheduler is enabled
SHOW VARIABLES LIKE 'event%'; -- look for event_scheduler = ON