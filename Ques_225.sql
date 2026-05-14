--Find customers who spent more than average intheir country.

WITH avg_spent_per_country AS (
 SELECT c.country, AVG(o.amount) AS avg_amount
 FROM customers c
 JOIN orders o ON c.customer_id = o.customer_id
 GROUP BY c.country
)
SELECT c.customer_id, SUM(o.amount) AS
total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN avg_spent_per_country a ON c.country =
a.country
GROUP BY c.customer_id, c.country, a.avg_amount
HAVING SUM(o.amount) > a.avg_amount