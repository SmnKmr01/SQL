CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    discontinued BIT
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    sale_date DATE,
    quantity INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


INSERT INTO products (product_id, product_name, discontinued) VALUES
(1, 'Laptop', 0),
(2, 'Mouse', 1),
(3, 'Keyboard', 0),
(4, 'Monitor', 1),
(5, 'Printer', 1);

INSERT INTO sales (sale_id, product_id, sale_date, quantity) VALUES
(101, 1, '2024-01-10', 5),
(102, 2, '2024-01-15', 10),
(103, 3, '2024-02-01', 3),
(104, 4, '2024-02-10', 7),
(105, 2, '2024-03-05', 4),
(106, 1, '2024-03-08', 6);

select * from products
select * from sales

-- Find products that have been discontinued but still have sales.

select 
p.product_id

from products p
join sales s
on p.product_id = s.product_id
where p.discontinued = 1
