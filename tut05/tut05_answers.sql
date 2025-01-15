-- General Instructions
-- 1.	The .sql files are run automatically, so please ensure that there are no syntax errors in the file. If we are unable to run your file, you get an automatic reduction to 0 marks.
-- Comment in MYSQL 

-- PRAKHAR SHUKLA
-- Roll Number : 2201CS54

use tut5;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50),
    manager_id INT
   -- FOREIGN KEY (manager_id) REFERENCES employees(emp_id)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

ALTER TABLE departments
ADD CONSTRAINT fk_manager_id
FOREIGN KEY (manager_id)
REFERENCES employees(emp_id);
  
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    budget DECIMAL(10 , 2 ),
    start_date DATE,
    end_date DATE
);



