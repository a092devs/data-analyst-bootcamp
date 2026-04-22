-- =========================
-- CASE STATEMENTS (CONDITIONAL LOGIC)
-- =========================

-- Categorizing employees based on age
-- CASE works like IF-ELSE conditions in SQL
SELECT 
    first_name,
    last_name,
    age,
    CASE
        WHEN age <= 30 THEN 'Young' 
        WHEN age BETWEEN 31 AND 50 THEN 'Old' 
        WHEN age > 50 THEN 'Please Retire'
    END AS Generation
FROM employee_demographics;


-- =========================
-- SALARY INCREMENT & BONUS
-- =========================

-- Business logic:
-- salary < 50000 → 5% increase
-- salary > 50000 → 7% increase
-- dept_id = 6 (Finance) → 10% bonus

SELECT 
    first_name, 
    last_name, 
    salary, 

    -- Calculate increment based on salary range
    CASE
        WHEN salary < 50000 THEN salary * 1.05   -- adds 5%
        WHEN salary > 50000 THEN salary * 1.07   -- adds 7%
    END AS Increment,

    -- Bonus only for Finance department (dept_id = 6)
    CASE
        WHEN dept_id = 6 THEN salary * 0.10
    END AS Bonus

FROM employee_salary;