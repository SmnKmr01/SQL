CREATE TABLE Customers (id int PRIMARY KEY, name varchar(10));
CREATE TABLE Orders (id int PRIMARY KEY, customerID int);

INSERT INTO Customers (id,name) VALUES (1,'Joe'),(2,'Henry'),(3,'Sam'),(4,'Max')
INSERT INTO Orders (id,customerID) VALUES  (1,3),(2,1);


select * from Customers
select * from Orders


select c.name as customers
from Customers c
left JOIN Orders o
on c.id = o.customerid
where o.id IS NULL

select c.name as customers
from customers c
where c.id not in 
(select c.id 
from Customers c
 inner join Orders o
 on c.id = o.customerID)