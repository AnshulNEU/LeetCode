# Write your MySQL query statement below


select user_id, name, mail
from users 
where mail Regexp '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode\\.com$'

