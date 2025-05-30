--Rank Customers Based on their Total spends

SELECT customer_id ,
	SUM(order_amount) AS total_spent,
	RANK() OVER(ORDER BY SUM(order_amount) DESC) AS spending_rank
FROM orders
GROUP BY custoomer_id