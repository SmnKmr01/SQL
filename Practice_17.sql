CREATE TABLE Employee (
    EmpID INT,
    EmpName VARCHAR(50),
    DeptID INT,
    Salary INT
);


INSERT INTO Employee VALUES
(1,'Amit',101,60000),
(2,'Ravi',101,75000),
(3,'Neha',101,75000),
(4,'John',102,90000),
(5,'Sara',102,80000),
(6,'Mike',102,70000),
(7,'Anu',103,65000);


select * from Employee

--2nd highest salary

with cte as(
select *,
DENSE_RANK() over (partition by DeptID order by Salary desc) as rnk
from EMployee)
select DeptID, Salary from cte
where rnk = 2

--Find Employees Earning More than Department Average

select * from Employee e
where salary > ( select AVG(salary) from Employee where DeptID = e.DeptID)

--Remove Duplicate Records
CREATE TABLE Orders (
    OrderID INT,
    CustomerID INT,
    OrderDate DATE,
    Amount INT
);

INSERT INTO Orders VALUES
(1,101,'2024-01-01',500),
(2,101,'2024-01-01',500),
(3,102,'2024-01-02',700),
(4,102,'2024-01-02',700);

select * from orders


with cte as (
select *,
ROW_NUMBER() over (partition by CustomerID, OrderDate, Amount order by OrderID) as dup
from orders)
delete from cte 
where dup > 1


--Running Total

select *,
SUM(Amount) over(Order by saleDate) as runningTotal
from sales

--Find Missing Numbers in Sequence
CREATE TABLE Numbers (Num INT);

INSERT INTO Numbers VALUES
(1),(2),(4),(7),(8);

select * from Numbers

with seq as(
select 1 n
UNION ALL
select n+1 From seq where n < 8
)
select n from seq
where n not in (select num from Numbers)


--Top 3 Customers by Total Purchase

CREATE TABLE CustomerOrders (
CustomerID INT,
Amount INT
);

INSERT INTO CustomerOrders VALUES
(101,500),
(101,300),
(102,700),
(103,900),
(104,200),
(103,100);


select * from CustomerOrders

select top 3 customerID,
SUM(Amount) as TotalPurchase
From CustomerOrders
Group BY CustomerID
Order By TotalPurchase DESC


--Find Employees Who Joined in Last 6 Months

CREATE TABLE Employees (
EmpID INT,
JoinDate DATE
);

INSERT INTO Employees VALUES
(1,'2025-10-01'),
(2,'2025-12-15'),
(3,'2024-05-01');

select * from Employees

select * from employees
where JoinDate <= DATEADD(MONTH,-6, GETDATE())

