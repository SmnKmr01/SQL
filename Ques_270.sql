

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE returns (
    return_id INT PRIMARY KEY,
    product_id INT,
    return_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO products (product_id, product_name, price)
VALUES
(1, 'Laptop', 75000),
(2, 'Mouse', 500),
(3, 'Keyboard', 1500),
(4, 'Monitor', 12000),
(5, 'Headphones', 2000);

INSERT INTO returns (return_id, product_id, return_date)
VALUES
(101, 1, '2024-01-10'),
(102, 3, '2024-01-15');



select * from products
select * from returns

--Find products that have never been returned


select p.product_id, p.product_name
from products p
left join returns r
on p.product_id = r.product_id
where return_id is null

