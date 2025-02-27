--difference between count(*), count(1), count(0), count(-1), count(col), count(distinct col)
select * from emp

select count(*), count(1), count(0), count(-1),
count('ankit'),
count(distinct dep_name)
from emp