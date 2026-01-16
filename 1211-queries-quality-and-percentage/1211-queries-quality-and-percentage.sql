# Write your MySQL query statement below
with t1 as (
    select query_name, count(rating) as c
    from Queries
    where rating<3
    group by 1
),
t2 as (
    select query_name, count(rating) as c
    from Queries
    group by 1
)
select q.query_name, round(avg(rating/position), 2) as quality,
    round(ifnull(t1.c/t2.c*100, 0), 2) as poor_query_percentage
from Queries q, t2 left join t1 on t2.query_name=t1.query_name
where q.query_name=t2.query_name
group by 1;