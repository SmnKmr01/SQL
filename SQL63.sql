--Show first_name, last_name, and the total number of admissions attended for each doctor.
--Every admission has been attended by a doctor.


select d.first_name, d.last_name, count(*) as admission_total
from doctors d 
inner join admissions a
on d.doctor_id = a.attending_doctor_id
group by a.attending_doctor_id 
