--unique birth year of patients

SELECT distinct year(birth_date) FROM patients
order by year(birth_date)

--Show unique first names from the patients table which only occurs once in the list.

 SELECT first_name, count(*) FROM patients
group by first_name
having count(*) = 1

--Show patient_id and first_name from patients where their first_name start and ends with 's'
--and is at least 6 characters long.

select patient_id, first_name from patients
where len(first_name) >= 6
and LOWER(first_name) like 's%s'

select p.patient_id, p.first_name, p.last_name from patients p
inner join admissions a
on p.patient_id = a.patient_id
where a.diagnosis = 'Dementia'