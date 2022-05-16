-- create `retirement_titles` table
SELECT 
	 e.emp_no,
	 e.first_name,
	 e.last_name, 
	 t.title,
	 t.from_date,
	 t.to_date
INTO retirement_titles	 
FROM employees AS e 
INNER JOIN titles t ON t.emp_no = e.emp_no 
WHERE birth_date >= '1952-01-01' 
  AND birth_date <= '1955-12-31';

-- review the new `retirement_titles` table
SELECT
	 *
FROM retirement_titles
ORDER BY emp_no
LIMIT 10;


-- Use Dictinct with Orderby to remove duplicate rows; create a `unique_titles`table
SELECT 
	 DISTINCT ON (rt.emp_no) rt.emp_no,
	 rt.first_name,
	 rt.last_name,
	 rt.title
INTO unique_titles
FROM retirement_titles AS rt
WHERE rt.to_date = '9999-01-01'
ORDER BY rt.emp_no, rt.to_date DESC;

-- review the new `unique_titles` table
SELECT 
	 *
FROM unique_titles
LIMIT 10;

-- retrieve the number of employees by their most recent job title who are about to retire
-- create a new `retiring_titles` table
SELECT 
	 COUNT(ut.emp_no),
	 ut.title
INTO retiring_titles	 
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY COUNT(ut.emp_no) DESC;

-- review the new `retiring_titles`table
SELECT 
	 * 
FROM retiring_titles;

-- create `mentorship_eligibility`table
-- this table holds the employees who are eligible to participate in a mentorship program
SELECT 
	 DISTINCT ON (e.emp_no) e.emp_no,
	 e.first_name,
	 e.last_name,
	 e.birth_date,
	 de.from_date,
	 de.to_date,
	 t.title
INTO mentorship_eligibility 
FROM employees AS e
INNER JOIN dept_emp AS de ON de.emp_no = e.emp_no
INNER JOIN titles AS t ON t.emp_no = e.emp_no
WHERE de.to_date = '9999-01-01'
  AND e.birth_date >= '1965-01-01'
  AND e.birth_date <= '1965-12-31'
ORDER BY e.emp_no;

-- review the new `mentorship_eligibility` table
SELECT 
	 *
FROM mentorship_eligibility
LIMIT 10;
