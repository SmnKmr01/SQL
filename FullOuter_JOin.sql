--Full outer join in depth and alternatives
create table product_master 
(
product_id int,
product_name varchar(100)
);

insert into product_master values(100,'iphone5'),(200,'hp laptop'),(300,'dell laptop');

create table orders_usa
(
order_id int,
product_id int,
sales int
);
create table orders_europe
(
order_id int,
product_id int,
sales int
);

create table orders_india
(
order_id int,
product_id int,
sales int
);
--delete from orders_india
insert into orders_usa values (1,100,500);
insert into orders_usa values (7,100,500);
insert into orders_europe values (2,200,600);
insert into orders_india values (3,100,500);
insert into orders_india values (4,200,600);
insert into orders_india values (8,100,500);

select * from orders_usa
select * from orders_europe
select * from orders_india

select coalesce(u.product_id, e.product_id,i.product_id) as product_id
, u.sales as usa_sales, e.sales as europe_sales, i.sales as india_sales
from (select product_id, sum(sales) as sales from orders_usa group by product_id) u
full outer join (select product_id, sum(sales) as sales from orders_europe group by product_id) e on u.product_id = e.product_id
full outer join (select product_id, sum(sales) as sales from orders_india group by product_id) i on coalesce(u.product_id, e.product_id)=i.product_id

--alternatives


select pm.product_id
, u.sales as usa_sales, e.sales as europe_sales, i.sales as india_sales
from product_master pm
left join (select product_id, sum(sales) as sales from orders_usa group by product_id) u on pm.product_id = u.product_id
left join  (select product_id, sum(sales) as sales from orders_europe group by product_id) e on u.product_id = e.product_id
left join  (select product_id, sum(sales) as sales from orders_india group by product_id) i on u.product_id=i.product_id
where not(u.sales is null and e.sales is null and i.sales is null)

with cte as(
select product_id, sales as usa_sales, null as europe_sales, null as india_sales from orders_usa
union all 
select product_id, null as usa_sales, sales as europe_sales, null as india_sales from orders_europe
union all
select product_id, null as usa_sales, null as europe_sales, sales as india_sales from orders_india
)
select product_id, sum(usa_sales) as usa_sales, sum(europe_sales) as europe_sales, sum(india_sales) as india_sales
from cte 
group by product_id