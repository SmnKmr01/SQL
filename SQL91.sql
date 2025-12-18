-- Find employees earning above their departments avg salary

select emp_id, emp_name, department_id from employees
where salary > ( 
				select avg(salary) from employees 
					group by department_id
				)
order by department_id asc


--List employees who do not earn the highest in their department

select emp_id , emp_name, departmentid from employees
where salary NOT IN (select max(salary) FROM EMPLOYEES 
						group by departmentid)


-- Get employees earning more than the highest paid HR employee

select emp_name, salary from employees
where salary > ( select max(salary) from employees e join 
					departments d on e.d_id = d.d_id
					where dep_name = 'HR')