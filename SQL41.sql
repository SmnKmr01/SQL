WITH purchases_summary AS (
    SELECT customer_id, 
           COUNT(DISTINCT purchase_date) AS purchase_days
    FROM purchases
    WHERE purchase_date >= DATEADD(month, -1, CURRENT_DATE)
    GROUP BY customer_id
)
SELECT customer_id
FROM purchases_summary
WHERE purchase_days = 3;
