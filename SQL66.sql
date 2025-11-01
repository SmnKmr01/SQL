--Show the total amount of male patients and the total amount of female patients in the patients table.
--Display the two results in the same row.

select 
	SUM(CASE when gender = 'M' then 1 else 0 End) as male_count,
    SUM(CASE when gender = 'F' then 1 else 0 End) as female_count
from patients
        
