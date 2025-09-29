--Display every patient's first_name.
--Order the list by the length of each name and then by alphabetically.

select first_name from patients
order by len(first_name) , first_name

--Show the total amount of male patients and the total amount of female patients in the patients table.
--Display the two results in the same row.

select patient_id, gender, count(CASE when gender = 'M' then patient_id else null end) as is_male
,Count(case when gender = 'F' then patient_id else null end) as is_female
from patients