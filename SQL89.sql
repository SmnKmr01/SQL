--How can you fetch alternate records from a table
--You can fetch alternate records i.e both odd and even row numbers

--to display even numbers, 

select studentId from (
select rowno, studentId from student)
where MOD(rowno, 2) = 0


--to display odd numbers
select studentId from (
select rowno, studentId from student)
where MOD(rowno, 2) = 1


--How to find the employee with second MAX salary

select max(salary) as salary from employees
where salary not in (
select max(salary) as salary from employees)