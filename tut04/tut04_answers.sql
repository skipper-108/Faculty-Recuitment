-- General Instructions
-- 1.	The .sql files are run automatically, so please ensure that there are no syntax errors in the file. If we are unable to run your file, you get an automatic reduction to 0 marks.
-- Comment in MYSQL 



-- PRAKHAR SHUKLA
-- Roll Number : 2201CS54

use tut4;

-- 1)
select first_name, last_name
from employees;

-- 2)
select department_name, location
from departments;

-- 3)
select project_name, budget
from projects;

-- 4)
select e.first_name, e.last_name, e.salary
from employees e
left join departments ds on ds.department_id=e.department_id
where ds.department_name="Engineering";

-- 5)
select project_name, start_date
from projects;

-- 6)
select e.first_name, e.last_name, d.department_name
from employees e
left join departments d on e.department_id=d.department_id;

-- 7)
select project_name, budget
from projects
where budget>90000;

-- 8)
select sum(budget) as total_budget
from projects;

-- 9)
select first_name, last_name, salary
from employees
where salary>60000;

-- 10)
select project_name, end_date
from projects;

-- 11)
select department_name
from departments
where location="New Delhi";

-- 12)
select avg(salary) as avg_salary
from employees;

-- 13)
select e.first_name, e.last_name, d.department_name
from employees e
join departments d on e.department_id=d.department_id
where d.department_name="Finance";

-- 14)
select project_name
from projects
where budget between 70000 and 100000;

-- 15)
select d.department_name, count(e.emp_id) as employee_count
from employees e
join departments d on e.department_id=d.department_id
group by d.department_id;
