
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    sale_date DATE
);

CREATE TABLE product_reviews (
    review_id INT PRIMARY KEY,
    product_id INT,
    review_text VARCHAR(255)
);

INSERT INTO products VALUES
(1, 'Laptop'),
(2, 'Mobile'),
(3, 'Tablet'),
(4, 'Headphones'),
(5, 'Smartwatch');

INSERT INTO sales VALUES
(101, 1, '2023-01-10'),
(102, 2, '2023-02-15'),
(103, 3, '2023-03-20'),
(104, 4, '2023-04-05');

INSERT INTO product_reviews VALUES
(201, 1, 'Good product'),
(202, 3, 'Average quality');


select * from products
select * from sales
select * from product_reviews

--Find products that have been ordered but never reviewed.

SELECT p.product_id
FROM products p
LEFT JOIN product_reviews pr 
       ON p.product_id = pr.product_id
JOIN sales s 
       ON p.product_id = s.product_id
WHERE pr.review_id IS NULL
GROUP BY p.product_id;