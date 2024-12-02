# Write your MySQL query statement below


select s.user_id, 
    Coalesce(Round(Sum(case when c.action = 'confirmed' then 1 else 0 end)/count(c.action),2),0) as confirmation_rate
from Signups S left join Confirmations C
on S.user_id = C.user_id
group by s.user_id



#no action = 0
#time-out =