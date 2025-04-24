# Write your MySQL query statement below

select a.name from
(select e.id, e.name, count(e.id) as cun
from employee e join employee ep on e.id=ep.managerId
where ep.managerid is not null
group by id) as a
where cun >= 5

