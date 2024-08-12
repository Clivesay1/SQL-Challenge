-- Analysis Query

-- List emp_no, last_name, first_name, sex, salary each employee
SELECT emp_no, last_name, first_name, sex,
	(SELECT salaries.salary
	FROM salaries
	WHERE employees.emp_no = salaries.emp_no) AS "Salary"
FROM employees;


-- List first_name and last_name of employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE date_part('year',hire_date) = 1986


-- List manager for each department
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager dm
INNER JOIN departments d
ON dm.dept_no = d.dept_no
INNER JOIN employees e
ON dm.emp_no = e.emp_no;


-- List each employee 
SELECT e.emp_no, e.last_name, e.first_name, de.dept_no,
	(SELECT d.dept_name
	FROM departments d
	WHERE de.dept_no = d.dept_no)
FROM employees e
INNER JOIN dept_emp de
ON e.emp_no = de.emp_no;


-- List Hercules info if last name starts with B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';


-- List Sales employees
SELECT de.emp_no, e.last_name, e.first_name
FROM dept_emp de
INNER JOIN employees e
ON de.emp_no = e.emp_no
WHERE de.dept_no = 'd007';


-- List Sales and Development employees
SELECT de.emp_no, e.last_name, e.first_name,
	(SELECT d.dept_name
	FROM departments d
	WHERE de.dept_no = d.dept_no)
FROM dept_emp de
INNER JOIN employees e
ON de.emp_no = e.emp_no
WHERE de.dept_no = 'd007' -- Sales department
OR de.dept_no = 'd005'; -- Dev department


-- List  last name frequencies
SELECT last_name, COUNT(last_name) AS "Count of Last Name"
FROM employees
GROUP BY last_name
ORDER BY "Count of Last Name" DESC;