
CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);

INSERT INTO orders VALUES
(1, 101, '2025-05-10', 500),
(2, 102, '2025-06-15', 700),
(3, 101, '2025-08-20', 300),
(4, 103, '2024-02-10', 900),
(5, 104, '2025-11-05', 1200),
(6, 105, '2025-12-01', 1500),
(7, 102, '2026-01-10', 400),
(8, 103, '2026-02-12', 800),
(9, 104, '2026-03-18', 600),
(10,106, '2025-04-01', 950);

select * from orders

--Find the top 5 customers by total order value in the last year


select distinct Top(5) customer_id,
sum(amount) as total_order_value
from orders
where order_date >= DATEADD(year,-1, getdate())
group by customer_id 
order by total_order_value desc

