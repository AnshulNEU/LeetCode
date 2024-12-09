# Write your MySQL query statement below


Select user_id, count(follower_id) followers_count
From Followers 
Group BY user_id
Order by user_id asc;
