# Write your MySQL query statement below


select r.contest_id, Round(count(r.user_id)/(select count(user_id) from users),4)*100 as percentage
from users u join register r
on u.user_id = r.user_id
group by r.contest_id
order by percentage desc, r.contest_id asc