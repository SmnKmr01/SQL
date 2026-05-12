
-- Create Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT
);

-- Create Sales Table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    sale_date DATE
);

-- Insert Data into Products Table
INSERT INTO products (product_id, product_name, category_id) VALUES
(101, 'Laptop', 1),
(102, 'Mouse', 1),
(103, 'Keyboard', 1),
(104, 'Monitor', 2),
(105, 'Printer', 2);

-- Insert Data into Sales Table
INSERT INTO sales (sale_id, customer_id, product_id, sale_date) VALUES
(1, 1001, 101, '2026-01-10'),
(2, 1001, 102, '2026-01-11'),
(3, 1001, 103, '2026-01-12'),

(4, 1002, 101, '2026-01-15'),
(5, 1002, 102, '2026-01-16'),

(6, 1003, 101, '2026-01-17'),
(7, 1003, 102, '2026-01-18'),
(8, 1003, 103, '2026-01-19'),

(9, 1004, 104, '2026-01-20'),
(10, 1004, 105, '2026-01-21');

select * from products
select * from sales

--Find customers who ordered all products from a specific category.


WITH category_products AS (
    SELECT product_id
    FROM products
    WHERE category_id = 1
),
customer_products AS (
    SELECT customer_id, product_id
    FROM sales
    WHERE product_id IN (
        SELECT product_id 
        FROM category_products
    )
    GROUP BY customer_id, product_id
)
SELECT customer_id
FROM customer_products
GROUP BY customer_id
HAVING COUNT(DISTINCT product_id) = (
    SELECT COUNT(*) 
    FROM category_products
)