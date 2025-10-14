--Nth highest salary per department
With ranked as(
	select 
		dept_id,
		emp_id,
		salary,
		DENSE_RANK() over (partition by dept_id order by salary desc) as rnk
		from employees)
select * from ranked where rnk = nth