--Data Analysis 
--1 List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no= salaries.emp_no;
--2 List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date between '1986-01-01' and '1986-12-31'
--3 List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
SELECT managerAndDep.dept_no, managerAndDep.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM employees
JOIN
	(SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no
	 FROM dept_manager
	 JOIN departments
	 ON dept_manager.dept_no = departments.dept_no) AS managerAndDep
ON employees.emp_no = managerAndDep.emp_no
--4 List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT empAndDep.dept_no, empAndDep.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM employees
JOIN
	(SELECT departments.dept_no, departments.dept_name, dept_emp.emp_no
	 FROM dept_emp
	 JOIN departments
	 ON dept_emp.dept_no = departments.dept_no) AS empAndDep
ON employees.emp_no = empAndDep.emp_no
--5 List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' 
	AND last_name like 'B%'
--6 List all employees in the Sales department, including their:
--employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, empAndDep.dept_name
FROM employees
JOIN
	(SELECT departments.dept_no, departments.dept_name, dept_emp.emp_no
	 FROM dept_emp
	 JOIN departments
	 ON dept_emp.dept_no = departments.dept_no
	 WHERE departments.dept_name='Sales') AS empAndDep
ON employees.emp_no = empAndDep.emp_no
--7 List all employees in the Sales and Development departments, including their:
--employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, empAndDep.dept_name
FROM employees
JOIN
	(SELECT departments.dept_no, departments.dept_name, dept_emp.emp_no
	 FROM dept_emp
	 JOIN departments
	 ON dept_emp.dept_no = departments.dept_no
	 WHERE departments.dept_name='Sales'
	 	OR departments.dept_name='Development') AS empAndDep
ON employees.emp_no = empAndDep.emp_no
--8 In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(*) AS "Number of employees"
FROM employees 
GROUP BY last_name
ORDER BY "Number of employees" DESC
