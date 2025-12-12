import pandas as pd
import mysql.connector

# MySQL connection
conn = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="Aadi@2404",
    database="mini_pipeline"
)
cursor = conn.cursor()

# Load CSV files
employees = pd.read_csv("employees.csv")
salaries = pd.read_csv("salaries.csv")
attendance = pd.read_csv("attendance.csv")

def load_to_staging(df, table):
    cursor.execute(f"TRUNCATE TABLE {table}")
    for _, row in df.iterrows():
        placeholders = ','.join(['%s'] * len(row))
        sql = f"INSERT INTO {table} VALUES ({placeholders})"
        cursor.execute(sql, tuple(row))
    conn.commit()

# Load staging tables
load_to_staging(employees, "stg_employees")
load_to_staging(salaries, "stg_salaries")
load_to_staging(attendance, "stg_attendance")

print("Staging tables loaded successfully!")

# Run stored procedures
cursor.callproc("sp_load_employees")
cursor.callproc("sp_load_salaries")
cursor.callproc("sp_load_attendance")

print("ETL completed!")

cursor.close()
conn.close()
