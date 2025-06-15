CREATE TABLE Employees (
    EmployeeID INT,
    Name VARCHAR(50)
);


INSERT INTO Employees (EmployeeID, Name)
VALUES
(1, 'Owens, Adam'),
(2, 'Hopkins, David'),
(3, 'Jones, Mary'),
(4, 'Rhodes, Susan');

select * from Employees

select Name,  LEFT(NAME, CHARINDEX(',', Name) -1),
RIght(NAME, LEN(NAME) -  CHARINDEX(',', Name))
from Employees