--SQL Query to find most frequently purchased items together


CREATE TABLE CustOrders (

  Orderid INTEGER NULL,

  Customerid INTEGER NULL,

  Productid Varchar(40) NULL

);

Insert into CustOrders VALUES (111, 1, 'AAA');

Insert into CustOrders VALUES (111, 1,'BBB');

Insert into CustOrders VALUES (2222, 2,'CCC');

Insert into CustOrders VALUES (2222, 2,'AAA');

Insert into CustOrders VALUES (2222, 2,'DDD');

Insert into CustOrders VALUES (3333, 3,'BBB');

Insert into CustOrders VALUES (3333, 3,'AAA');

Insert into CustOrders VALUES (3333, 3,'HHH');

Insert into CustOrders VALUES (4444, 4,'AAA');

Insert into CustOrders VALUES (4444, 4,'BBB');

Insert into CustOrders VALUES (4444, 4,'CCC');

Select * from CustOrders

Select Top 2 O1.ProductID, O2.ProductID,
Count(*) as PurchaseFrequency
From CustOrders O1
INNER JOIN CustOrders O2
ON O1.Customerid = O2.Customerid
AND O1.Orderid = O2.Orderid
AND O1.Productid = O2.Productid
Group By O1.Productid, O2.Productid
Order By PurchaseFrequency DESc
