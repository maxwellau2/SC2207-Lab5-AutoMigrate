import pyodbc

# Replace these with your actual values
server   = '10.96.189.36'      # e.g. 'localhost\\SQLEXPRESS' or 'my.db.server.com,1433'
database = 'SCS2g1'
username = 'SCS2g1'
password = 'P@ssw0rd!'

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

# Create a cursor and run a simple query
cursor = conn.cursor()
cursor.execute("SELECT @@VERSION;")
row = cursor.fetchone()
print('hi')
print(row[0])

# Always close when done
cursor.close()
conn.close()
