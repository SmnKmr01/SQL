CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    launch_date DATE
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    product_id INT,
    order_date DATE,
    quantity INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO products (product_id, product_name, launch_date) VALUES
(1, 'Laptop', '2024-01-10'),
(2, 'Mobile', '2024-02-15'),
(3, 'Tablet', '2024-03-01'),
(4, 'Smartwatch', '2024-04-20'),
(5, 'Headphones', '2024-05-05');

INSERT INTO orders (order_id, product_id, order_date, quantity) VALUES
(101, 1, '2024-01-10', 2), -- ordered on launch date
(102, 1, '2024-01-12', 1),
(103, 2, '2024-02-15', 3), -- ordered on launch date
(104, 3, '2024-03-05', 1),
(105, 4, '2024-04-20', 5), -- ordered on launch date
(106, 5, '2024-05-06', 2);


select * from orders
select * from products

--Find products ordered on their launch date.


select p.product_name
from orders o
join products p
on o.product_id = p.product_id
where p.launch_date = CAST(o.order_date AS DATE)