-- General Instructions
-- 1.	The .sql files are run automatically, so please ensure that there are no syntax errors in the file. If we are unable to run your file, you get an automatic reduction to 0 marks.
-- Comment in MYSQL 

-- PRAKHAR SHUKLA
-- Roll Number : 2201CS54

use tut7;

---1.
DELIMITER //
CREATE PROCEDURE CalculateAverageSalary(IN department_id_param INT, OUT avg_salary DECIMAL)
BEGIN
    SELECT AVG(salary) INTO avg_salary
    FROM employees
    WHERE department_id = department_id_param;
END //
DELIMITER ;


---2.
DELIMITER //
CREATE PROCEDURE UpdateSalaryByPercentage(IN emp_id_param INT, IN percentage DECIMAL)
BEGIN
    UPDATE employees
    SET salary = salary * (1 + percentage / 100)
    WHERE emp_id = emp_id_param;
END //
DELIMITER ;


---3.
DELIMITER //
CREATE PROCEDURE ListEmployeesInDepartment(IN department_id_param INT)
BEGIN
    SELECT *
    FROM employees
    WHERE department_id = department_id_param;
END //
DELIMITER ;


---4.
DELIMITER //
CREATE PROCEDURE CalculateTotalBudget(IN project_id_param INT, OUT total_budget DECIMAL)
BEGIN
    SELECT budget INTO total_budget
    FROM projects
    WHERE project_id = project_id_param;
END //
DELIMITER ;

---5.
DELIMITER //
CREATE PROCEDURE FindEmployeeWithHighestSalary(IN department_id_param INT, OUT emp_id_result INT, OUT max_salary DECIMAL)
BEGIN
    SELECT emp_id, MAX(salary) INTO emp_id_result, max_salary
    FROM employees
    WHERE department_id = department_id_param;
END //
DELIMITER ;

---6.
DELIMITER //
CREATE PROCEDURE ListProjectsEndingSoon(IN num_days INT)
BEGIN
    SELECT *
    FROM projects
    WHERE end_date <= CURDATE() + INTERVAL num_days DAY;
END //
DELIMITER ;

---7.
DELIMITER //
CREATE PROCEDURE CalculateTotalSalaryExpenditure(IN department_id_param INT, OUT total_salary DECIMAL)
BEGIN
    SELECT SUM(salary) INTO total_salary
    FROM employees
    WHERE department_id = department_id_param;
END //
DELIMITER ;

---8.
DELIMITER //
CREATE PROCEDURE GenerateEmployeeReport()
BEGIN
    SELECT e.emp_id, e.first_name, e.last_name, d.department_name, e.salary
    FROM employees e
    JOIN departments d ON e.department_id = d.department_id;
END //
DELIMITER ;

---9.
DELIMITER //
CREATE PROCEDURE FindProjectWithHighestBudget(OUT project_id_result INT, OUT max_budget DECIMAL)
BEGIN
    SELECT project_id, MAX(budget) INTO project_id_result, max_budget
    FROM projects;
END //
DELIMITER ;

---10.
DELIMITER //
CREATE PROCEDURE CalculateAverageSalaryAcrossDepartments(OUT avg_salary DECIMAL)
BEGIN
    SELECT AVG(salary) INTO avg_salary
    FROM employees;
END //
DELIMITER ;

---11.
DELIMITER //
CREATE PROCEDURE AssignNewManager(IN department_id_param INT, IN new_manager_id INT)
BEGIN
    UPDATE departments
    SET manager_id = new_manager_id
    WHERE department_id = department_id_param;
END //
DELIMITER ;

---12.
DELIMITER //
CREATE PROCEDURE CalculateRemainingBudget(IN project_id_param INT, OUT remaining_budget DECIMAL)
BEGIN
    SELECT budget INTO remaining_budget
    FROM projects
    WHERE project_id = project_id_param;
END //
DELIMITER ;

---13.
DELIMITER //
CREATE PROCEDURE GenerateEmployeeJoinReport(IN join_year INT)
BEGIN
    SELECT *
    FROM employees
    WHERE YEAR(join_date) = join_year;
END //
DELIMITER ;

---14.
DELIMITER //
CREATE PROCEDURE UpdateProjectEndDate(IN project_id_param INT, IN duration_days INT)
BEGIN
    UPDATE projects
    SET end_date = start_date + INTERVAL duration_days DAY
    WHERE project_id = project_id_param;
END //
DELIMITER ;

---15.
DELIMITER //
CREATE PROCEDURE CalculateTotalEmployeesInEachDepartment()
BEGIN
    SELECT d.department_name, COUNT(e.emp_id) AS num_employees
    FROM departments d
    LEFT JOIN employees e ON d.department_id = e.department_id
    GROUP BY d.department_name;
END //
DELIMITER ;
