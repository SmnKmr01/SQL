


create table puzzle(id int identity, input varchar(2))

insert into puzzle values('a')
insert into puzzle values('a')
insert into puzzle values('b')
insert into puzzle values('b')
insert into puzzle values('c')
insert into puzzle values('d')
insert into puzzle values('d')
insert into puzzle values('e')


with cte as(
select input, count(1) as cnt
from puzzle group by input
having count(*) > 1)
select input, 'DUP' + cast(rank() over (order by input) as varchar) as output 
from cte