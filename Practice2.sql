--Find Nth Highest Salary 

select Distinct salary
from (
	select salary, DENSE_RANK() over (order by salary desc) as rnk
	from employees
)t
where rnk = 5

--Find Employees who have the same salary
select salary, count(*) as emp_count
from employees
group by salary
Having count(*) > 1

--Delete duplicate records but keep the lowestid
delete from employees
where id not in (
	select MIN(id)
	from employees 
	group by name, department_id, salary
)

--Top 2 salaries per department
select * from(
	select distinct EmpName, DeptID, salary,
		Row_number() over(partition by DeptID order by salary desc) as rnk
	from employees
	group by EmpName, DeptID, salary
)t
where rnk <=2
