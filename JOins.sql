---interview questions : no of records with different kinds of joins when there are deplicate key value

insert into t1 values(null);
insert into t2 values(null);



select * from t1 
select * from t2

select * from t1
inner join t2 on t1.id1 = t2.id2

select * from t1
left join t2 on t1.id1 = t2.id2

select * from t1
right join t2 on t1.id1 = t2.id2

select * from t1
full outer join t2 on t1.id1 = t2.id2