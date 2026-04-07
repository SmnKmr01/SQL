

CREATE TABLE orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT,
    order_date DATETIME,
    order_amount DECIMAL(10,2)
);

INSERT INTO orders (customer_id, order_date, order_amount)
VALUES
(1, DATEADD(DAY,-1,GETDATE()), 1200),
(2, DATEADD(DAY,-1,GETDATE()), 900),
(3, DATEADD(DAY,-2,GETDATE()), 1500),
(4, DATEADD(DAY,-2,GETDATE()), 2000),
(5, DATEADD(DAY,-3,GETDATE()), 700),
(6, DATEADD(DAY,-4,GETDATE()), 1100),
(7, DATEADD(DAY,-5,GETDATE()), 950),
(8, DATEADD(DAY,-6,GETDATE()), 400),
(9, DATEADD(DAY,-7,GETDATE()), 1300),
(10, DATEADD(DAY,-8,GETDATE()), 1700); -- outside 7 days


select * from orders

--Find the total number of orders placed each day in the last week


select  CAST(order_date as date) as order_day,    COUNT(*) as orders_count
from orders
where order_date > DATEADD(DAY, -7, cast(GETDATE() as date))
group by CAST(order_date as date)