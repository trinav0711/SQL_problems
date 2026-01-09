# Write your MySQL query statement below
select s.student_id, student_name, t.subject_name, count(e.student_id) as attended_exams
from Students s cross join Subjects t
left outer join Examinations e on
    s.student_id=e.student_id and t.subject_name=e.subject_name
group by 1,2,3
order by 1,3