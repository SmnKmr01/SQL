CREATE TABLE EmployeeDetails (
    Name VARCHAR(50),
    Value VARCHAR(50),
    ID INT
);

INSERT INTO EmployeeDetails (Name, Value, ID) VALUES
('Name', 'Adam', 1),
('Gender', 'Male', 1),
('Salary', '50000', 1);

select * from EmployeeDetails

select ID,
Max(case
	when Name = 'Name' then Value Else ' 'End) as Name,
Max(Case when Name = 'Gender' then Value Else ' 'End) as Gender,
Max(case when Name = 'Salary' then Value Else ' 'End) as Salary
from EmployeeDetails
group by ID