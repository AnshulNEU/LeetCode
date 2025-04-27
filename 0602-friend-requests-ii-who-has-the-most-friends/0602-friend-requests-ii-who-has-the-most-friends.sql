# Write your MySQL query statement below 

With cte as
(select accepter_id, count(accepter_id) as num from RequestAccepted
group by accepter_id

union all

select requester_id, count(requester_id) as num from RequestAccepted
    group by requester_id)

select accepter_id as id, sum(num) as num from cte c 
group by accepter_id 
order by num desc
limit 1


