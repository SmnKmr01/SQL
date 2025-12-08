--For each day display the total amount of admissions on that day. Display the amount changed from the previous date.

with cte as(
select admission_date, count(*) as total_admissions
from admissions
group by admission_date
  )
select admission_date, total_admissions,total_admissions - lag(total_admissions,1) over (order by admission_date) as count_change
from cte