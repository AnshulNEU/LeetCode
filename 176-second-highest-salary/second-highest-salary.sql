# Write your MySQL query statement below


Select max(salary) as SecondHighestSalary
From employee
where salary < (Select max(salary) from employee)

