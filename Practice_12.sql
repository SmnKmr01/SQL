
--Premium_customers
with cte as(
select  customer_id, SUM(sales) as total_value
from orders_pd
group by customer_id
)
select * from cte
where total_value > (select AVG(total_value) from cte)