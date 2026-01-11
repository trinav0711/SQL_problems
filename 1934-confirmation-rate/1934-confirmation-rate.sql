# Write your MySQL query statement below
with e as (
    select Signups.user_id as u, count(Confirmations.time_stamp) as c
    from Signups left join Confirmations on Signups.user_id=Confirmations.user_id
    group by 1
),
e1 as (
    select Signups.user_id as u, count(Confirmations.time_stamp) as c
    from Signups left join Confirmations on Signups.user_id=Confirmations.user_id
    where Confirmations.action='confirmed'
    group by 1
)
select e.u as user_id, coalesce(round(e1.c/e.c, 2), 0) as confirmation_rate
from e left join e1 on e.u=e1.u
group by 1;