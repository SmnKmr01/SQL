--Show all of the days of the month (1-31) and how many admission_dates occurred on that day. 
--Sort by the day with most admissions to least admissions.

select DAY(admission_date) as day_number, count(*) as number_of_admissions
from  admissions 
group by DAY(admission_date)
order by number_of_admissions desc