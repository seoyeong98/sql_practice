select name, bonus
from
    (select Employee.name as name, Bonus.bonus as bonus
    from Employee
    left join Bonus on Employee.empId = Bonus.empId) as bonus_amt
where bonus < 1000 or bonus is null