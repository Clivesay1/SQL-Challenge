--- Table generation query
-- Drop tables if they already exist by removing comment (--) of next line
--DROP TABLE Titles, Employees, Salaries, Departments, Dept_emp, Dept_manager;


-- generate Titles table
CREATE TABLE Titles (
	title_id VARCHAR(10) PRIMARY KEY,
	title VARCHAR(50) NOT NULL
);

-- Show Results
SELECT * FROM Titles;


-- generate Employees table
CREATE TABLE Employees (
	emp_no INTEGER PRIMARY KEY,
	emp_title_id VARCHAR(10) NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	birth_date DATE NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL
);

-- Show Results
SELECT * FROM Employees;


-- genmerate Salaries table
CREATE TABLE Salaries (
	emp_no INTEGER PRIMARY KEY,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INTEGER NOT NULL
);

-- Show Results
SELECT * FROM Salaries;


-- generate Departments table
CREATE TABLE Departments (
	dept_no VARCHAR(10) PRIMARY KEY,
	dept_name VARCHAR(50) NOT NULL
);

-- Show Results
SELECT * FROM Departments;


-- generate Dept_emp table
CREATE TABLE Dept_emp (
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Show Results
SELECT * FROM Dept_emp;


--generate Dept_manager table
CREATE TABLE Dept_manager (
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INTEGER PRIMARY KEY,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)	
);

-- Show Results
SELECT * FROM Dept_manager;
