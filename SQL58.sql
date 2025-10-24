--Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.

select pr.province_id, SUm(p.height) as sum_height
from patients p 
inner join province_names pr 
on p.province_id = pr.province_id
group by p.province_id
having sum_height >= 7000

--or-

select province_id, SUM(height) as sum_height
from patients p
group by province_id
Having sum(height) >= 7000