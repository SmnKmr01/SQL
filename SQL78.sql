--Each admission costs $50 for patients without insurance, and $10 for patients with insurance. All patients with an even patient_id have insurance.

--Give each patient a 'Yes' if they have insurance, and a 'No' if they don't have insurance. Add up the admission_total cost for each has_insurance group.

select	case 
			when patient_id % 2 == 0 Then 'Yes' else 'No' end as  has_insurance,
        case 
			when patient_id % 2 == 0 Then 10 * count(*) else 50 * count(*) end as  has_insurance
from admissions
group by has_insurance