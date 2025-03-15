--Write a sql to find business day between create date and resolved date by ecluding weekends and public holidays

--2022-08-01 -> Monday, -- 2022-08-03 -> Wednesday 
--2022-08-01 -> Monday, --2022-08-12 -> Friday
--2022-08-01 -> Monday, --2022-08-16 -> Tuesday

create table tickets
(
ticket_id varchar(10),
create_date date,
resolved_date date
);
delete from tickets;
insert into tickets values
(1,'2022-08-01','2022-08-03')
,(2,'2022-08-01','2022-08-12')
,(3,'2022-08-01','2022-08-16');
create table holidays
(
holiday_date date
,reason varchar(100)
);
delete from holidays;
insert into holidays values
('2022-08-11','Rakhi'),('2022-08-15','Independence day');

select * from tickets
select * from holidays

select *
,datediff(day,create_date, resolved_date) as actual_days
,DATEDIFF(day, create_date, resolved_date) - 2*DATEDIFF(week, create_date, resolved_date) -no_of_holidays as business_days
from
(
select ticket_id, create_date,resolved_date,count(holiday_date) as no_of_holidays
from tickets
left join holidays on holiday_date between create_date and resolved_date
group by ticket_id, create_date,resolved_date) A

select* from holidays