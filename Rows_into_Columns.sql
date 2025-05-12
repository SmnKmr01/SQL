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


select Country, City1, City2, City3
from
(
	select Country, City,
	'City' + CAST(ROW_NUMBER() over (Partition by Country order by Country) as varchar(10)) as columnsequence
	from Countries
)Temp
PIVOT
(
	MAX(City)
	for Columnsequence in (City1, City2, City3)
)PIV