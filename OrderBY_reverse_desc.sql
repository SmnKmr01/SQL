
DROP TABLE IF EXISTS Productss;

CREATE TABLE Productss (
    ProductID INT PRIMARY KEY,
    Product VARCHAR(255),
    Category VARCHAR(100)
);

INSERT INTO Productss (ProductID, Product, Category)
VALUES
    (1, 'Laptop', 'Electronics'),
    (2, 'Smartphone', 'Electronics'),
    (3, 'Tablet', 'Electronics'),
    (4, 'Headphones', 'Accessories'),
    (5, 'Smartwatch', 'Accessories'),
    (6, 'Keyboard', 'Accessories'),
    (7, 'Mouse', 'Accessories'),
    (8, 'Monitor', 'Accessories'),
    (9, 'Printer', 'Electronics');


select * from productss order by category, product



with cte as (
select *, 
ROW_NUMBER() over(partition by Category order by ProductID) as RN1,
ROW_NUMBER() over(partition by Category order by ProductID desc) as RN2
from Productss)
SELECT a.product,a.Category, b.productID
from cte as a 
inner join cte as b
on a.Category=b.Category
and a.RN1=b.RN2
