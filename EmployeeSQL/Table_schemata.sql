-- Run query for current date format to confirm import dates will be succesful
SHOW datestyle;
-- query each tables data
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

-- Drop table if required
DROP TABLE IF EXISTS employees, titles, dept_emp, departments, dept_manager, salaries;

-- Create new tables using ERD from QuickDBD
-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
CREATE TABLE employees(
      emp_no int   NOT NULL,
      emp_title_id VARCHAR(10) NOT NULL,
      birth_date date NOT NULL,
      first_name VARCHAR(30) NOT NULL,
      last_name VARCHAR(30) NOT NULL,
      sex char(1) NOT NULL,
      hire_date date NOT NULL,
    CONSTRAINT  pk_employees PRIMARY KEY (emp_no)
);

CREATE TABLE titles (
      titleID VARCHAR(10) NOT NULL,
      title VARCHAR(30) NOT NULL,
    CONSTRAINT  pk_titles PRIMARY KEY (titleID)
);

CREATE TABLE departments (
      dept_no VARCHAR(10) NOT NULL,
      dept_name VARCHAR(30) NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (dept_no )
);

CREATE TABLE   dept_emp (
      id SERIAL PRIMARY KEY,
      emp_no int   NOT NULL,
      dept_no VARCHAR(10) NOT NULL    
);

CREATE TABLE   dept_manager (
      id SERIAL PRIMARY KEY,
      dept_no VARCHAR(10)   NOT NULL,
      emp_no int   NOT NULL    
);

CREATE TABLE   salaries (
      id SERIAL PRIMARY KEY,
      emp_no int   NOT NULL,
      salary int   NOT NULL    
);

-- Add in the Foreign Keys
ALTER TABLE   employees ADD CONSTRAINT   fk_employees_emp_title_id FOREIGN KEY(  emp_title_id  )
REFERENCES   titles (  titleID  );

ALTER TABLE   dept_emp ADD CONSTRAINT   fk_dept_emp_emp_no FOREIGN KEY(  emp_no  )
REFERENCES   employees (  emp_no  );

ALTER TABLE   dept_emp ADD CONSTRAINT   fk_dept_emp_dept_no FOREIGN KEY(  dept_no  )
REFERENCES   departments (  dept_no  );

ALTER TABLE   dept_manager ADD CONSTRAINT   fk_dept_manager_dept_no FOREIGN KEY(  dept_no  )
REFERENCES   departments (  dept_no  );

ALTER TABLE   dept_manager ADD CONSTRAINT   fk_dept_manager_emp_no FOREIGN KEY(  emp_no  )
REFERENCES   employees (  emp_no  );

ALTER TABLE   salaries ADD CONSTRAINT   fk_salaries_emp_no FOREIGN KEY(  emp_no  )
REFERENCES   employees (  emp_no  );

