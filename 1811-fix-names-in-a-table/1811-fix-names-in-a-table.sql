# Write your MySQL query statement below


Select user_id,
        Concat(upper(substring(name,1,1)),lower(Substring(name,2))) name
from Users
order by user_id
