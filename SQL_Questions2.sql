---Find the average customer lifetime value (LTV).


SELECT customer_id, 
       SUM(amount_spent) / COUNT(DISTINCT subscription_month) AS avg_lifetime_value
FROM (
  SELECT customer_id, SUM(amount) AS amount_spent, EXTRACT(MONTH FROM subscription_date) AS subscription_month
  FROM payments
  GROUP BY customer_id, subscription_month
) subquery
GROUP BY customer_id;

---Calculate Monthly Recurring Revenue (MRR).

SELECT EXTRACT(YEAR FROM subscription_date) AS year,
       EXTRACT(MONTH FROM subscription_date) AS month,
       SUM(subscription_fee) AS MRR
FROM subscriptions
GROUP BY 1, 2;

---Identify users who abandoned their carts but later completed a purchase.

SELECT user_id
FROM cart_abandonments ca
JOIN orders o 
ON ca.user_id = o.user_id
AND o.order_date BETWEEN ca.abandonment_date AND ca.abandonment_date + INTERVAL '7 days';