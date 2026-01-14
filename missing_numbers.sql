--Write a sql query to find missing number

create table numbers(id int)

insert into numbers values(1)
insert into numbers values(2)
insert into numbers values(4)
insert into numbers values(5)
insert into numbers values(7)
insert into numbers values(8)
insert into numbers values(11)
insert into numbers values(13)


select * from numbers


with r_cte as(
select 1 as missing_number
union all
select missing_number + 1 as missing_number
from r_cte where missing_number < 13
)
select * from r_cte where missing_number not in
(select id from numbers)