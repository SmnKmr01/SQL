CREATE TABLE shipments (
    shipment_id INT PRIMARY KEY,
    order_date DATE,
    delivery_date DATE,
    shipping_method VARCHAR(50)
);


INSERT INTO shipments (shipment_id, order_date, delivery_date, shipping_method) VALUES
(1, '2024-01-01', '2024-01-05', 'Standard'),
(2, '2024-01-02', '2024-01-04', 'Express'),
(3, '2024-01-03', '2024-01-08', 'Standard'),
(4, '2024-01-05', '2024-01-06', 'Express'),
(5, '2024-01-07', '2024-01-12', 'Economy'),
(6, '2024-01-08', '2024-01-15', 'Economy'),
(7, '2024-01-09', '2024-01-11', 'Express');


select * from shipments


--Find the average delivery time by shipping method.


select shipping_method,
CAST(AVG(DATEDIFF(day,order_date,delivery_date)) AS VARCHAR(10))+ 'days' as Average_delivery_time
from Shipments
group by shipping_method