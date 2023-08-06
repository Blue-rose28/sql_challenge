--I. CREATE TABLES OF DATA====================================================================

	--Create departments tables: 
CREATE TABLE departments(
	"dept_no" VARCHAR(30) PRIMARY KEY,
	"dept_name" VARCHAR(30)
);
SELECT * FROM departments

	-- Create dept_emp talbe

CREATE TABLE dept_emp(
	"emp_no" INT PRIMARY KEY,
	"dept_no" VARCHAR(30)
);
SELECT * FROM dept_emp

	---------------Create dept_manager talbe

CREATE TABLE dept_manager(
	"dept_no" VARCHAR(30),
	"emp_no" INT PRIMARY KEY
);

SELECT * FROM dept_manager

	-------------- Create employee talbe

CREATE TABLE employees (
	"emp_no" INT PRIMARY KEY,
	"emp_title_id" VARCHAR(30),
	"birth_date" DATE,
	"first_name" VARCHAR(30),
	"last_name" VARCHAR(30),
	"sex" VARCHAR(30),
	"hire_date" DATE
);
SELECT * FROM employees

	-------------- Create salaries talbe
CREATE TABLE salaries (
	"emp_no" VARCHAR(30),
	"salary" INT
	);
SELECT * FROM salaries


	-------------- Create titles talbe

CREATE TABLE titles (
	"title_id" VARCHAR(30),
	"title" VARCHAR(30)
	);
SELECT * FROM titles

--=====================================================================================

--II) INSERT DATA INTO CREATED TABLES
		-- right click to each created table and then import from related csv file in the data folder.
		

--=====================================================================================
I--III)---DATA ANALYST:
	--List the the employee number, last name, first name, sex, and salary of each employee.
		
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
INNER JOIN salaries s ON e.emp_no = s.emp_no;

		
--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date < '1987-01-01';

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
    d.dept_no,
    d.dept_name,
    dm.emp_no AS manager_emp_no,
    e.last_name AS manager_last_name,
    e.first_name AS manager_first_name
FROM departments d
INNER JOIN dept_manager dm ON d.dept_no = dm.dept_no
INNER JOIN employees e ON dm.emp_no = e.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT 
    de.emp_no,
    e.last_name,
    e.first_name,
    de.dept_no,
    d.dept_name
FROM dept_emp de
INNER JOIN employees e ON de.emp_no = e.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no;

--List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.

SELECT 
    e.emp_no,
    e.last_name,
    e.first_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(*) as frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;







