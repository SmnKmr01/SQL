--Display a single row with max_visits, min_visits, average_visits where the maximum, minimum and average number of admissions per day is calculated. Average is rounded to 2 decimal places.

with cte as(
select admission_date, count(*) as no_of_visits
from admissions
group by admission_date
order by no_of_visits
  )
 select max(no_of_visits) as max_visits, min(no_of_visits) as min_Visits, ROUND(avg(no_of_visits),2) as average_visits
 from cte