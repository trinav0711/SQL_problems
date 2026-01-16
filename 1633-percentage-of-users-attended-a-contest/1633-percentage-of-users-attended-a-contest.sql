# Write your MySQL query statement below
with tmp as(
    select count(user_id) as c from Users
)
select contest_id, round(count(user_id)/tmp.c*100, 2) as percentage
from tmp, Register natural join Users
group by 1
order by 2 desc, 1 asc