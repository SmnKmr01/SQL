

drop table target
create table source(id int, name varchar(5))
create table target(id int, name varchar(5))

insert into source values(1,'A'),(2,'B'),(3,'C'),(4,'D')
insert into target values(1,'A'),(2,'B'),(4,'X'),(5,'F');

select * from source
select * from target


select coalesce(s.id, t.id) as id,
case when t.name is null then 'New In Source'
	when s.name is null then 'New In Target'
	else 'Mismatch' end as 'output'
from source s full join target t on s.id = t.id
where coalesce(s.name, 'x') != coalesce(t.name, 'y')