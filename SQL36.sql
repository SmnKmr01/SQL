--write a query to find percentage contribution of spends by females for each expense type

select * from credit_transactions


select exp_type,
	ROUND(100.0 *
		SUM(CASE when gender='F' then amount end)/sum(amount),2) as contribution_by_females
from credit_transactions
group by exp_type