-- Count the total number of distinct conversations on whatsapp
-- Two users share a conversation if at least 1 message exists between them
-- Multiple messages between the same pair of users are considered a single conversation


select count(*) as distinct_conversations
from 
(select message_sender_id, message_receiver_id from whatsapp_messages
UNION
select message_receiver_id, message_sender_id from whatsapp_messages) a
where message_sender_id < message_receiver_id

-- Write a sql query to find the employees who earns more than their managers
select e1.name as employee
from employee e1 join employee e2
on e1.managerid = e2.id
where e1.salary > e2.salary