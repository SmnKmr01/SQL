--Write a SQL query to  report the name and bonus amount of each employee with a bonus less than 1000

drop table EMployee
create table Employee(
empId int Primary key NOT NULL,
name varchar(50),
supervisor int,
salary int)

create table Bonus(
empId int,
bonus int)



insert into Employee(empId, name, supervisor, salary)
values(3, 'Brad', null, 4000),
(1, 'John', 3, 1000),
(2, 'Dan', 3, 2000),
(4, 'Thomas', 3, 4000)

insert into Bonus (empId, bonus)
values(2, 500),
(4, 2000)

select * from Employee
select * from Bonus


select e.name, b.bonus
from employee e
left join bonus b
on e.empId = b.empId
where b.bonus < 1000 or b.bonus is null

