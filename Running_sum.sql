--problem with running sum

select * from Product

create table product(
Product_id int,
cost int,
);

insert into product
values (1, 200), (2, 300),  (3, 300), (4, 500), (5, 800);

select * ,
sum(cost) over(order by cost asc) as running_cost
from product

select *,
sum(cost) over(order by cost asc, product_id) as running_cost
from product

select *,
sum(cost) over(order by cost asc rows between unbounded preceding and current row) as running_cost
from product