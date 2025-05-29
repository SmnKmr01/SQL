CREATE TABLE EmployeeInfo (
    EmpID INT,
    EmpFname VARCHAR(50),
    EmpLname VARCHAR(50),
    Department VARCHAR(50),
    Salary INT
);


INSERT INTO EmployeeInfo (EmpID, EmpFname, EmpLname, Department, Salary) VALUES
(1, 'Karan', 'Mehta', 'HR', 300000),
(2, 'Rohit', 'Sharma', 'Admin', 75000),
(3, 'Ankush', 'Rajput', 'Account', 60000),
(4, 'Priyanshi', 'Sharma', 'HR', 500000),
(5, 'Sanket', 'Gupta', 'Developer', 100000),
(6, 'Shruti', 'Kapoor', 'Admin', 80000),
(2, 'Rohit', 'Sharma', 'Admin', 75000);

select * from EmployeeInfo

 Select * from EmployeeInfo
 order by salary desc
 OFFSET 2 ROWS FETCH NEXT 1 ROWS ONLY