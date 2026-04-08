CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    payment_method VARCHAR(50)
);

INSERT INTO orders VALUES
(1, 101, 'Credit Card'),
(2, 101, 'UPI'),
(3, 102, 'Credit Card'),
(4, 103, 'Debit Card'),
(5, 103, 'Debit Card'),
(6, 104, 'Net Banking'),
(7, 104, 'Credit Card');


select * from orders

--Find customers who placed orders with multiple payment methods.


SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING COUNT(DISTINCT payment_method) > 1;