--Rank customers by their purchase frequency

select customer_id, count(*) as purchase_count,	
	DENSE_RANK() over(order by count(*) Desc) as purchase_rak
from purchases
group by customer_id