--Write a SQL query to print the student details who scored > 60% in each subject
--and overall > 70% marks
--Note: Maximun possible marks per subject is 50

CREATE TABLE StudentMarks (
    StudentName VARCHAR(10),
    Subject     VARCHAR(20),
    Marks       INT
);

-- Insert data
INSERT INTO StudentMarks (StudentName, Subject, Marks) VALUES
('A1','Maths',31),
('A1','Physics',39),
('A1','Chemistry',28),

('B1','Maths',32),
('B1','Physics',34),
('B1','Chemistry',29),

('C1','Maths',31),
('C1','Physics',36),
('C1','Chemistry',32),

('D1','Maths',35),
('D1','Physics',38),
('D1','Chemistry',33);

select *  from StudentMarks


with cte as(
select *, (Marks/50.0)*100 as avg_marks from StudentMarks
), cte1 as(
select *, count(*) over(partition by StudentName order by StudentName) as count from cte
where avg_marks > 60)
select StudentName, (sum(Marks)/150.0) from cte1 where count > 2
group by StudentName
