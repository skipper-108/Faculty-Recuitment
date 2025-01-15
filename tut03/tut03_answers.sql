-- General Instructions
-- 1.	The .sql files are run automatically, so please ensure that there are no syntax errors in the file. If we are unable to run your file, you get an automatic reduction to 0 marks.
-- Comment in MYSQL 



-- PRAKHAR SHUKLA
-- Roll Number : 2201CS54

use tut3;

-- 1)
select first_name, last_name
from students;

-- 2)
SELECT course_name, credit_hours
FROM courses;

-- 3)
SELECT first_name, last_name, email
FROM instructors;

-- 4)
select c.course_name, e.grade
from courses c
join enrollments e on c.course_id=e.course_id;

-- 5)
select first_name, last_name, city
from students;

-- 6)
select c.course_name, i.first_name, i.last_name
from courses c
join instructors i on i.instructor_id=c.instructor_id;

-- 7)
SELECT first_name, last_name, age
FROM students;

-- 8)
select c.course_name, e.enrollment_date
from courses c
join enrollments e on c.course_id=e.course_id;

-- 9)
SELECT first_name, last_name, email
FROM instructors;

-- 10)
SELECT course_name, credit_hours
FROM courses;

-- 11)
select i.first_name, i.last_name, i.email
from instructors i
join courses c on c.instructor_id=i.instructor_id
where c.course_name="Mathematics";

-- 12)
select c.course_name, e.grade
from courses c
join enrollments e on c.course_id=e.course_id
where e.grade="A";

-- 13)
select s.first_name, s.last_name, s.state
from students s
where s.student_id=(
	select e.student_id
    from enrollments e
    join courses c on e.course_id=c.course_id
    where c.course_name="Computer Science"
);

-- 14)
select c.course_name, e.enrollment_date
from courses c
join enrollments e on c.course_id=e.course_id
where e.grade="B+";

-- 15)
select i.first_name, i.last_name, i.email
from instructors i
join courses c on c.instructor_id=i.instructor_id
where c.credit_hours>3;
