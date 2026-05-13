

-- Create Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    region VARCHAR(50)
);

-- Create Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert Data into Customers
INSERT INTO customers (customer_id, customer_name, region)
VALUES
(1, 'Amit', 'North'),
(2, 'Ravi', 'North'),
(3, 'Priya', 'North'),
(4, 'Sneha', 'South'),
(5, 'Karan', 'South'),
(6, 'Neha', 'South'),
(7, 'John', 'East'),
(8, 'David', 'East'),
(9, 'Sara', 'East'),
(10, 'Ali', 'West'),
(11, 'Rahul', 'West'),
(12, 'Anita', 'West');

-- Insert Data into Orders
INSERT INTO orders (order_id, customer_id, amount, order_date)
VALUES
-- North Region
(101, 1, 5000, '2026-01-10'),
(102, 1, 3000, '2026-01-15'),
(103, 2, 7000, '2026-01-20'),
(104, 2, 2000, '2026-01-22'),
(105, 3, 4000, '2026-01-25'),

-- South Region
(106, 4, 8000, '2026-02-01'),
(107, 4, 1000, '2026-02-03'),
(108, 5, 6000, '2026-02-05'),
(109, 6, 3000, '2026-02-06'),
(110, 6, 2000, '2026-02-07'),

-- East Region
(111, 7, 9000, '2026-03-01'),
(112, 8, 4000, '2026-03-02'),
(113, 8, 2500, '2026-03-03'),
(114, 9, 3500, '2026-03-04'),

-- West Region
(115, 10, 10000, '2026-04-01'),
(116, 11, 5000, '2026-04-02'),
(117, 11, 1500, '2026-04-03'),
(118, 12, 7000, '2026-04-04');

select * from customers
select * from orders

--Find the top 3 customers by total order amount in each region.

SELECT region,
       customer_id,
       total_amount
FROM (
    SELECT 
        c.region,
        o.customer_id,
        SUM(o.amount) AS total_amount,
        ROW_NUMBER() OVER (
            PARTITION BY c.region
            ORDER BY SUM(o.amount) DESC
        ) AS rn
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.region, o.customer_id
) sub
WHERE rn <= 3
ORDER BY region, total_amount DESC