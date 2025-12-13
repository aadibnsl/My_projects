/*############################# DQ VIEWS ###################################*/

CREATE OR REPLACE VIEW dq_duplicate_employees AS
SELECT emp_id, COUNT(*) AS cnt
FROM stg_employees
GROUP BY emp_id
HAVING COUNT(*) > 1;

CREATE OR REPLACE VIEW dq_missing_attendance AS
SELECT emp_id, attendance_date
FROM stg_attendance
WHERE status NOT IN ('P','A');

CREATE OR REPLACE VIEW dq_invalid_salary AS
SELECT *
FROM stg_salaries
WHERE salary <= 0;
