

CREATE TABLE user_orders (
    order_id INT,
    user_id INT,
    user_name VARCHAR(50)
);

CREATE TABLE order_details (
    order_id INT,
    product_name VARCHAR(50),
    status VARCHAR(20)
);


INSERT INTO user_orders VALUES
(1101,1301,'Rahul'),
(1102,1301,'Rahul'),
(1103,1301,'Rahul'),
(1104,1302,'Priya'),
(1105,1302,'Priya'),
(1106,1303,'Amit'),
(1107,1303,'Amit'),
(1108,1304,'Neha'),
(1109,1304,'Neha');

INSERT INTO order_details VALUES
(1101,'Mobile','delivered'),
(1102,'Shoes','cancelled'),
(1103,'Watch','cancelled'),
(1104,'Laptop','delivered'),
(1105,'Mouse','delivered'),
(1106,'Headphones','cancelled'),
(1107,'Charger','delivered'),
(1108,'Tablet','cancelled'),
(1109,'Speaker','cancelled');

select * from user_orders

select * from order_details


--% of Cancelled Orders for each User



with cte as(
select * 
from user_orders u
left join order_details o
on u.order_id = o.order_id
)


select u.user_id, 
u.user_name,
COUNT(*) as Total_orders,
SUM(
	CASE when o.status = 'cancelled' then 1
	else 0 end ) as cancelled_orders,
ROUND(100.0 * SUM(CASE WHEN o.status = 'cancelled' THEN 1 ELSE 0 END)  / COUNT(*),2) AS cancelled_percentage
from user_orders u
left join order_details o
on u.order_id = o.order_id
group by u.user_id, u.user_name