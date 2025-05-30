-- Identify Customers who Purchased in ALL Months of 2024

select customer_id
from (
	Select customer_id, COUNT(DISTINCT MONTH(order_date)) AS month_count
	from order
	where YEAR(order_date) = 2024
	group by customer_id
	) monthly_orders
	where month_count =12