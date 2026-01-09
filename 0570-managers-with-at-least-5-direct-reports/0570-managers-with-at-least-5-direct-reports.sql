# Write your MySQL query statement below
with employees as (select e2.id, e2.name, count(e1.id) as reports
from Employee e1 join Employee e2 on e1.managerId=e2.id
group by 1,2
having reports>=5)
select name from employees;