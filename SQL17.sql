--identify the most popular product in each category
select category_id, product_name, max(sales) as max_sales
from products 
group by category_id, product_name
order by max_sales desc

--detect orders that exceed a monthly threshold
select customer_id, sum(order_amount) as total_spent
from orders 
group by customer_id, month(order_date)
having sum(order_amount) > 10000


--Identify customers who have never ordered product "P123"
Select customer_id
from customers
where customer_id NOT IN (
	SELECT customer_id
	from orders
	where product_id = "P123"
)