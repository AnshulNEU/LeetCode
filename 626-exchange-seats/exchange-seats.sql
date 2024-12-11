# Write your MySQL query statement below



Select id, case when id%2=0 then Lag (Student) over (order by id)
            else coalesce (Lead(student) Over (order by id), student)
            end as student
From Seat
