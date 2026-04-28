

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    discount_amount DECIMAL(10,2)
);

INSERT INTO orders (order_id, customer_id, order_date, discount_amount)
VALUES
(1, 101, '2026-01-05', 100),
(2, 102, '2026-01-15', 200),
(3, 103, '2026-02-10', 150),
(4, 104, '2026-02-18', 300),
(5, 105, '2026-03-08', 250),
(6, 106, '2026-03-20', 400);

select * from orders

--Find the total discount given in each month.


SELECT 
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(discount_amount) AS total_discount
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY order_year, order_month;