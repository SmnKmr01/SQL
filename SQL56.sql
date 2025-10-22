--Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date.

select	first_name, last_name, birth_date
from patients
where birth_date like '197%'
order by birth_date

--OR--
select	first_name, last_name, birth_date
from patients
where YEAR(birth_date) >= 1970 AND YEAR(birth_date) <1980 
order by birth_date