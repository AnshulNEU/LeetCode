# Write your MySQL query statement below


Select 
    E1.reports_to employee_id, E2.name, 
    count(E1.reports_to) reports_count, 
    Round(Sum(E1.age)/count(E1.reports_to)) average_age
From 
    Employees E1
 Join 
    Employees E2
ON E1.reports_to = E2.Employee_id
Group By 
    E1.reports_to
Order By
    E2.employee_id