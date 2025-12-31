--Write a query to print highest spend month and amount spent in that month for each card type

WITH CTE_1 AS (
	select 
		CARD_TYPE,
		MONTH(transaction_date) AS transaction_month,
		YEAR(ransaction_date) AS transaction_year,
		SUM(amount) AS monthly_spend
	FROM credit_card_transactions
	GROUP BY card_type.
		YEAR(transaction_date),
		MONTH(transaction_date)
	ORDER BY monthly_spend DESC
)
,cte_2 AS (
	SELECT *,
	RANK() OVER(PARTITION BY card_type ORDER BY monthly_spend desc) as rk
	FROM cte_1
)
SELECT 
	card_type,
	transaction_month,
	transaction_year,
	monhtly_spend
from cte_2
where rk = 1