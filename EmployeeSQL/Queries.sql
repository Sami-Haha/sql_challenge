-- DATA ANALYSIS
-- Query 1 - List the employee number, last name, first name, sex and salary of each employee.
SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    e.sex,
    s.salary
FROM
    employees e
JOIN
    salaries s ON e.emp_no = s.emp_no;

-- Query 2 - List the first name, last name, and hire date for the employees who were hired in 1986.
-- Additionally sorted by hire date.
SELECT
    first_name,
    last_name,
    hire_date
FROM
    employees
WHERE
    EXTRACT(YEAR FROM hire_date) = 1986
ORDER BY
    hire_date;	
	
-- Query 3 - List the manager of each department along with their department number, department name, employee number, last name, and first name.
-- Additional sort by department.
SELECT
    dm.dept_no AS department_number,
    d.dept_name AS department_name,
    dm.emp_no AS employee_number,
    e.last_name,
    e.first_name
FROM
    dept_manager dm
JOIN
    employees e ON dm.emp_no = e.emp_no
JOIN
    departments d ON dm.dept_no = d.dept_no
ORDER BY
    dm.dept_no;	
	
-- Query 4 - List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT
    de.dept_no AS department_number,
    de.emp_no AS employee_number,
    e.last_name,
    e.first_name,
    d.dept_name AS department_name
FROM
    dept_emp de
JOIN
    employees e ON de.emp_no = e.emp_no
JOIN
    departments d ON de.dept_no = d.dept_no;
	
-- Query 5 - List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT
    first_name,
    last_name,
    sex
FROM
    employees
WHERE
    first_name = 'Hercules'
    AND last_name LIKE 'B%'
ORDER BY last_name;

-- Query 6 - List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
    e.emp_no AS employee_number,
    e.last_name,
    e.first_name
FROM
    employees e
JOIN
    dept_emp de ON e.emp_no = de.emp_no
JOIN
    departments d ON de.dept_no = d.dept_no
WHERE
    d.dept_name = 'Sales';

-- Query 7 - List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
    e.emp_no AS employee_number,
    e.last_name,
    e.first_name,
    d.dept_name AS department_name
FROM
    employees e
JOIN
    dept_emp de ON e.emp_no = de.emp_no
JOIN
    departments d ON de.dept_no = d.dept_no
WHERE
    d.dept_name IN ('Sales', 'Development');

-- Query 8 - List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT
    last_name,
    COUNT(*) AS frequency
FROM
    employees
GROUP BY
    last_name
ORDER BY
    frequency DESC, last_name;
