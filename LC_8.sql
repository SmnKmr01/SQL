--Customer placing the largest number of orders
drop table orders
create table orders
(order_number int primary key not null,
customer_number int)

insert into orders (order_number, customer_number)
VALUES(1, 1),
(2, 2),
(3, 3),
(4, 3)

SELECT * from orders

with cte as(
select top 1 customer_number, count(order_number) as NumOrd
from orders
group by customer_number
order by NumOrd desc
)
select top 1 customer_number
from cte


with cte as(
select top 1 customer_number, count(order_number) as NumOrd
from orders
group by customer_number
order by NumOrd desc
)
select customer_number
from cte
where NumOrd = (SELECT MAX(NumOrd) from cte)