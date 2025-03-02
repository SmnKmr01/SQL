--Conditional Sum

SELECT

o.order_month,

SUM(

CASE WHEN p.status = 'Paid' THEN o.order_amount ELSE 0 END

) AS total_amount_paid,

SUM(

CASE WHEN p.status = 'Pending' THEN o.order_amount ELSE 0 END

) AS total_amount_pending,

SUM(

CASE WHEN p.status = 'Default' THEN o.order_amount ELSE 0 END

) AS total_amount_default

FROM orders o

INNER JOIN payment_status p ON o.payment_status_id = p.id;