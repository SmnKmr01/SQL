--dynamic way to create insert statement from table data

create table emp2(
emp_id integer,
emp_name varchar(20),
salary integer,
dob date
);

select * from emp2
delete emp2
insert into emp2 values(1,'Ankit',10000,'1983-12-02');
insert into emp2 values(2,'Mohit',15000,'1974-12-02');
insert into emp2 values(3,'Vikas',10000,'1985-12-02');
insert into emp2 values(4,'Rohit',5000,'2006-12-02');
insert into emp2 values(5,'Mudit',12000,'1967-12-02');

select concat('insert into emp2 values(',emp_id,',',char(39),emp_name,char(39),',',salary,',',char(39),dob,char(39),');')from emp2