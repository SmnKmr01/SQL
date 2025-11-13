-- How to find the average salary of the top 5 highest paid employees in each department

select Department_id , avg(salary)
	from (select Department_id, salary,
		DENSE_RANK() over (partition by Department_id order by salary desc) as rnk
		from employees ) as ranked_employees
	where rnk <= 5
	group by Department_id