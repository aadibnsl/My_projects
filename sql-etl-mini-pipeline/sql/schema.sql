CREATE DATABASE mini_pipeline;
USE mini_pipeline;

####################### STAGE TABLES ###################################

CREATE TABLE stg_employees (
    emp_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    hire_date DATE
);

CREATE TABLE stg_salaries (
    emp_id INT,
    salary INT,
    effective_from DATE,
    effective_to DATE
);

CREATE TABLE stg_attendance (
    emp_id INT,
    attendance_date DATE,
    status CHAR(1)
);

####################### FINAL TABLES ###################################

CREATE TABLE dim_employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    hire_date DATE
);

CREATE TABLE fact_salary (
    emp_id INT,
    salary INT,
    effective_from DATE,
    effective_to DATE
);

CREATE TABLE fact_attendance (
    emp_id INT,
    attendance_date DATE,
    status CHAR(1)
);
