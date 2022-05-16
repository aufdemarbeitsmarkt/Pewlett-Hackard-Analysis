-- determining retirement eligibility
SELECT 
	 first_name, last_name
FROM employees
WHERE birth_date >= '1952-01-01' 
  AND birth_date <= '1955-12-31'
  AND hire_date >= '1985-01-01' 
  AND hire_date <= '1988-12-31';


-- create new `retirement_info` table
SELECT 
 	 first_name, last_name
INTO retirement_info
FROM employees
WHERE birth_date >= '1952-01-01' 
  AND birth_date <= '1955-12-31'
  AND hire_date >= '1985-01-01' 
  AND hire_date <= '1988-12-31';

-- review `retirement_info` table
SELECT
	 * 
FROM retirement_info;


