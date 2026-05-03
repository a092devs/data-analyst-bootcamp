-- =========================
-- WINDOW FUNCTIONS
-- =========================

-- OVER(...) defines the window of rows a function operates on 
-- without collapsing rows (unlike GROUP BY).
-- PARTITION BY splits that window into groups (like GROUP BY),
-- but still keeps all rows visible in the result.


-- =========================
-- GROUP BY (BASELINE)
-- =========================

-- GROUP BY collapses rows into one per group
SELECT 
    dem.first_name, 
    dem.last_name, 
    gender, 
    AVG(salary) AS avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY dem.first_name, dem.last_name, gender;


-- =========================
-- WINDOW FUNCTION: AVG
-- =========================

-- Average salary per gender, shown on each row
SELECT 
    dem.first_name, 
    dem.last_name, 
    gender, 
    AVG(salary) OVER(PARTITION BY gender) AS avg_salary_by_gender -- window per gender
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;
    

-- =========================
-- WINDOW FUNCTION: ROLLING TOTAL
-- =========================

-- Running total of salary within each gender
SELECT 
    dem.first_name, 
    dem.last_name, 
    gender, 
    salary,
    SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS rolling_total -- reset per gender + ordered accumulation
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;
    

-- =========================
-- WINDOW FUNCTION: RANKING
-- =========================

-- Ranking employees by salary within each gender
SELECT 
    dem.employee_id, 
    dem.first_name, 
    dem.last_name, 
    gender, 
    salary,
    ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num, -- unique sequence
    RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num, -- ties share rank (gaps)
    DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS dense_rank_num -- ties share rank (no gaps)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;