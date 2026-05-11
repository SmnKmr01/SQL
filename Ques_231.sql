

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);

-- Insert Sample Data
INSERT INTO orders (order_id, customer_id, order_date, amount) VALUES
(1, 101, '2025-01-05', 250.00),
(2, 102, '2025-01-10', 300.00),
(3, 103, '2025-01-15', 150.00),
(4, 104, '2025-01-20', 450.00),

(5, 101, '2025-02-03', 200.00),
(6, 102, '2025-02-08', 350.00),
(7, 105, '2025-02-12', 400.00),

(8, 101, '2025-03-01', 500.00),
(9, 103, '2025-03-07', 220.00),
(10, 105, '2025-03-15', 330.00),
(11, 106, '2025-03-18', 275.00),

(12, 101, '2025-04-05', 190.00),
(13, 102, '2025-04-11', 410.00),
(14, 105, '2025-04-19', 280.00);

select * from orders
--Calculate the retention rate of customers monthover-month

WITH MonthlyCustomers AS (
    SELECT DISTINCT
        customer_id,
        DATEFROMPARTS(YEAR(order_date), MONTH(order_date), 1) AS OrderMonth
    FROM Orders
),

Retention AS (
    SELECT
        C.OrderMonth AS CurrentMonth,
        C.customer_id
    FROM MonthlyCustomers C
    INNER JOIN MonthlyCustomers P
        ON C.customer_id = P.customer_id
       AND C.OrderMonth = DATEADD(MONTH, 1, P.OrderMonth)
)

SELECT
    CurrentMonth,
    
    COUNT(DISTINCT customer_id) * 100.0 /
    (
        SELECT COUNT(DISTINCT customer_id)
        FROM MonthlyCustomers MC
        WHERE MC.OrderMonth = DATEADD(MONTH, -1, R.CurrentMonth)
    ) AS RetentionRate

FROM Retention R
GROUP BY CurrentMonth
ORDER BY CurrentMonth;