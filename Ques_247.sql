

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    payment_method VARCHAR(50)
);

INSERT INTO orders (order_id, customer_id, order_date, payment_method)
VALUES
(1, 101, '2026-04-01', 'Credit Card'),
(2, 102, '2026-04-02', 'Cash'),
(3, 103, '2026-04-03', 'UPI'),
(4, 101, '2026-04-04', 'Debit Card'),
(5, 104, '2026-04-05', 'Cash'),
(6, 105, '2026-04-06', 'Net Banking'),
(7, 103, '2026-04-07', 'UPI');

select * from orders

--Find customers who have placed orders but never paid by credit card.

select distinct customer_id 
from orders
where payment_method = 'Credit Card'