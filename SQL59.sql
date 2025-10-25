--Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'

select MAX(weight) - min(weight) as weight_delta from patients
where last_name = 'Maroni'
order by weight