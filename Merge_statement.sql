--merge stamenent  -> inserts, updates, deleted in a single statement

create table SourceProducts(
ProductID INT,
ProductName VARCHAR(50),
Price DECIMAL(9,2)
)

Create Table TargetProducts(
ProductID Int,
ProductName VARCHAR(50),
Price DECIMAL(9,2))

drop  table SourceProducts

INSERT INTO SourceProducts VALUES(1,'Table',90),(3,'Chair',70)


INSERT INTO TargetProducts VALUES(1,'Table',100),(2,'Desk',180)

select * from SourceProducts;
select *  from TargetProducts;


MERGE TargetProducts AS t
USING SourceProducts AS s
ON t.ProductID = s.ProductID
WHEN MATCHED THEN 
    UPDATE SET 
        t.Price = s.Price, 
        t.ProductName = s.ProductName
when not matched by target then
insert values(s.productid, s.productname, s.price)
when not matched by source then
delete;