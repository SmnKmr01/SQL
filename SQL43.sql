--Products never sold

select p.* from products p
left join order_items o 
ON p.id = o.product_id
where o.product_id IS NULL

--Highest order value per customer
SELECT o.*
from orders o
where amount = (select max(amount) from orders where customer_id = o.customer_id


--compare today vs yesterday active users
WITH daily_users AS (
SELECT activity_date, COUNT(DISTINCT user_id) AS user_count
From activity_log
where activity_date IN (GETDATE(),DATEADD(DAY,-1, GETDATE()))
GROUP by activity_date)
select * from daily_users

--RANK products by sales within each category
select product_id, category, RANK() OVER (PARTITION BY category
order by total_sales DESC) AS rnk
from product_sales


      