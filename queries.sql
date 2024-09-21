/*Data Analysis*/
/*List the employee number, last name, first name, sex, and salary of each employee.*/

SELECT E.emp_no, E.last_name, E.first_name, E.sex, S.salary
FROM employees AS E 
 INNER JOIN salaries AS S 
	ON (E.emp_no = S.emp_no)
		GROUP BY E.emp_no, E.last_name, E.first_name, E.sex, S.salary;



/*List the first name, last name, and hire date for the employees who were hired in 1986.*/
SELECT last_name, first_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986';

/*List the manager of each department along with their department number, department name, employee number, last name, and first name.*/
SELECT DM.dept_no, D.dept_name, DM.emp_no, E.last_name, E.first_name
FROM dept_manager AS DM
	INNER JOIN departments AS D
	ON (DM.dept_no = D.dept_no)
		INNER JOIN employees AS E
		ON (DM.emp_no = E.emp_no)
			GROUP BY DM.dept_no, D.dept_name, DM.emp_no, E.last_name, E.first_name;
			
/*List the department number for each employee along with that employee’s employee number, last name, first name, and department name.*/
SELECT DE.dept_no, E.emp_no, E.last_name, E.first_name, D.dept_name
FROM dept_emp AS DE
	INNER JOIN employees AS E
	ON (DE.emp_no = E.emp_no)
		INNER JOIN departments AS D
		ON (DE.dept_no = D.dept_no)
			GROUP BY DE.dept_no, E.emp_no, E.last_name, E.first_name, D.dept_name;

/*List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.*/
SELECT last_name, first_name, sex
FROM employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%';

/*List each employee in the Sales department, including their employee number, last name, and first name.*/
SELECT D.dept_name, DE.emp_no, E.last_name, E.first_name
FROM dept_emp AS DE
	INNER JOIN departments AS D
	ON (DE.dept_no = D.dept_no)
		INNER JOIN employees AS E
		ON (DE.emp_no = E.emp_no)
			WHERE D.dept_name = 'Sales';

/*List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.*/
SELECT D.dept_name, DE.emp_no, E.last_name, E.first_name
FROM dept_emp AS DE
	INNER JOIN departments AS D
	ON (DE.dept_no = D.dept_no)
		INNER JOIN employees AS E
		ON (DE.emp_no = E.emp_no)
			WHERE D.dept_name = 'Sales' OR D.dept_name = 'Development';
			
/*List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).*/
SELECT last_name, COUNT(last_name) AS "Frequency Counts"
FROM employees
GROUP BY last_name
ORDER BY "Frequency Counts" DESC;
