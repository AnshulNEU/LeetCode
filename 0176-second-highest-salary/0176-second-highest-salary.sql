# Write your MySQL query statement below


select MAX(salary) SecondHighestSalary from employee where salary <
(select MAx(salary) from employee)
