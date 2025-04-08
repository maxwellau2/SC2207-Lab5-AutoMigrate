import pyodbc

# Replace these with your actual values
server   = '10.96.189.36'      # e.g. 'localhost\\SQLEXPRESS' or 'my.db.server.com,1433'
database = 'SCS2g1'
username = 'SCS2g1'
password = 'P@ssw0rd!'

def get_connection() -> pyodbc.Connection:
    # Build the connection string
    conn_str = (
        'DRIVER={ODBC Driver 17 for SQL Server};'
        f'SERVER={server};'
        f'DATABASE={database};'
        f'UID={username};'
        f'PWD={password};'
    )

    # Establish the connection
    conn = pyodbc.connect(conn_str, autocommit=True)
    return conn

def create_table(sql_path: str) ->None:
    conn = get_connection()
    with open(sql_path, 'r', encoding='utf-8') as f:
        print(f"Running {sql_path}")
        sql = f.read()
        # Create a cursor and run a simple query
        cursor = conn.cursor()
        cursor.execute(sql)
        print(f"Created Table {sql_path}")
        # Always close when done
        cursor.close()
    conn.close()

def seed(sql_path: str) ->None:
    conn = get_connection()
    with open(sql_path, 'r', encoding='utf-8') as f:
        print(f"Running {sql_path}")
        sql = f.read()
        # Create a cursor and run a simple query
        cursor = conn.cursor()
        cursor.execute(sql)
        print(f"seeded {sql_path}")
        # Always close when done
        cursor.close()
    conn.close()

def query(sql_path: str) ->None:
    conn = get_connection()
    with open(sql_path, 'r', encoding='utf-8') as f:
        # print(f"Running {sql_path}")
        sql = f.read()
        # Create a cursor and run a simple query
        cursor = conn.cursor()
        cursor.execute(sql)
        # print(f"Queried {sql_path}")
        result = cursor.fetchall()
        # print(result)
        # Always close when done
        cursor.close()
        conn.close()
        return result
    conn.close()
    return None
    