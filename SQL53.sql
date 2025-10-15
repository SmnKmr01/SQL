--Show the city and the total number of patients in the city.
--Order from most to least patients and then by city name ascending.


select city, count(*) as No_of_patients
from patients
group by city
order by No_of_patients desc,city