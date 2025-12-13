/*####################### STORED PROCEDURES ###################################*/

/* Load Employees */

DELIMITER $$

CREATE PROCEDURE sp_load_employees()
BEGIN
    TRUNCATE TABLE dim_employee;

    INSERT INTO dim_employee
    SELECT emp_id,
           UPPER(first_name),
           UPPER(last_name),
           department,
           hire_date
    FROM stg_employees;
END $$

DELIMITER ;

/* Load Salaries */

DELIMITER $$

CREATE PROCEDURE sp_load_salaries()
BEGIN
    TRUNCATE TABLE fact_salary;

    INSERT INTO fact_salary
    SELECT emp_id, salary, effective_from, effective_to
    FROM stg_salaries;
END $$

DELIMITER ;

/* Load Attendance */

DELIMITER $$

CREATE PROCEDURE sp_load_attendance()
BEGIN
    TRUNCATE TABLE fact_attendance;

    INSERT INTO fact_attendance
    SELECT emp_id, attendance_date, status
    FROM stg_attendance;
END $$

DELIMITER ;
