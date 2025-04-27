Create table product_dim(
Product_key INT identity(1,1) primary key,
product_id int,
Product_Name VARCHAR(50),
Price DECIMAL(9,2),
start_date date,
end_date date 
)

drop table product_dim

CREATE TABLE product_stg(
Product_id INT,
Product_Name VARCHAR(50),
Price DECIMAL(9,2)
)


delete from product_stg
delete from product_dim
INSERT INTO product_stg VALUES(1,'iphone13',40000),(2,'iphone14',70000)
INSERT INTO product_stg VALUES(1,'iphone13',30000),(3,'iphone15',90000)

select * from product_stg
select * from product_dim

declare @today date = '2025-04-24'
insert into product_dim
select Product_id, Product_Name, price, @today,'9999-12-31'
from product_stg
--where product_id not in (select product_id from product_dim)


declare @today date = '2025-04-24'
update product_dim
set end_date = dateadd(day,-1,@today)
from product_stg
where product_stg.Product_id=product_dim.Product_id
and end_date = '9999-12-31'