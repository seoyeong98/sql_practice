select categories.category as category, 
    coalesce(calcuated_category.cnt, 0) as accounts_count
from
    (select 'Low Salary' as category
    union select 'Average Salary'
    union select 'High Salary') as categories
left join 
    (select category, count(*) as cnt
    from
    (select
        case when income < 20000 then "Low Salary"
            when income between 20000 and 50000 then "Average Salary"
            else "High Salary"
        end as category
    from Accounts) as categorize
    group by category) as calcuated_category
on categories.category = calcuated_category.category