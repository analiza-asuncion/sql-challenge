Submitted by: Analiza Asuncion
SQL Queries performed to complete the SQL-Challenge homework.

1. List the following details of each employee: employee number, last name, first name, gender, and salary.

select e.emp_no, last_name, first_name, gender, s.salary
from employees as e, salaries as s
where e.emp_no IN (select emp_no from salaries)


2. List employees who were hired in 1986.




3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

select 

m.dept_no,
d.dept_name,
e.emp_no,
e.last_name,
e.first_name,
m.from_date,
m.to_date 

from employees as e

RIGHT JOIN dept_manager as m ON m.emp_no= e.emp_no
RIGHT JOIN departments as d ON d.dept_no = m.dept_no

--4. List the department of each employee with the following information: 
--employee number, last name, first name,and department name.

select 
e.emp_no,
e.last_name,
e.first_name,
d.dept_name
from departments as d
LEFT JOIN dept_emp as p ON d.dept_no=p.dept_no
LEFT JOIN employees as e ON p.emp_no=e.emp_no
order by e.emp_no

--5. List all employees whose first name is "Hercules" and last names begin with "B."

select * from employees 
where
first_name = 'Hercules'
and
last_name like 'B%'
order by first_name

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

select 
e.emp_no,
e.last_name,
e.first_name,
d.dept_name
from employees as e
LEFT JOIN dept_emp as p ON p.emp_no=e.emp_no
LEFT JOIN departments as d ON p.dept_no=d.dept_no
where d.dept_name IN ('Sales')
order by emp_no

--7. List all employees in the Sales and Development departments, including their
--employee number, last name, first name, and department name.

select 
e.emp_no,
e.last_name,
e.first_name,
d.dept_name
from employees as e
LEFT JOIN dept_emp as p ON p.emp_no=e.emp_no
LEFT JOIN departments as d ON p.dept_no=d.dept_no
where d.dept_name IN ('Sales', 'Development')
order by dept_name

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select count (last_name), last_name from employees
group by last_name
order by count desc


BONUS
select t.title, s.salary
from titles as t 
LEFT JOIN salaries as s ON s.emp_no= t.emp_no