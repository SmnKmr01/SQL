--Display every patient that has at least one admission and show their most recent admission along with the patient and doctor's full name.

select patient_name,
	admission_date,
    doctor_name
from(

	select concat(p.first_name, ' ', p.last_name) as patient_name,
		admission_date,
		concat(d.first_name, ' ', d.last_name) as doctor_name,
		row_Number() over (partition by p.patient_id order by admission_date desc ) as rn
	from patients p 
    join admissions a 
    	on p.patient_id = a.patient_id
    join doctors d 
    	on a.attending_doctor_id = d.doctor_id
 ) t
 
where rn = 1

--or--

SELECT 
    p.first_name || ' ' || p.last_name AS patient_name,
    a.admission_date,
    d.first_name || ' ' || d.last_name AS doctor_name
FROM patients p
JOIN admissions a ON p.patient_id = a.patient_id
JOIN doctors d ON a.attending_doctor_id = d.doctor_id
WHERE a.admission_date = (
    SELECT MAX(a2.admission_date)
    FROM admissions a2
    WHERE a2.patient_id = p.patient_id
);