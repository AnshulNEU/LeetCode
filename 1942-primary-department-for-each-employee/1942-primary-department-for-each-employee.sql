# Write your MySQL query statement below


select 
    employee_id, department_id
From Employee e
    where primary_flag = 'Y'

Union all

select 
    employee_id, department_id
From employee e
group by 
    employee_id
having 
    count(department_id)=1