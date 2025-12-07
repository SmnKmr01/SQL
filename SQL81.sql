--Show the percent of patients that have 'M' as their gender. Round the answer to the nearest hundreth number and in percent form.


select concat(ROUND(sum(case when gender = 'M' then 1 else 0 end)*100.0/count(*),2),'%') as total_patient
from patients

--OR--

select ROUND(sum(case when gender = 'M' then 1 else 0 end)*100.0/count(*),2)||'%' as total_patient
from patients