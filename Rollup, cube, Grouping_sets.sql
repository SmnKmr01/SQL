Create table orders_
(
    Id int primary key identity,
    Continent nvarchar(50),
    Country nvarchar(50),
    City nvarchar(50),
    amount int
);
Insert into orders_ values('Asia','India','Bangalore',1000)
Insert into orders_ values('Asia','India','Chennai',2000)
Insert into orders_ values('Asia','Japan','Tokyo',4000)
Insert into orders_ values('Asia','Japan','Hiroshima',5000)
Insert into orders_ values('Europe','United Kingdom','London',1000)
Insert into orders_ values('Europe','United Kingdom','Manchester',2000)
Insert into orders_ values('Europe','France','Paris',4000)
Insert into orders_ values('Europe','France','Cannes',5000)

select * from orders_

--beyond group by -> rollup, cubes, grouping set

select Continent, Country, City, sum(amount) as total_amount
from orders_
group by Continent, Country, City
union all
select Continent,null Country,null City, sum(amount) as total_amount
from orders_
group by Continent, Country, City
union all
select Continent, Country,null City, sum(amount) as total_amount
from orders_
group by Continent, Country, City
union all
select null Continent,null Country,null City, sum(amount) as total_amount
from orders_
group by Continent, Country, City

--Rollup

select  Continent, Country, City, sum(amount) as total_amount
from orders_
group by rollup(Continent, Country, City)

--Cube
select  Continent, Country, City, sum(amount) as total_amount
from orders_
group by cube(Continent, Country, City)

--grouping sets
select  Continent, Country, City, sum(amount) as total_amount
from orders_
group by grouping sets((Continent, Country), (City), (Continent, City))