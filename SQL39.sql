--CAlculate total sales of top 10% customers by spend

with customerSpending AS(
	Select customer_id, SUM(sales_amount) AS total_spend
	from sales	
	Group by customer_id
	)
	,
TopCustomers AS(
	Select customer_id, total_spend,
		percent_rank() over(order by total_spend DESC) as percentile
	from customerSpending
	)
select SUM(total_spend) AS top_10_percent_total_sales
from TopCustomers
where percentile <=0.1