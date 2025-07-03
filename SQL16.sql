-- find products with zero sales in the last quarter

select product_id, product_name
from products
where product_id not in (
	select distinct product_id
	from sales
	where sale_date >= DATEADD(quarter, -1, GETDATE())



--count the number of orders with discounts in each category
select category_id, count(*) as discounted_orders
from orders
where discounts > 0
group by category_id



--Identify employees whose tenure is below average
select employee_id , name, tenure
from employee
where tenure < (select avg(tenure) from employees
