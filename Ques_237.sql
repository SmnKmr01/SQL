

CREATE TABLE order_items (
    id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT,
    product_id INT
);

INSERT INTO order_items (order_id, product_id) VALUES
-- Order 1
(1, 101),
(1, 102),
(1, 103),

-- Order 2
(2, 101),
(2, 102),

-- Order 3
(3, 101),
(3, 103),

-- Order 4
(4, 102),
(4, 103),

-- Order 5
(5, 101),
(5, 102),
(5, 103);

select * from order_items

--Find the most common product combinations in orders (pairs)



WITH order_pairs AS (
    SELECT 
        o1.order_id,
        o1.product_id AS product1,
        o2.product_id AS product2
    FROM order_items o1
    JOIN order_items o2 
        ON o1.order_id = o2.order_id
       AND o1.product_id < o2.product_id
)
SELECT TOP 10
    product1,
    product2,
    COUNT(*) AS pair_count
FROM order_pairs
GROUP BY product1, product2
ORDER BY pair_count DESC;