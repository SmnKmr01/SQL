--implementing scd(slowly changing dimensions) type 1 and scd 2 using SQL
--ELT(Extract Transform Load)

CREATE TABLE product_stg(
Product_id INT,
Product_Name VARCHAR(50),
Price DECIMAL(9,2)
)

CREATE TABLE product_dim(
Product_id INT primary key,
Product_Name VARCHAR(50),
Price DECIMAL(9,2),
last_update date
)
Create table product_dim(
Product_id INT identity(1,1) primary key,
Product_Name VARCHAR(50),
Price DECIMAL(9,2),
start_date date,
end_date date 
)
delete from product_stg
delete from product_dim
INSERT INTO product_stg VALUES(1,'iphone13',40000),(2,'iphone14',70000)
INSERT INTO product_stg VALUES(1,'iphone13',30000),(3,'iphone15',90000)

INSERT INTO product_stg VALUES(1,'iphone14',40000),(4,'iphone16',95000)

select * from product_stg
select * from product_dim

declare @today date = '2025-04-23'
insert into product_dim
select Product_id, Product_Name, price, @today
from product_stg
where product_id not in (select product_id from product_dim)


declare @today date = '2025-04-23'
update product_dim
set price = product_stg.price,last_update = @today
from product_stg
where product_stg.Product_id=product_dim.Product_id