

create table Cinema
(
seat_id int primary key identity(1,1),
free bit  
)

insert into Cinema values (1),(0),(1),(1),(1)

select * from Cinema

select w.seat_id from
(select *, LEAD(free) OVER (Order by seat_id) as Next_seat,
LAG(free) OVER(ORDER BY seat_id) as prev_seat
FROM Cinema) w
where w.free = 1 AND w.Next_seat = 1 
or w.free = 1 and w.prev_seat = 1
order by w.seat_id