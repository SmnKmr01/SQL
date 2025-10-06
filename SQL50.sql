--Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by first_name then by last_name.

select first_name,last_name,allergies from patients
where allergies IN ('Penicillin', 'Morphine')
order by allergies, first_name, last_name