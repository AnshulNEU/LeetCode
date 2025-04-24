# Write your MySQL query statement below

with cte as (
select *, dense_rank () over (partition by departmentId order by salary desc) as ra  
from employee
)

select d.name as Department, c.name as employee, salary
from cte c join Department d on c.departmentid = d.id
where ra <4
