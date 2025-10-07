--Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.

select p.patient_id, a.diagnosis, count(*) as no_od _admissions from patients p 
inner join admissions a 
on p.patient_id = a.patient_id
group by p.patient_id, a.diagnosis
Having count(*) > 1