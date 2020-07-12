/*titles
-
title_id PK char(5)
title Varchar(25)*/
CREATE TABLE titles (title_id CHAR(5) NOT NULL
					,title VARCHAR(25)
					,PRIMARY KEY(title_id));
/*employees
-
emp_no PK int
emp_title_id char(5) FK >- titles.title_id
birth_date date
first_name Varchar(15)
last_name Varchar(15)
sex char(1)
hire_date date*/
CREATE TABLE employees (emp_no INT NOT NULL
					   ,emp_title_id CHAR(5)
					   ,birth_date DATE
					   ,first_name VARCHAR(15)
					   ,last_name VARCHAR(15)
					   ,sex CHAR(1)
					   ,hire_date DATE
					   ,PRIMARY KEY(emp_no)
					   ,FOREIGN KEY (emp_title_id) REFERENCES titles (title_id));
ALTER TABLE employees
ALTER COLUMN last_name TYPE VARCHAR(25);
--SET DATESTYLE TO MDY;
--show datestyle;
/*departments
-
dept_no PK char(4)
dept_name Varchar(15)*/
CREATE TABLE departments (dept_no CHAR(4) NOT NULL
						 ,dept_name VARCHAR(15)
						 ,PRIMARY KEY(dept_no));
ALTER TABLE departments
ALTER COLUMN dept_name TYPE VARCHAR(25);
/*dept_manager
-
dept_no char(4) FK >- departments.dept_no
emp_no int FK >- employees.emp_no */
CREATE TABLE dept_manager (dept_no CHAR(4)
						  ,emp_no INT
						  ,FOREIGN KEY(dept_no) REFERENCES departments (dept_no)
						  ,FOREIGN KEY(emp_no) REFERENCES employees (emp_no));
/*dept_emp
-
dept_no char(4) FK >- departments.dept_no
emp_no int FK >- employees.emp_no */
CREATE TABLE dept_emp (emp_no INT
					   ,dept_no CHAR(4)
					   ,FOREIGN KEY(dept_no) REFERENCES departments (dept_no)
					   ,FOREIGN KEY(emp_no) REFERENCES employees (emp_no));
/*salaries
-
emp_no int FK >- employees.emp_no
salary int*/
CREATE TABLE salaries (emp_no int
					  ,salary int
					  ,FOREIGN KEY(emp_no) REFERENCES employees (emp_no));

