# Write your MySQL query statement below


select s.user_id, 
    coalesce(Round(sum(case when c.action = 'confirmed' then 1 else 0 end)/count(c.action),2),0) confirmation_rate
from signups s left join confirmations c
on s.user_id = c.user_id
group by s.user_id



#no action = 0
#time-out =