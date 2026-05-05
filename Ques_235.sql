

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE
);

INSERT INTO Orders (order_id, customer_id, order_date) VALUES
-- Customer 1 (Decreasing: 5 → 3 → 1)
(1, 101, '2025-01-05'),
(2, 101, '2025-01-10'),
(3, 101, '2025-01-15'),
(4, 101, '2025-01-20'),
(5, 101, '2025-01-25'),

(6, 101, '2025-02-05'),
(7, 101, '2025-02-15'),
(8, 101, '2025-02-20'),

(9, 101, '2025-03-10'),

-- Customer 2 (Not decreasing)
(10, 102, '2025-01-05'),
(11, 102, '2025-02-05'),
(12, 102, '2025-02-10'),
(13, 102, '2025-03-05'),
(14, 102, '2025-03-10');

select * from orders

--Find customers whose orders decreased consecutively for 3 months.




WITH monthly_orders AS (
    SELECT 
        customer_id,
        DATEFROMPARTS(YEAR(order_date), MONTH(order_date), 1) AS month,
        COUNT(*) AS order_count
    FROM Orders
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
WHERE order_count < prev_1 
  AND prev_1 < prev_2;