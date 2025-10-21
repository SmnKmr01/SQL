--Show all allergies ordered by popularity. Remove NULL values from query.

select allergies, count(*) as popularity from patients
where allergies is not NULL
group by allergies
order by popularity desc