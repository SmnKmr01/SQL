drop table orders

CREATE TABLE orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT,
    order_channel VARCHAR(20),   -- Online / InStore
    order_date DATE,
    order_amount DECIMAL(10,2)
);


 INSERT INTO orders (customer_id, order_channel, order_date, order_amount)
VALUES
(1, 'Online', '2026-01-05', 1200),
(1, 'InStore', '2026-01-10', 800),
(2, 'Online', '2026-02-12', 1500),
(2, 'Online', '2026-03-01', 500),
(3, 'InStore', '2026-02-20', 700),
(3, 'Online', '2026-02-25', 1100),
(4, 'InStore', '2026-03-10', 900),
(5, 'Online', '2026-03-15', 1300),
(5, 'InStore', '2026-03-20', 1400),
(6, 'Online', '2026-04-01', 600);


select * from orders


--Find customers with orders in both online and instore channels.



select customer_id
from orders
group by customer_id
having COUNT(distinct order_channel) > 1