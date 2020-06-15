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
FROM departments AS f
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
SELECT *
FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.
SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    de.dept_name
FROM dep_emp AS d
    JOIN employees AS e 
    ON e.emp_no = d.emp_no
    JOIN departments AS de
    ON d.dept_no = de.dept_no
WHERE de.dept_name = 'Sales';



-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.

SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    de.dept_name
FROM dep_emp AS d
    JOIN employees AS e 
    ON e.emp_no = d.emp_no
    JOIN departments AS de
    ON d.dept_no = de.dept_no
WHERE de.dept_name = 'Sales'
    OR de.dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, i.e., 
-- how many employees share each last name.
SELECT first_name, count(*)
FROM employees
GROUP BY first_name
ORDER BY count DESC;

