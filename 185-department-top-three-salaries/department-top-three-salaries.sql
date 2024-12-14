# Write your MySQL query statement below

With temp as(
    Select name,
    salary,
    departmentid,
    Dense_Rank() over (partition by departmentid order by salary desc) as top_salary
    from employee
)

select d.name as department, t.name Employee, t.Salary as Salary
from temp t
join department d on d.id=t.departmentid
where top_salary <=3


