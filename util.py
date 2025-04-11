import pyodbc
from config import server, database, username, password

def get_connection() -> pyodbc.Connection:
    conn_str = (
        'DRIVER={ODBC Driver 17 for SQL Server};'
        f'SERVER={server};'
        f'DATABASE={database};'
        f'UID={username};'
        f'PWD={password};'
    )
    conn = pyodbc.connect(conn_str, autocommit=True)
    return conn

def create_table(sql_path: str) ->None:
    conn = get_connection()
    with open(sql_path, 'r', encoding='utf-8') as f:
        sql = f.read()
        cursor = conn.cursor()
        cursor.execute(sql)
        print(f"Successfully Created Table {sql_path} ✅")
        cursor.close()
    conn.close()

def seed(sql_path: str) ->None:
    conn = get_connection()
    with open(sql_path, 'r', encoding='utf-8') as f:
        sql = f.read()
        cursor = conn.cursor()
        cursor.execute(sql)
        print(f"Successfully Seeded {sql_path} ✅")
        cursor.close()
    conn.close()

def query(sql_path: str) ->None:
    conn = get_connection()
    with open(sql_path, 'r', encoding='utf-8') as f:
        sql = f.read()
        cursor = conn.cursor()
        cursor.execute(sql)
        result = cursor.fetchall()
        cursor.close()
        conn.close()
        return result
    conn.close()
    return None
    