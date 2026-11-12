-- Create Database
CREATE DATABASE DeltaBooksDB;
GO

USE DeltaBooksDB;
GO

-- Create Locations Table
CREATE TABLE locations (
    location_id INT PRIMARY KEY,
    street_address VARCHAR(40),
    postal_code VARCHAR(12),
    city VARCHAR(30) NOT NULL,
    state_province VARCHAR(25),
    country_id CHAR(2)
);

-- Create Departments Table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(30) NOT NULL,
    manager_id INT NULL,
    location_id INT NULL,
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

-- Create Jobs Table
CREATE TABLE jobs (
    job_id VARCHAR(10) PRIMARY KEY,
    job_title VARCHAR(35) NOT NULL,
    min_salary DECIMAL(8, 2),
    max_salary DECIMAL(8, 2)
);

-- Create Employees Table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(25) NOT NULL,
    email VARCHAR(25) NOT NULL,
    phone_number VARCHAR(20),
    hire_date DATE NOT NULL,
    job_id VARCHAR(10) NOT NULL,
    salary DECIMAL(8, 2),
    commission_pct DECIMAL(2, 2),
    manager_id INT NULL,
    department_id INT NULL,
    FOREIGN KEY (job_id) REFERENCES jobs(job_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Create Job History Table
CREATE TABLE job_history (
    employee_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    job_id VARCHAR(10) NOT NULL,
    department_id INT,
    PRIMARY KEY (employee_id, start_date),
    FOREIGN KEY (job_id) REFERENCES jobs(job_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
GO

-- Populate Locations
INSERT INTO locations VALUES (1400, '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US');
INSERT INTO locations VALUES (1500, '2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US');
INSERT INTO locations VALUES (1700, '2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US');
INSERT INTO locations VALUES (1800, '147 Spadina Ave', 'M5V 2L7', 'Toronto', 'Ontario', 'CA');

-- Populate Departments
INSERT INTO departments VALUES (10, 'Administration', 200, 1700);
INSERT INTO departments VALUES (20, 'Marketing', 201, 1800);
INSERT INTO departments VALUES (60, 'IT', 103, 1400);
INSERT INTO departments VALUES (80, 'Sales', 145, 1700);
INSERT INTO departments VALUES (90, 'Executive', 100, 1700);
INSERT INTO departments VALUES (110, 'Accounting', 205, 1700);

-- Populate Jobs
INSERT INTO jobs VALUES ('AD_PRES', 'President', 20000.00, 40000.00);
INSERT INTO jobs VALUES ('AD_VP', 'Administration Vice President', 15000.00, 30000.00);
INSERT INTO jobs VALUES ('IT_PROG', 'Programmer', 4000.00, 10000.00);
INSERT INTO jobs VALUES ('SA_MAN', 'Sales Manager', 10000.00, 20000.00);
INSERT INTO jobs VALUES ('SA_REP', 'Sales Representative', 6000.00, 12000.00);
INSERT INTO jobs VALUES ('MK_REP', 'Marketing Representative', 4000.00, 9000.00);
INSERT INTO jobs VALUES ('ACCT_MGR', 'Accounting Manager', 8200.00, 16000.00);
INSERT INTO jobs VALUES ('ACCT_PROG', 'Accountant', 4200.00, 9000.00);

-- Populate Employees
INSERT INTO employees VALUES (98, 'John', 'Taylor', 'JTAYLOR', '515.123.4567', '1998-06-15', 'SA_REP', 8000.00, 0.20, 145, 80);
INSERT INTO employees VALUES (99, 'Diana', 'Turner', 'DTURNER', '515.123.4568', '2001-08-20', 'SA_REP', 7500.00, 0.15, 145, 80);
INSERT INTO employees VALUES (100, 'Steven', 'King', 'SKING', '515.123.4569', '1997-06-17', 'AD_PRES', 24000.00, NULL, NULL, 90);
INSERT INTO employees VALUES (101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4570', '2002-09-21', 'AD_VP', 17000.00, NULL, 100, 90);
INSERT INTO employees VALUES (102, 'Lex', 'De Haan', 'LDEHAAN', '515.123.4571', '2001-01-13', 'AD_VP', 17000.00, NULL, 100, 90);
INSERT INTO employees VALUES (103, 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', '2006-01-03', 'IT_PROG', 9000.00, NULL, 102, 60);
INSERT INTO employees VALUES (104, 'Bruce', 'Ernst', 'BERNST', '590.423.4568', '2007-05-21', 'IT_PROG', 6000.00, NULL, 103, 60);
INSERT INTO employees VALUES (145, 'John', 'Russell', 'JRUSSELL', '011.44.1344.429268', '2004-10-01', 'SA_MAN', 14000.00, 0.40, 100, 80);
INSERT INTO employees VALUES (174, 'Ellen', 'Abel', 'EABEL', '011.44.1344.429267', '2004-05-11', 'SA_REP', 11000.00, 0.30, 145, 80);
INSERT INTO employees VALUES (200, 'Jennifer', 'Whalen', 'JWHALEN', '515.123.4444', '2003-09-17', 'AD_VP', 4400.00, NULL, 101, 10);
INSERT INTO employees VALUES (201, 'Michael', 'Hartstein', 'MHARTSTE', '515.123.5555', '2004-02-17', 'MK_REP', 13000.00, NULL, 100, 20);
INSERT INTO employees VALUES (205, 'Shelley', 'Higgins', 'SHIGGINS', '515.123.8080', '2002-06-07', 'ACCT_MGR', 12008.00, NULL, 101, 110);
INSERT INTO employees VALUES (206, 'William', 'Gietz', 'WGIETZ', '515.123.8181', '2002-06-07', 'ACCT_PROG', 8300.00, NULL, 205, 110);

-- Populate Job History
INSERT INTO job_history VALUES (102, '2001-01-13', '2006-07-24', 'IT_PROG', 60);
INSERT INTO job_history VALUES (201, '2004-02-17', '2007-12-19', 'MK_REP', 20);
GO