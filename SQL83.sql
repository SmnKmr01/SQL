--Sort the province names in ascending order in such a way that the province 'Ontario' is always on top.



with cte as (
select province_name
, CASE when province_name = 'Ontario' then 0 else 1 END as sort_flag
from province_names )
select province_name from cte
order by sort_flag, province_name 


--OR--

select province_name from province_names
order by CASE when province_name = 'Ontario' then 0 else 1 END, province_name