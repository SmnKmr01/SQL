

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    region VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, customer_name, region) VALUES
(1, 'Rahul', 'East'),
(2, 'Amit', 'East'),
(3, 'Priya', 'West'),
(4, 'Neha', 'West'),
(5, 'John', 'North'),
(6, 'Sara', 'North');

INSERT INTO orders (order_id, customer_id, order_date, amount) VALUES
(101, 1, '2024-01-01', 500),
(102, 1, '2024-01-02', 300),
(103, 1, '2024-01-05', 700),

(104, 2, '2024-01-03', 400),
(105, 2, '2024-01-06', 200),

(106, 3, '2024-01-02', 900),
(107, 3, '2024-01-04', 100),
(108, 3, '2024-01-05', 200),
(109, 3, '2024-01-07', 300),

(110, 4, '2024-01-02', 150),

(111, 5, '2024-01-01', 600),
(112, 5, '2024-01-03', 700),

(113, 6, '2024-01-02', 800),
(114, 6, '2024-01-03', 900),
(115, 6, '2024-01-04', 1000);

--Find customers with the highest order count in each region

select * from Customers
select * from Orders

with cust_order_count as(
select 
c.region, o.customer_id, 
count(*) as order_count,
ROW_NUMBER() over (partition by c.region order by count(*) desc) as rn
from customers c
join orders o
on c.customer_id = o.customer_id
GROUP BY c.region, o.customer_id
)

SELECT region, customer_id, order_count
FROM cust_order_count
WHERE rn = 1;