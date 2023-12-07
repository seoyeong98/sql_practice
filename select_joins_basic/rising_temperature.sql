select id
from 
    (select current.id as id, 
        current.temperature as current_temp,
        prev_info.temperature as prev_temp
    from
        (select id, 
        date_sub(recordDate, interval 1 day) as prev_date, 
        temperature
        from Weather) as current
    left join Weather as prev_info 
    on current.prev_date = prev_info.recordDate) as compared
where 1
and prev_temp is not null
and current_temp > prev_temp