

CREATE TABLE orders (
    id INT
);

INSERT INTO orders (id)
VALUES
(1),
(2),
(4),
(5);

--find missing sequential order IDs

select * from orders

SELECT o1.id + 1 AS missing_id
FROM orders o1
LEFT JOIN orders o2
    ON o1.id + 1 = o2.id
WHERE o2.id IS NULL
AND o1.id < (SELECT MAX(id) FROM orders)