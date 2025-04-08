from util import create_table

# we will eventually just do a forloop to iterate thru all sql
# note the 00- is for ordering the query, we need to create some tables before using the columns as FK to other tables
create_table("sql/00-investor.sql")