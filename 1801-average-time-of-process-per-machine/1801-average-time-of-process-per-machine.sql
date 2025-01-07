# Write your MySQL query statement below


With str as (
    select machine_id, process_id, activity_type, b.timestamp
    from activity b where activity_type='start'
),

en as ( select machine_id, process_id, activity_type, a.timestamp
    from activity a where activity_type='end' )

select e.machine_id, Round(sum(e.timestamp-s.timestamp)/(count(e.process_id)),3) as processing_time
from str s join en e
on s.machine_id = e.machine_id and s.process_id=e.process_id
group by e.machine_id