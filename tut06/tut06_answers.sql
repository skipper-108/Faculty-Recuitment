-- General Instructions
-- 1.	The .sql files are run automatically, so please ensure that there are no syntax errors in the file. If we are unable to run your file, you get an automatic reduction to 0 marks.
-- Comment in MYSQL 

-- PRAKHAR SHUKLA
-- Roll Number : 2201CS54

use tut6;


-- 1)
select s.first_name, s.last_name, c.course_name
from students s
join enrollments e on s.student_id=e.student_id
join courses c on c.course_id=e.course_id;

-- 2)
select c.course_name, e.grade
from courses c
join enrollments e on c.course_id=e.course_id;

-- 3)
select s.first_name as student_first_name, s.last_name as student_last_name, c.course_name, i.first_name as instructor_first_name, i.last_name as instructor_last_name
from students s
join enrollments e on e.student_id=s.student_id
join courses c on c.course_id=e.course_id
join instructors i on c.instructor_id=i.instructor_id;

-- 4)
select s.first_name, s.last_name, s.age, s.city
from students s
join enrollments e on s.student_id=e.student_id
join courses c on c.course_id=e.course_id
where c.course_name="Mathematics";

-- 5)
select c.course_name, i.first_name as instructor_first_name, i.last_name as instructor_last_name
from courses c
join instructors i on i.instructor_id=c.instructor_id;

-- 6)
select s.first_name, s.last_name, e.grade, c.course_name
from students s
join enrollments e on s.student_id=e.student_id
join courses c on c.course_id=e.course_id;

-- 7)
select s.first_name, s.last_name, s.age
from students s
join (
    select student_id
    from enrollments
    group by student_id
    having COUNT(course_id) > 1
) e on s.student_id = e.student_id;

-- 8)
select c.course_name, count(s.student_id)
from courses c
join enrollments e on e.course_id=c.course_id
join students s on s.student_id=e.student_id
group by c.course_name;

-- 9)
select s.first_name, s.last_name, s.age
from students s
left join enrollments e on s.student_id = e.student_id
where e.student_id is null;

-- 10)
-- select c.course_name, avg(e.grade)
-- from courses c
-- join enrollments e on e.course_id=c.course_id
-- join students s on s.student_id=e.student_id
-- group by c.course_name;

-- 11)
select s.first_name, s.last_name, c.course_name
from students s
join enrollments e on s.student_id=e.student_id
join courses c on c.course_id=e.course_id
where e.grade in ("A", "A+", "B+", "A-");

-- 12)
select c.course_name, i.first_name, i.last_name
from courses c
join instructors i on i.instructor_id=c.instructor_id
where i.last_name like ('S%');

-- 13)
select s.first_name, s.last_name, s.age
from students s
join enrollments e on e.student_id=s.student_id
join courses c on c.course_id=e.course_id
join instructors i on i.instructor_id=c.instructor_id
where i.first_name="Dr. Akhil";

-- 14)
select c.course_name, MAX(e.grade) as max_grade
from courses c
join enrollments e on c.course_id = e.course_id
group by c.course_name;

-- 15)
select s.first_name, s.last_name, s.age, c.course_name
from students s
join enrollments e on e.student_id=s.student_id
join courses c on c.course_id=e.course_id
order by c.course_name;
