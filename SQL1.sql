CREATE TABLE Employees (
    EmployeeID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Phone VARCHAR(20),
    Email VARCHAR(100),
    Salary INT
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Phone, Email, Salary) VALUES
(3, 'Natasha', 'Lee', '321888909', 'natasha@demo.com', 30000),
(2, 'Mark', 'Wilis', '245666921', 'mark@demo.com', 85000),
(1, 'Melissa', 'Rhodes', '1893456702', 'melissa@demo.com', 40000),
(5, 'Adam', 'Owens', '444345999', 'adam@demo.com', 60000),
(4, 'Riley', 'Jones', '123345959', 'riley@demo.com', 75000),
(6, 'Nick', 'Adams', '1363456702', 'nick@demo.com', 45000);

select * from Employees

--MAX--
select max(salary) from Employees
where salary <
(select max(salary) from Employees)

--TOP--
select top 1 * from
(select top 2 * from employees
order by salary desc) sal_order
order by salary

--Dense_rank--

with Salary_CTE as
(select * ,
DENSE_RANK() over (order by Salary desc) as Sal_order from Employees) 
select * from Salary_CTE
where Sal_order=3
