--identify dates where no sales were recorded for each product in the table

select p.product_id, d.date
from product p
cross join dates d
left join sales s on p.product_id = s.product_id and d.date = s.sale_date
where s.sale_date is null

--calculate the cumulative sales by month
select month, sales_amount,
	sum(sales_amount) over (order by month) as cumulative_sales
from monthly_sales

--Identify employees in multiple departments

select employee_id
from employee_departments
group by employee_id
Having count(distinct department_id) >1