


create table players_location
(
name varchar(20),
city varchar(20)
);
delete from players_location;
insert into players_location
values ('Sachin','Mumbai'),('Virat','Delhi') , ('Rahul','Bangalore'),('Rohit','Mumbai'),('Mayank','Bangalore');

select * from players_location

select
Max(case when city = 'Bangalore' then name end) as Banglore
,Max(case when city = 'Mumbai' then name end) as Mumbai
,Max(case when city = 'Delhi' then name end) as Delhi
from 
(select *,
ROW_NUMBER() over(partition by city order by name asc) as player_groups
from players_location) A
group by player_groups
order by player_groups