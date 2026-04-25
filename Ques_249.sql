
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- Customers
INSERT INTO customers VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

-- Products (2 categories: 10, 20)
INSERT INTO products VALUES
(101, 'Product A', 10),
(102, 'Product B', 10),
(103, 'Product C', 20),
(104, 'Product D', 20);

-- Sales
INSERT INTO sales VALUES
-- Category 10
(1, 1, 101, 5),
(2, 1, 102, 3),   -- Alice total = 8
(3, 2, 101, 4),
(4, 2, 102, 6),   -- Bob total = 10 (winner)

-- Category 20
(5, 1, 103, 7),
(6, 1, 104, 2),   -- Alice total = 9 (winner)
(7, 3, 103, 5),
(8, 3, 104, 3);   -- Charlie total = 8

select * from products
select * from customers
select * from sales


--Find customers who ordered the most products in each category.


with product_totals as(
select c.customer_id, p.category_id,
sum(s.quantity) as total_quanity,
rank() over (partition by p.category_id order by sum(s.quantity) desc) as rank
from sales s
 left join products p
 on s.product_id = p.product_id
 left join customers c
 on s.customer_id = c.customer_id
 group by c.customer_id,p.category_id
 )
 select customer_id, category_id, total_quanity
 from product_totals
 where rank =1