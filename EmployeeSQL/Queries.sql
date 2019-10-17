-- List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.gender, sal.salary
FROM employees emp
INNER JOIN 
salaries sal
ON emp.emp_no=sal.emp_no;

 --List employees who were hired in 1986.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.gender, emp.hire_date
FROM employees emp 
WHERE date_part('year', hire_date)=1986;

--List the manager of each department with the following information: department number, department name, the manager's 
--employee number, last name, first name, and start and end employment dates.
SELECT dept.dept_no, dept.dept_name, emp.emp_no, emp.last_name, emp.first_name, man.from_date, man.to_date
FROM departments dept
INNER JOIN
dept_manager man
ON dept.dept_no=man.dept_no
INNER JOIN
employees emp
ON man.emp_no=emp.emp_no;

 --List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employees emp 
INNER JOIN
dept_emp demp
ON demp.emp_no=emp.emp_no
INNER JOIN
departments dept 
ON demp.dept_no=dept.dept_no;

 -- List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name 
FROM employees 
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.first_name, emp.last_name, dept.dept_name
FROM employees emp
INNER JOIN dept_emp demp
ON emp.emp_no = demp.emp_no
INNER JOIN departments dept
ON dept.dept_no = demp.dept_no
WHERE dept_dame = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.first_name, emp.last_name, dept.dept_name
FROM employees emp
INNER JOIN dept_emp demp
ON emp.emp_no = demp.emp_no
INNER JOIN departments dept
ON dept.dept_no = demp.dept_no
WHERE dept_dame IN('Sales', 'Development');

---In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT emp.last_name, COUNT(emp.last_name)
FROM employees emp
GROUP BY emp.last_name
ORDER BY last_name DESC;