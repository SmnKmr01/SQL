--WHich card and expense type combination saw highest month over month growth in jan-2014

select * from credit_transactions

with cte as(
	select card_type,
		exp_type,
		MONTH(transaction_date) as trans_month,
		YEAR(transaction_date) as trans_year,
		sum(amount) as spend
	from credit_transactions
		where (month(transaction_date) = 1
			and year(transaction_date) = 2014)
		  OR (MONTH(transaction_date) = 12
			and year(transaction_date) = 2013)
		group by card_type,exp_type,
			MONTH(transaction_date),
			YEAR(transaction_date)
)
,cte2 as(
	select *,
	LAG(spend,1) over (partition by card_type, exp_type order by trans_year)
		AS prev_month_spend
	from cte
)
select top(1)*,
	ROUND(100.0*(spend - prev_month_spend)/prev_month_spend,2)
		AS mom_growth_pct
from cte2
order by mom_growth_pct desc
