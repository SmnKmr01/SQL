'ABCDEF'

select * from Employees
select LEFT('ABCDEF', 3)

select RIGHT('ABCDEF', 3)

select CHARINDEX('@','sara@aaa.com',1)
select SUBSTRING('sara@aaa.com',CHARINDEX('@','sara@aaa.com')+1,len('sara@aaa.com') - CHARINDEX('@','sara@aaa.com'))
select len('sara@aaa.com') - CHARINDEX('@','sara@aaa.com')
EmailDomain Total
aaa.com		4
bbb.com		3
ccc.com		3

select SUBSTRING(Email, CHARINDEX('@', Email)+1,(LEN(Email) - CHARINDEX('@', Email))) as EmailDomain,
count(Email) as Total
from Employees
Group by SUBSTRING(Email, CHARINDEX('@', Email)+1,(LEN(Email) - CHARINDEX('@', Email)))