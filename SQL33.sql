--Write a query to print the transaction details(all columns from the table) for each card type when 
--it reaches a cumulative of 1000000 total spends


select * from credit_transactions

with cte as(
	select *, 
		SUM(amount) OVER (partition by card_type order by  transaction_date, transaction_id) as cumm_spend
	from Credit_transactions
),
cte2 as (
	select *, 
	ROW_NUMBER() over(partition by card_type order by cumm_spend) as rk
	from cte
	where cumm_spend >=1000000
)
select transaction_id,
	city,
	transaction_date,
	card_type,
	exp_type,
	gender,
	amount from cte2
where rk = 1