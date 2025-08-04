--Write a query to print 3 columns:city, highest_expense_type, lowest_expense_type


select * from credit_transactions

with cte as (
	select city,
		exp_type,
		sum(amount) as total_spend
	from credit_transactions
	group by city, exp_type
),
cte2 as(
	select *,
		Rank() over (partition by city order by total_spend desc) as highest_expense_rk,
		Rank() over (partition by city order by total_spend) as lowest_expense_rk
	from cte
)
select city,
	MAX(case when highest_expense_rk = 1 then exp_type end) as highest_expense_type,
	MAX(case when lowest_expense_rk = 1 then exp_type end) as lowest_expense_type
from cte2
group by city