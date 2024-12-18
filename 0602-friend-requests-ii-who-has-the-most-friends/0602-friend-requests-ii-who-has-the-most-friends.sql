# Write your MySQL query statement below
Select person as id, count(person) as num from
(Select requester_id person from RequestAccepted
union all
Select accepter_id person from RequestAccepted) a
group by person
order by count(person) desc
limit 1;


