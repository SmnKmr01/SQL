---SQL Interview problem

--1,2 -> common
--4 is mismatch
--3-new in source
--5-new in target

create table source(id int, name varchar(5))

create table target(id int, name varchar(5))

insert into source values(1,'A'),(2,'B'),(3,'C'),(4,'D')

insert into target values(1,'A'),(2,'B'),(4,'X'),(5,'F');

select * from source
select * from target

select coalesce(s.id,t.id) as id, 
case when s.name is null then 'New in target' 
	when t.name is null then 'New in source'
	else 'mismatch' end as comment
from source s
full join target t on s.id = t.id
where s.name != t.name or s.name is null or t.name is null


with cte as(
select *, 'source' as table_name from source
union all 
select *, 'target' as table_name from target
)
select id --,count(*) as cnt, min(name) as name_min, max(name) as name_max, min(table_name), as table_name_min, max(table_name_max)
,case when min(name)!=max(name) then 'mismatch' when min(table_name) = 'source' then 'new in source' else 'new in target' end as comment
from cte group by id
having count(*) =1 or (count(*) =2 and min(name)!=max(name))