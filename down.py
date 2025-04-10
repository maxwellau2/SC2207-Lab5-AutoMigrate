# disclaimer, i just took this from chat

import sys
import pyodbc
from util import get_connection

def drop_all_tables():
    conn   = get_connection()
    cursor = conn.cursor()

    # 1) Drop every foreign‑key constraint
    fk_sql = """
    DECLARE @sql NVARCHAR(MAX) = N'';
    SELECT @sql += 
        'ALTER TABLE ' 
        + QUOTENAME(OBJECT_SCHEMA_NAME(parent_object_id)) 
        + '.' + QUOTENAME(OBJECT_NAME(parent_object_id)) 
        + ' DROP CONSTRAINT ' 
        + QUOTENAME(name) + ';'
    FROM sys.foreign_keys;

    EXEC sp_executesql @sql;
    """
    print("Dropping all foreign-key constraints…")
    cursor.execute(fk_sql)

    # 2) Drop every user table
    drop_sql = """
    DECLARE @sql NVARCHAR(MAX) = N'';
    SELECT @sql += 
        'DROP TABLE ' 
        + QUOTENAME(s.name) 
        + '.' + QUOTENAME(t.name) 
        + ';'
    FROM sys.tables t
    JOIN sys.schemas s
      ON t.schema_id = s.schema_id
    WHERE t.is_ms_shipped = 0;  -- skip system tables

    EXEC sp_executesql @sql;
    """
    print("Dropping all user tables…")
    cursor.execute(drop_sql)

    print("All user tables (and their FKs) have been dropped.")
    cursor.close()
    conn.close()

if __name__ == "__main__":
    try:
        drop_all_tables()
    except pyodbc.Error as e:
        print("❌ Error wiping database:", e, file=sys.stderr)
        sys.exit(1)
