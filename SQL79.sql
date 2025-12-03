
--Show the provinces that has more patients identified as 'M' than 'F'. Must only show full province_name



select province_name from (
select pr.province_name, gender, count(*) AS no_of_patients,
	SUM(case when p.gender = 'M' Then 1 else 0 end) as Gen_M,
    SUM(case when p.gender = 'F' Then 1 else 0 END )as Gen_F
from patients p 
join province_names pr on p.province_id = pr.province_id
group by pr.province_name
Having Gen_M > Gen_F)