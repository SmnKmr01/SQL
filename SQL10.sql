CREATE TABLE Employee2 (
    EmployeeID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Phone VARCHAR(20),
    Email VARCHAR(100),
    Address VARCHAR(100)
);


INSERT INTO Employee2 (EmployeeID, FirstName, LastName, Phone, Email, Address)
VALUES 
(1, 'Adam', 'Owens', '444345999', 'adam@demo.com', '108 Main Street'),
(2, 'Mark', 'Wilis', '245666921', 'mark@demo.com', '2002 Ocean And Park Street'),
(3, 'Natasha', 'Lee', '321888909', 'natasha@demo.com', '15 Roosevelt Rd'),
(5, 'Adam', 'Owens', '444345999', 'adam@demo.com', '10 Main Street'),
(4, 'Riley', 'Jones', '123345959', 'riley@demo.com', '909-1500 Victoria Street'),
(6, 'Natasha', 'Lee', '321888909', 'natasha@demo.com', '8754 NewMarket');

select * from Employee2

 select *, Replace(Replace(REPLACE(Address, CHAR(9), ''), char(13), ''), char(10),'') from employee2