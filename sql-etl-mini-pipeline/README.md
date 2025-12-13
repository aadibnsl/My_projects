# SQL + Python ETL Mini Data Pipeline

## 📌 Project Overview
This project demonstrates a simple end-to-end ETL (Extract, Transform, Load) pipeline using **Python, Pandas, and MySQL**.  
It simulates a real-world data engineering workflow similar to enterprise EDW pipelines.

---

## 🛠️ Tech Stack
- Python 3.13
- Pandas
- MySQL
- MySQL Workbench
- CSV files as source data

---
```
## 📂 Project Structure
sql-etl-mini-pipeline/
│
├── data/
│ ├── employees.csv
│ ├── salaries.csv
│ └── attendance.csv
│
├── etl/
│ └── etl_load.py
│
├── sql/
│ ├── schema.sql
│ ├── dq_checks.sql
│ └── stored_procedures.sql
│
└── README.md
```

---

## 🔄 ETL Flow
1. **Extract**
   - Read CSV files using Pandas
   - Handle encoding and delimiter issues

2. **Load (Staging)**
   - Truncate staging tables
   - Insert records using column-level mapping

3. **Transform**
   - Execute MySQL stored procedures
   - Load data into final tables

4. **Data Quality Checks**
   - Null checks
   - Duplicate checks
   - Row count validation

---

## ▶️ How to Run
- cd etl
- python etl_load.py

## Expected Output:
- Loading stg_employees...
- Loading stg_salaries...
- Loading stg_attendance...
- ETL completed successfully

📊 Sample Use Cases
- HR analytics
- Payroll processing
- Attendance tracking
- ETL pipeline demonstration for interviews

🚀 Future Enhancements
- Incremental data loads
- Logging and error handling
- Scheduling using Airflow
- Dockerization
