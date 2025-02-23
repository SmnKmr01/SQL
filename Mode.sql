---calculate mode(most repeating numbers) using sql

create table mode 
(
id int
);

insert into mode values (1),(2),(2),(3),(3),(3),(3),(4),(5);

select * from mode

with freq_cte as(
select id,count(*) as freq from mode 
group by id)
select * from freq_cte
where freq = (select max(freq) from freq_cte)

--method 2

with freq_cte as(
select id, count(*) as freq from mode group by id)
, rnk_cte as (
select * , rank() over(order by freq desc) as rn
from freq_cte)
select * from rnk_cte where rn=1