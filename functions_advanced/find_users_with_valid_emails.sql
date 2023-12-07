select *
from Users
where 1
and mail regexp '^[a-zA-Z0-9_.-]+@leetcode\\.com$'
and left(mail, 1) regexp '^[a-zA-Z]'