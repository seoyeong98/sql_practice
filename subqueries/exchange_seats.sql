select converted.id as id,
    ifnull(Seat.student, original.student) as student
from
    (select 
        id,
        case when mod(id, 2) = 1 then id+1
            else id-1
        end as counter_id
    from Seat) as converted
left join Seat on Seat.id = converted.counter_id
right join Seat as original on original.id = converted.id