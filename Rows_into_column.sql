-- Transform Rows into Column


Create Table Countries
(
 Country nvarchar(50),
 City nvarchar(50)
)
GO

Insert into Countries values ('USA','New York')
Insert into Countries values ('USA','Houston')
Insert into Countries values ('USA','Dallas') 

Insert into Countries values ('India','Hyderabad')
Insert into Countries values ('India','Bangalore')
Insert into Countries values ('India','New Delhi')

Insert into Countries values ('UK','London')
Insert into Countries values ('UK','Birmingham')
Insert into Countries values ('UK','Manchester')

select * from Countries

Select Country, City1, City2, City3 
From
(
	Select Country, City,
		'City' + CAST(ROW_NUMBER() over  (Partition by Country order by country) as varchar(10)) as columnSequence
	From Countries
)Temp
PIVOT
(
	MAX(City)
	For ColumnSequence in (City1, City2, CIty3)
) PIV