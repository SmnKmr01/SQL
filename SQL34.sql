--Write a query to find city which had lowest percentage spend for gold card type

select * from credit_transactions

with cte as(
	select city,
		card_type,
		sum(amount) as card_wise_spend
		from credit_transactions
	group by card_type, city
),
CTE2 as(
	select city,
		sum(amount) as city_wise_spend
	from credit_transactions
	group by city
)
select top(1) cte.city as city
from cte
inner join CTE2
	on cte.city = CTE2.city
where card_type = 'Gold'
ORDER BY card_wise_spend/city_wise_spend
