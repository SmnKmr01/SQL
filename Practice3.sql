--Find the missing employee IDS(Gaps in sequence)

select t1.id + 1 AS missing_id
from employees t1
left join employee t2 on t1.id + 1 = t2.id
where t2.id IS NULL

--Employees with Duplicate names

select EmpName, count(*) as cnt
from employees
group by EmpName
having count(*) > 1

--Remove duplcate records(keep One)

with cte as (
	select *,
		ROW_NUMBER() over(partition by empname, Email order by Empid) as rn
	from employees
) 
delete from cte
where rn > 1


--Find Employees without department

select e.*
from employees e
left join Departments d
on e.DeptID = d.DeptID
where d.DeptID IS NULL

--Find Department-wise Highest Salary
select DeptID , max(salary) as highest_sal
from employees
Group by DeptID

--Employees with Salary Above Department Average
