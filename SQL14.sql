--Calculate the rolling average sales over the last 7 days

select sale_date, sale_amount, 
	AVG(sales_amount) over (order by sale_date rows between 6 
	PRECEDING AND CURRENT ROW) AS Rolling_avg_7_days
from daily_sales

--Second highest salary in each department
select department_id, max(salary) as second_highest_salary
from employees
where salary < (
	select max(salary) 
	from employees e
	where department_id = employees.department_id
)
group by department_id

--retrieve all order placed between 9am and 5pm

select order_id, order_time
from orders
where CAST(order_time as TIME) between '09:00:00' and '17:00:00'