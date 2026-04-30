

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, customer_name, country) VALUES
(1, 'Suman', 'India'),
(2, 'Rahul', 'India'),
(3, 'John', 'USA'),
(4, 'Emma', 'USA'),
(5, 'Liam', 'UK');

INSERT INTO sales (sale_id, customer_id, product_id, order_date) VALUES
(101, 1, 1001, '2024-01-10'),
(102, 2, 1001, '2024-01-12'),
(103, 3, 1002, '2024-01-15'),
(104, 4, 1002, '2024-01-18'),
(105, 5, 1003, '2024-01-20'),
(106, 1, 1004, '2024-01-22'),
(107, 3, 1004, '2024-01-25');



select * from customers
select * from sales

--Find products ordered only by customers from one country.  



SELECT product_id
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY product_id
HAVING COUNT(DISTINCT c.country) = 1;