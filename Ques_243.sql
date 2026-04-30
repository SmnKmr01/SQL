


CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT
);


INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES
(1, 101, 1001, 5),
(2, 101, 1002, 7),

(3, 102, 1003, 3),  -- less than 5 (should be excluded)
(4, 102, 1004, 6),

(5, 103, 1005, 8),
(6, 103, 1006, 9),

(7, 104, 1007, 5),
(8, 104, 1008, 4);  -- less than 5 (should be excluded)

select * from order_items

--Find customers with orders where no product quantity is less than 5.

SELECT order_id
FROM order_items
GROUP BY order_id
HAVING MIN(quantity) >= 5;
