--Get the cumulative salary of employees in each department

select * from employees

select emp_name, dept_id, salary,
	SUM(salary) over(partition by dept_name order by salary desc) as cumulative_salary
from employees

