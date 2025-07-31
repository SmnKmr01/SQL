--Write a query to print highest spend month and amount spent in that month for each card type

select * from credit_transactions

SELECT 
    ct.card_type,
    MONTH(ct.transaction_date) AS transaction_month,
    YEAR(ct.transaction_date) AS transaction_year,
    SUM(ct.amount) AS monthly_spend
FROM 
    credit_transactions ct
GROUP BY 
    ct.card_type,
    MONTH(ct.transaction_date),
    YEAR(ct.transaction_date)
ORDER BY 
    monthly_spend desc;
 
 --OR--

 with cte_1 as (
	select 
		card_type,
		MONTH(transaction_date) as transaction_month,
		Year(transaction_date) as transaction_year,
		SUM(amount) as monthly_spend
	FROM credit_transactions
	GROUP BY card_type,
		YEAR(transaction_date),
		MONTH(transaction_date)
	
),
cte_2 as(
	SELECT *,
		RANK() OVER(PARTITION BY card_type ORDER BY monthly_spend desc) as rk
		FROM cte_1
)
select card_type,
	transaction_month,
	transaction_year,
	monthly_spend
FROM cte_2
where rk = 1
