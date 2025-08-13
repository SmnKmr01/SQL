--during weekends which city has highest total spend to total no of transactions ratio

select * from credit_transactions

select top(1)
	city,
	sum(amount)/count(transaction_id) as total_spennd_to_total_transaction_ratio
from credit_transactions
where datename(WEEKDAY,transaction_date) IN ('Saturday', 'Sunday')
group by city
order by total_spennd_to_total_transaction_ratio desc