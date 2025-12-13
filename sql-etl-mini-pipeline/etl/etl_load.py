import pandas as pd
import mysql.connector

conn = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="Aadi@2404",
    database="mini_pipeline"
)
cursor = conn.cursor()

employees = pd.read_csv("../data/employees.csv", encoding="latin1")
salaries = pd.read_csv("../data/salaries.csv", encoding="latin1")
attendance = pd.read_csv("../data/attendance.csv", encoding="latin1")

def load_to_staging(df, table):
    print(f"Loading {table} with columns:", df.columns.tolist())

    cursor.execute(f"TRUNCATE TABLE {table}")

    cols = ",".join(df.columns)
    placeholders = ",".join(["%s"] * len(df.columns))
    sql = f"INSERT INTO {table} ({cols}) VALUES ({placeholders})"

    for _, row in df.iterrows():
        cursor.execute(sql, tuple(row))

    conn.commit()

load_to_staging(employees, "stg_employees")
load_to_staging(salaries, "stg_salaries")
load_to_staging(attendance, "stg_attendance")

cursor.callproc("sp_load_employees")
cursor.callproc("sp_load_salaries")
cursor.callproc("sp_load_attendance")

print("✅ ETL completed successfully")

cursor.close()
conn.close()
