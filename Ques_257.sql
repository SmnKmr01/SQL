

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount INT
);

INSERT INTO orders (order_id, customer_id, order_date, amount) VALUES
-- Customer 1 → Only Jan
(1, 101, '2024-01-05', 200),
(2, 101, '2024-01-20', 150),

-- Customer 2 → Jan & Feb ❌
(3, 102, '2024-01-10', 300),
(4, 102, '2024-02-15', 400),

-- Customer 3 → Only March
(5, 103, '2024-03-12', 500),

-- Customer 4 → Feb & March ❌
(6, 104, '2024-02-01', 250),
(7, 104, '2024-03-05', 350);


select * from orders

--Find customers who made purchases only in one month of the year.




SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING COUNT(DISTINCT 
       DATEFROMPARTS(YEAR(order_date), MONTH(order_date), 1)
) = 1