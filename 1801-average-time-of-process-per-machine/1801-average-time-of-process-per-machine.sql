# Write your MySQL query statement below

With start as
(select machine_id, process_id, a.timestamp from activity a
    where activity_type='start'),

ending as (select machine_id, process_id, b.timestamp from activity b
    where activity_type='end')

select s.machine_id, Round(sum(e.timestamp-s.timestamp)/count(s.process_id),3) as processing_time
from start s join ending e on s.machine_id=e.machine_id and s.process_id=e.process_id
group by machine_id