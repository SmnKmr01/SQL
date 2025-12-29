--Write a query to print top 5 cities with highest spends and their percentage contribution of total credit card spends

SELECT TOP 5 city, 
SUM(amount) as total_spend,
ROUND(100.0 * SUM(amount)/
(SELECT SUM(amount) from credit_card_transactions), 2) AS pect_of_total_spend
from credit_card_transactions
group by city
order by total_spend DESC
