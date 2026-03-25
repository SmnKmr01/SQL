--Find Customers with No Orders

CREATE TABLE Customers (
CustomerID INT,
Name VARCHAR(50)
);

INSERT INTO Customers VALUES
(101,'A'),
(102,'B'),
(103,'C');

CREATE TABLE Orders2 (
OrderID INT,
CustomerID INT
);

INSERT INTO Orders2 VALUES
(1,101),
(2,102);

select * from Customers
select * from Orders2

select  c.customerID 
from Customers c
left join Orders2 o
on c.CustomerID = o.CustomerID
where o.CustomerID is null

--Nth Highest Salary (Dynamic)

select * from employee

with cte as(
select *,
DENSE_RANK() over (order by Salary desc) as rnk
from EMployee)
select DeptID, Salary from cte
where rnk = 4

--

select distinct salary from employee e1
where 4 = 
( select count(distinct salary)
from Employee e2 
where e2.salary >= e1.salary)
