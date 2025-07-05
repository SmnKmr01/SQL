-- calculate each employees percentage of department sales
select employee_id, sales,
	sales*100.0/SUM(sales)  over (partition by department_id) as dept_sales_percentage
from employee_sales

--FInd products with sales growth between two periods
select p.product_id,
	q1.sales as q1_sales, q2.sales as q2_sales,
	(q2.sales - q1.sales) / nullif(q1.sales, 0) * 100 as grgowth_rate
from (select product_id, sum(sales) as sales from sales where quarter
= 'Q1' Group by product_id) q1
join (select product_id, sum(sales) as sales from sales where quarter
= 'Q2' group by product_id) q2
on q1.product_id = q2.product_id

--find customers with orders in consecutive months

select customer_id, order_date,
	DATEDIFF(month, lag(order_date) over (partition by customer_id order by order_date) , order_date) as months_diff
from orders
where months_diff = 1