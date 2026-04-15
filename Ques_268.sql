

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    segment VARCHAR(50)   -- e.g., Retail, Corporate, Wholesale
);

CREATE TABLE orderss (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, customer_name, segment)
VALUES
(1, 'Amit', 'Retail'),
(2, 'Neha', 'Retail'),
(3, 'Raj', 'Corporate'),
(4, 'Priya', 'Corporate'),
(5, 'Karan', 'Wholesale');

INSERT INTO orderss (order_id, customer_id, amount, order_date)
VALUES
(101, 1, 2000, '2024-01-10'),
(102, 1, 1500, '2024-01-12'),
(103, 2, 3000, '2024-01-15'),

(104, 3, 10000, '2024-02-01'),
(105, 3, 7000, '2024-02-05'),
(106, 4, 8000, '2024-02-07'),

(107, 5, 25000, '2024-03-01'),
(108, 5, 30000, '2024-03-10');


select * from customers
select * from orderss

--Find the average order value per customer segment.


select c.segment,
round(avg(amount), 2) as avg_order
from customers c
left join orderss o
on c.customer_id = o.customer_id
group by c.segment

