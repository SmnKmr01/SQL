CREATE TABLE orders (
    order_id INT,
    user_id INT,
    order_date DATE
);

INSERT INTO orders (order_id, user_id, order_date) VALUES
(101, 201, '2026-04-05'),
(102, 201, '2026-04-05'),
(103, 202, '2026-04-06'),
(104, 203, '2026-04-07'),
(105, 203, '2026-04-07'),
(106, 204, '2026-04-08');


select * from orders

--users with multiple orders in same day




select user_id, order_date
from orders
group by user_id, order_date
Having count(*) > 1