

CREATE TABLE orders (
    customer_id VARCHAR(10),
    order_date DATE
);

INSERT INTO orders (customer_id, order_date)
VALUES
('A', '2024-01-01'),
('A', '2024-01-02'),
('B', '2024-01-01'),
('B', '2024-01-03');

select * from orders

--Find users with back to back day orders


WITH PrevOrder AS (
    SELECT 
        customer_id,
        order_date,
        LAG(order_date) OVER (
            PARTITION BY customer_id 
            ORDER BY order_date
        ) AS prev_order_date
    FROM orders
)
SELECT DISTINCT customer_id
FROM PrevOrder
WHERE DATEDIFF(DAY, prev_order_date, order_date) = 1;