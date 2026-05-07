

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    order_date DATE,
    delivery_date DATE
);

-- Insert Sample Data
INSERT INTO orders (order_id, customer_name, order_date, delivery_date)
VALUES
(1, 'Amit',  '2026-05-01', '2026-05-05'),
(2, 'Priya', '2026-05-02', '2026-05-06'),
(3, 'Rahul', '2026-05-03', '2026-05-08'),
(4, 'Sneha', '2026-05-04', NULL),
(5, 'Karan', '2026-05-05', '2026-05-07')

select * from orders

--Find the average time difference between order and delivery

SELECT 
    AVG(DATEDIFF(DAY, order_date, delivery_date) * 1.0) AS avg_delivery_time
FROM orders
WHERE delivery_date IS NOT NULL