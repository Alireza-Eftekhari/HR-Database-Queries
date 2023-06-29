-- Q1
--Selecting needed columns
SELECT
EM.first_name AS "First Name",
EM.last_name AS "Last Name",
J.job_title "Job Ttile",
EM.hire_date "Hire Date",
EM.salary AS "Salary",
J.min_salary "Minimum Salary",
J.max_salary "Maximum Salary",
--calculating pay-above-minimum salary for each employee
(EM.salary-J.min_salary) AS "Pay_above_minimum"
--selecting needed table
FROM employees EM
--join another needed (jobs table) table to employees table
JOIN jobs J 
on EM.job_id = J.job_id

;

--Q2
--Selecting needed columns
SELECT EM.first_name AS "First Name",
EM.last_name AS "Last Name",
EM.email "Email",
LOC.street_address AS "Address",
CNT.country_name AS "Country"
--Selecting needed table
FROM employees EM
--joining other tables like departments,locations and countries to employees table
JOIN departments DEPT
ON EM.department_id = DEPT.department_id
JOIN locations LOC
ON loc.location_id = DEPT.location_id
JOIN countries CNT
ON CNT.country_id = LOC.country_id

ORDER BY EM.last_name
;

--Q3
--Selecting needed columns and the number of employees
SELECT CNT.country_name AS "Country",
COUNT(EM.EMPLOYEE_ID) AS "Total_Employees"
--Selecting needed table
FROM employees EM
--joining other tables like departments,locations and countries to employees table
JOIN departments DEPT
ON EM.department_id = DEPT.department_id
JOIN locations LOC
ON loc.location_id = DEPT.location_id
JOIN countries CNT
ON CNT.country_id = LOC.country_id

--Making group and order and to do best parctice
GROUP BY CNT.country_name
ORDER BY CNT.country_name
;


--Q4
--selecting needed columns
SELECT EM.first_name AS "First Name",
EM.last_name AS "Last Name",
EM.salary AS "Salary",
DEPT.department_name AS "Department"
--selecting needed tables
FROM employees EM
-- adding department name from departments table
JOIN departments DEPT 
ON EM.department_id = DEPT.department_id
WHERE EM.salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = EM.department_id)
ORDER BY EM.last_name
;
