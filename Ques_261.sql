
CREATE TABLE productss (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category_id INT
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT
);

INSERT INTO productss (product_id, product_name, category_id) VALUES
(1, 'Laptop', 1),
(2, 'Mouse', 1),
(3, 'Shirt', 2),
(4, 'Jeans', 2),
(5, 'Apple', 3),
(6, 'Banana', 3);

INSERT INTO sales (sale_id, customer_id, product_id) VALUES
-- Customer 101 → ordered from ALL categories (1,2,3) ✅
(1, 101, 1),
(2, 101, 3),
(3, 101, 5),

-- Customer 102 → only category 1 ❌
(4, 102, 1),
(5, 102, 2),

-- Customer 103 → categories 1 & 2 ❌
(6, 103, 1),
(7, 103, 3),

-- Customer 104 → ALL categories (with duplicates) ✅
(8, 104, 2),
(9, 104, 4),
(10, 104, 6),
(11, 104, 1);


select * from products 
select * from sales

---Find customers who ordered products from all categories.


select s.customer_id
from sales s
left join productss p
on s.product_id = p.product_id
group by s.customer_id
HAVING COUNT(DISTINCT p.category_id) = (
    SELECT COUNT(DISTINCT category_id) FROM productss)