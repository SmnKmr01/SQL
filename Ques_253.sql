

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE
);

INSERT INTO orders (order_id, customer_id, order_date) VALUES
-- Customer 101 (Increasing: Jan=1, Feb=2, Mar=3)
(1, 101, '2024-01-05'),
(2, 101, '2024-02-10'),
(3, 101, '2024-02-15'),
(4, 101, '2024-03-01'),
(5, 101, '2024-03-05'),
(6, 101, '2024-03-10'),

-- Customer 102 (Not increasing properly)
(7, 102, '2024-01-03'),
(8, 102, '2024-01-20'),
(9, 102, '2024-02-10'),
(10, 102, '2024-03-15'),
(11, 102, '2024-03-20'),

-- Customer 103 (Increasing: Feb=1, Mar=2, Apr=3)
(12, 103, '2024-02-01'),
(13, 103, '2024-03-01'),
(14, 103, '2024-03-05'),
(15, 103, '2024-04-01'),
(16, 103, '2024-04-02'),
(17, 103, '2024-04-03');


select * from orders
--Find customers who have increased their order frequency month-over-month for 3 consecutive months.



WITH monthly_orders AS (
    SELECT 
        customer_id,
        DATEFROMPARTS(YEAR(order_date), MONTH(order_date), 1) AS month,
        COUNT(*) AS order_count
    FROM orders
    GROUP BY 
        customer_id,
        DATEFROMPARTS(YEAR(order_date), MONTH(order_date), 1)
),
orders_with_lag AS (
    SELECT 
        customer_id, 
        month, 
        order_count,
        LAG(order_count, 1) OVER (PARTITION BY customer_id ORDER BY month) AS prev_1,
        LAG(order_count, 2) OVER (PARTITION BY customer_id ORDER BY month) AS prev_2
    FROM monthly_orders
)
SELECT DISTINCT customer_id
FROM orders_with_lag
WHERE order_count > prev_1 
  AND prev_1 > prev_2;