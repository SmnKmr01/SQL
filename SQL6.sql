CREATE TABLE Quaterly_sales (
    Year INT,
    QuarterName VARCHAR(2),
    Sales INT
);

INSERT INTO Quaterly_sales (Year, QuarterName, Sales) VALUES (2018, 'Q1', 5000);
INSERT INTO Quaterly_sales (Year, QuarterName, Sales) VALUES (2018, 'Q2', 5500);
INSERT INTO Quaterly_sales (Year, QuarterName, Sales) VALUES (2018, 'Q3', 2500);
INSERT INTO Quaterly_sales (Year, QuarterName, Sales) VALUES (2018, 'Q4', 10000);
INSERT INTO Quaterly_sales (Year, QuarterName, Sales) VALUES (2019, 'Q1', 10000);
INSERT INTO Quaterly_sales (Year, QuarterName, Sales) VALUES (2019, 'Q2', 5500);
INSERT INTO Quaterly_sales (Year, QuarterName, Sales) VALUES (2019, 'Q3', 3000);
INSERT INTO Quaterly_sales (Year, QuarterName, Sales) VALUES (2019, 'Q4', 6000);

select * from Quaterly_sales

SELECT 
Year,
QuarterName as Quarter,
Sales as CurrentSales,
LAG(Sales,2) OVER (Partition by Year Order by QuarterName) as Previous_Qtr_sales
from Quaterly_sales


SELECT 
Year,
QuarterName as Quarter,
Sales as CurrentSales,
Lead(Sales,2) OVER (Partition by Year Order by QuarterName) as Previous_Qtr_sales
from Quaterly_sales