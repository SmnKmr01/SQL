drop table orders

CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    amount INT
);

INSERT INTO orders
VALUES
(1,101,'2023-01-01',100),
(2,101,'2023-02-01',150),
(3,101,'2023-03-01',200),
(4,102,'2023-01-05',300),
(5,102,'2023-02-10',200),
(6,102,'2023-03-15',100),
(7,103,'2023-01-07',50),
(8,103,'2023-02-20',50),
(9,103,'2023-03-25',50),
(10,104,'2023-01-10',100),
(11,104,'2023-03-10',200);

SELECT * FROM orders;

WITH purchase_history
AS
(
SELECT 
	order_id, order_date, customer_id, amount,
	LAG(amount, 1) OVER(PARTITION BY customer_id ORDER BY order_date) as prev_purchase
FROM orders)

SELECT
customer_id
FROM purchase_history
WHERE amount > prev_purchase
GROUP BY customer_id
having COUNT(*) >=1