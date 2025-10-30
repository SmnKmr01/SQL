--For each doctor, display their id, full name, and the first and last admission date they attended.

select
  doctor_id,
  first_name || ' ' || last_name as full_name,
  min(admission_date) as first_admission_date,
  max(admission_date) as last_admission_date
from admissions a
  join doctors ph on a.attending_doctor_id = ph.doctor_id
group by doctor_id;

--or--

select d.doctor_id, concat(d.first_name," ",d.last_name) as full_name, 
MIN(a.admission_date) as first_admission_date, MAX(a.admission_date) as last_admission_date
from doctors d 
inner join admissions a 
on d.doctor_id = a.attending_doctor_id
group by doctor_id