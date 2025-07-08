-- Identify customers who made purchases on excatly three different days in the last month
with purchases_summary AS(
Select customer_id, COUNT(Distinct purchase_date) AS purchase_days
FROM purchases
where purchase_date >= DATEADD(month, -1, CURRENT_DATE)
GROUP BY customer_id
)
select customer_id
from purchases_summary
where purchase_days = 3


