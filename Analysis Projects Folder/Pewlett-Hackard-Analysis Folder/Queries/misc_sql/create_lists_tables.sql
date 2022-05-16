-- create additional lists

-- create `emp_info` table
SELECT
 	e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	de.to_date,
	s.salary
INTO emp_info
FROM employees e 
LEFT JOIN dept_emp de ON de.emp_no = e.emp_no
INNER JOIN salaries s ON s.emp_no = e.emp_no 
WHERE (e.birth_date >= '1951-01-01' AND e.birth_date <= '1955-12-31')
  AND (e.hire_date >= '1985-01-01' AND e.hire_date <= '1988-12-31')
  AND de.to_date = '9999-01-01';

-- create `manager_info` table
SELECT 
	 dm.dept_no,
	 d.dept_name,
	 dm.emp_no,
	 ce.last_name,
	 ce.first_name,
	 dm.from_date,
	 dm.to_date
INTO manager_info
FROM dept_manager dm
INNER JOIN departments d ON d.dept_no = dm.dept_no 
INNER JOIN current_emp ce ON ce.emp_no = dm.emp_no;

-- create `dept_info` table
SELECT 
	 ce.emp_no,
	 ce.first_name,
	 ce.last_name,
	 d.dept_name
INTO dept_info
FROM current_emp ce 
INNER JOIN dept_emp de ON de.emp_no = ce.emp_no
INNER JOIN departments d ON d.dept_no = de.dept_no;

