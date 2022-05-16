-- review joining the `employees` and `dept_emp` tables
SELECT *
FROM employees e 
INNER JOIN dept_emp de ON de.emp_no = e.emp_no
LIMIT 10;

-- oh no, `retirement_info` needs an `emp_no`; recreate the table to include this column
DROP TABLE retirement_info;

-- create a new retirement_info table after dropping the original 
SELECT 
	 emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date >= '1952-01-01' AND birth_date <= '1955-12-31')
  AND (hire_date >= '1985-01-01' AND hire_date <= '1988-12-31');

-- check the `retirement_table` after creating it 
SELECT 
	 * 
FROM retirement_info;

-- joins in action 
SELECT 
	 d.dept_name,
	 dm.emp_no,
	 dm.from_date,
	 dm.to_date
FROM departments AS d
INNER JOIN dept_manager AS dm ON dm.dept_no = d.dept_no;

-- use left join to capture `retirement_info` table
SELECT 
	 ri.emp_no,
	 ri.first_name,
	 ri.last_name,
	 de.to_date
FROM retirement_info AS ri
LEFT JOIN dept_emp AS de ON de.emp_no = retirement_info.emp_no;


-- use left join for `retirement_info` and `dept_emp` tables; ensure returned employees are still employed
SELECT 
	 ri.emp_no,
	 ri.first_name, 
	 ri.last_name,
	 de.to_date
INTO current_emp
FROM retirement_info AS ri
LEFT JOIN dept_emp AS de ON de.emp_no = ri.emp_no 
WHERE de.to_date = '9999-01-01';

-- review new `current_emp` table
SELECT 
	 *
FROM current_emp
LIMIT 10;


-- use count, group by, and order by
SELECT 
	 COUNT(ce.emp_no), de.dept_no
FROM current_emp AS ce
LEFT JOIN dept_emp AS de ON de.emp_no = ce.emp_no 
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- save the query directly above as a new table
SELECT 
	 COUNT(ce.emp_no), de.dept_no
INTO current_emp_count
FROM current_emp AS ce
LEFT JOIN dept_emp AS de ON de.emp_no = ce.emp_no 
GROUP BY de.dept_no
ORDER BY de.dept_no;



