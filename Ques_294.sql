CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE
);

INSERT INTO orders (order_id, customer_id, order_date) VALUES

-- Customer 101 (Increasing every month)
(1,101,'2026-01-05'),
(2,101,'2026-02-02'),
(3,101,'2026-02-15'),
(4,101,'2026-03-01'),
(5,101,'2026-03-05'),
(6,101,'2026-03-20'),
(7,101,'2026-04-10'),
(8,101,'2026-04-11'),
(9,101,'2026-04-15'),
(10,101,'2026-04-18'),

-- Customer 102 (Not increasing)
(11,102,'2026-01-01'),
(12,102,'2026-01-05'),
(13,102,'2026-02-10'),

-- Customer 103 (Increase then drop)
(14,103,'2026-01-02'),
(15,103,'2026-02-01'),
(16,103,'2026-02-10'),
(17,103,'2026-03-01');

--Flag customers with an increase in orders every month this year.

select * from orders

WITH monthly_counts AS (
    SELECT 
        customer_id,
        DATEFROMPARTS(YEAR(order_date), MONTH(order_date), 1) AS month,
        COUNT(*) AS cnt
    FROM orders
    WHERE YEAR(order_date) = YEAR(GETDATE())
    GROUP BY 
        customer_id,
        DATEFROMPARTS(YEAR(order_date), MONTH(order_date), 1)
),

increase_check AS (
    SELECT 
        customer_id,
        month,
        cnt,
        LAG(cnt) OVER (
            PARTITION BY customer_id 
            ORDER BY month
        ) AS prev_cnt
    FROM monthly_counts
)

SELECT DISTINCT customer_id
FROM increase_check
WHERE cnt > prev_cnt
  AND prev_cnt IS NOT NULL;