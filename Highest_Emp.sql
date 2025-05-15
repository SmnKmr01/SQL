

create table dep 
( dep_id int,
 dep_name varchar(20)
 )
 insert into  dep values (1,'it')
  insert into  dep values (2,'hr')
   insert into  dep values (3,'payroll')


    create table emp 
   ( empid int,
    empname varchar(20),
    dep_id int,
   )



insert into emp values(1,'Mark',1)
insert into emp values(2,'John',1)
insert into emp values(3,'Mike',2)
insert into emp values(4,'Mary',1)
insert into emp values(5,'Stacy',3)


select * from emp
select * from dep


select top 1 count(e.empname) as cnt, d.dep_name
from emp e
left join dep d
on e.dep_id = d.dep_id
group by dep_name 
order by cnt desc

--or 

select top 1 dep_name
from emp e
left join dep d
on e.dep_id = d.dep_id
group by dep_name 
order by count(*) desc