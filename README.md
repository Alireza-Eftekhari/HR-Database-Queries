# HR-Database-Queries
Human Resource Data Base Management
The query to display the attributes of employees’ first and last name, date of hire and salary as well as the name of their position, and salary ranges for each employee. Showing difference between each employee’s current salary and the base (minimum) salary for their job.

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

