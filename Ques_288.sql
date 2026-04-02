--Find the average delivery time by shipping method.
SELECT shipping_method, AVG(delivery_date -
order_date) AS avg_delivery_time
FROM shipments
GROUP BY shipping_method