

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE
);

CREATE TABLE shipments (
    shipment_id INT PRIMARY KEY,
    order_id INT,
    shipment_date DATE,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO orders (order_id, customer_id, order_date)
VALUES
(1, 101, '2024-01-10'),
(2, 102, '2024-01-12'),
(3, 103, '2024-01-15'),
(4, 101, '2024-02-01'),
(5, 104, '2024-02-05');

INSERT INTO shipments (shipment_id, order_id, shipment_date)
VALUES
(201, 1, '2024-01-11'),
(202, 3, '2024-01-16');


--Find customers with orders but no shipments.

select * from orders
select * from shipments



select customer_id
from orders o
left join shipments s
on o.order_id  =s.order_id
where s.shipment_id is null