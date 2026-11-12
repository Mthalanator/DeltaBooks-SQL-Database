-- Request 1
SELECT last_name, first_name, employee_id 
FROM employees 
WHERE last_name LIKE 'T%';

-- Request 2
SELECT department_id, last_name, first_name, phone_number 
FROM employees 
WHERE job_id = 'SA_REP' AND hire_date >= '2000-01-01' 
ORDER BY last_name ASC;

-- Request 3
SELECT * FROM jobs 
WHERE min_salary <= 10000 
ORDER BY min_salary DESC;

-- Request 4
SELECT DISTINCT j.job_id, j.job_title, d.department_name 
FROM jobs j 
INNER JOIN employees e ON j.job_id = e.job_id 
INNER JOIN departments d ON e.department_id = d.department_id 
WHERE d.department_name IN ('Marketing', 'Accounting');

-- Request 5
SELECT d.department_name, d.location_id, e.last_name, e.salary 
FROM employees e 
INNER JOIN departments d ON e.department_id = d.department_id 
WHERE d.location_id = 1700 
ORDER BY d.department_name ASC;

-- Request 6
SELECT last_name, first_name, hire_date 
FROM employees 
WHERE MONTH(hire_date) IN (6, 8) 
ORDER BY last_name ASC;

-- Request 7
SELECT ROUND(AVG(salary * 12), 2) AS avg_annual_salary 
FROM employees;

-- Request 8
SELECT ROUND(SUM(salary), 0) AS total_monthly_salary 
FROM employees 
WHERE department_id IN (60, 80);

-- Request 9
SELECT d.department_id, d.department_name, COUNT(e.employee_id) AS employee_count 
FROM departments d 
INNER JOIN employees e ON d.department_id = e.department_id 
GROUP BY d.department_id, d.department_name 
HAVING COUNT(e.employee_id) < 4;

-- Request 10
SELECT TOP 1 WITH TIES d.department_id, d.department_name, COUNT(e.employee_id) AS employee_count 
FROM departments d 
INNER JOIN employees e ON d.department_id = e.department_id 
GROUP BY d.department_id, d.department_name 
ORDER BY employee_count ASC;

-- Request 11
SELECT department_id, department_name 
FROM departments 
WHERE department_id NOT IN (
    SELECT DISTINCT department_id FROM employees WHERE job_id = 'SA_REP' AND department_id IS NOT NULL
);

-- Request 12
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) 
VALUES ('IT_ASST', 'IT Assistant', 5000, 8000);

-- Request 13
UPDATE jobs 
SET min_salary = min_salary + 5000;

-- Request 14
SELECT * FROM jobs 
ORDER BY job_id ASC;

-- Request 15
-- Corrected Entity-Relationship Diagram (ERD inserted as image)

-- Request 16
SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'departments';

-- Request 17
DROP TABLE job_history;

-- Request 18
CREATE TABLE SAL_HISTORY (
    EMPID INT NOT NULL,
    FIRSTNAME VARCHAR(20),
    LASTNAME VARCHAR(25) NOT NULL,
    HIREDATE DATE NOT NULL,
    SAL DECIMAL(8, 2)
);

-- Request 19
INSERT INTO SAL_HISTORY (EMPID, FIRSTNAME, LASTNAME, HIREDATE, SAL) 
SELECT employee_id, first_name, last_name, hire_date, salary 
FROM employees 
WHERE employee_id <= 100;

-- Request 20
SELECT * FROM SAL_HISTORY;