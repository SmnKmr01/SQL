/* Query to find personID, Name, number of friends, sum of marks
of person who have friends with total score greater than 100. */

--select * from Friend$
--select * from Friend$

with score_details as (
select f.PersonID, sum(p.score) as total_friend_score,count(1) as no_of_friends from Friend$ f
inner join person$ p on f.FriendID=p.PersonID
GROUP by f.PersonID
having sum(p.score) > 100
)
select s.*, p.name as person_name
from Person$ p
inner join score_details s on p.PersonID = s.PersonID
