-- Use the information you have to create a table schema for each of the six CSV files. 
-- Remember to specify data types, primary keys, foreign keys, and other constraints.

-- Example of creating one of the tables

CREATE TABLE employees(
    emp_no INT NOT NULL,
    birth_date VARCHAR(30) NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR NOT NULL,
    hire_date DATE
    PRIMARY KEY(emp_no)
);

CREATE TABLE departments (
dept_no VARCHAR(30) NOT NULL,
dept_name VARCHAR(30) NOT NULL,
PRIMARY KEY (dept_no)
);

CREATE TABLE dep_emp (
emp_no INT NOT NULL,
dept_no VARCHAR(30) NOT NULL,
from_date DATE NOT NULL,
to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
);

CREATE TABLE title (
emp_no VARCHAR(30) NOT NULL,
title VARCHAR(30) NOT NULL,
from_date DATE NOT NULL,
to_date DATE NOT NULL
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
);

CREATE TABLE salaries (
emp_no INT NOT NULL,
salaries INT NOT NULL,
from_date DATE NOT NULL,
to_date DATE NOT NULL
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
);

CREATE TABLE dept_manager(
    dept_no INT NOT NULL,
    emp_no INT NOT NULL,
    from_no DATE NOT NULL,
    to_date DATE NOT NULL
);

-- Select tables
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM dep_emp;
SELECT * FROM titles;
SELECT * FROM salaries;
SELECT * FROM dept_manager;


-- List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT 
e.emp_no,
e.last_name,
e.first_name,
e.gender,
s.salaries
FROM employees AS e 
JOIN salaries AS s
ON e.emp_no=s.emp_no;

-- List employees who were hired in 1986.
SELECT * 
FROM employees 
WHERE hire_date>'1986-01-01' AND hire_date<'1986-12-30';

-- List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name, and start and end employment dates.

SELECT 
d.dept_no, -- dept_manager
f.dept_name, -- departments
d.emp_no,
e.last_name, -- employees
e.first_name,
d.from_date,
d.to_date
FROM 
departments AS f
JOIN dept_manager AS d
ON f.dept_no=d.dept_no
JOIN employees AS e 
ON d.emp_no=e.emp_no;


-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT
e.emp_no,
e.last_name,
e.first_name,
d.dept_name
FROM employees AS e
JOIN dep_emp AS de
ON de.emp_no = e.emp_no
JOIN departments AS d
ON de.dept_no = d.dept_no;


-- List all employees whose first name is "Hercules" and last names begin with "B."

-- List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.

-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.

-- In descending order, list the frequency count of employee last names, i.e., 
-- how many employees share each last name.




