-- =========================
-- HAVING vs WHERE CLAUSE
-- =========================

-- ❌ INVALID QUERY
-- Reason: WHERE cannot be used with aggregate functions like AVG()
-- WHERE filters rows BEFORE grouping happens
SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
WHERE AVG(age) > 40;


-- ✅ CORRECT QUERY
-- HAVING is used to filter grouped data (after aggregation)
SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40;


-- =========================
-- WHERE + HAVING TOGETHER
-- =========================

-- WHERE filters rows BEFORE grouping
-- HAVING filters results AFTER grouping

-- Step 1: Filter rows where occupation contains 'manager'
-- Step 2: Group by occupation
-- Step 3: Filter groups where average salary > 75000
SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary) > 75000;