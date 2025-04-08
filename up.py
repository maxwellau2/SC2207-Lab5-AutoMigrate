from util import create_table

# we will eventually just do a forloop to iterate thru all sql
# note the 00- is for ordering the query, we need to create some tables before using the columns as FK to other tables
# create_table("sql/00-investor.sql")
# import os

# sql_dir = 'sql'
# file_list = []

# for root, dirs, files in os.walk(sql_dir):
#     for fname in files:
#         # build the relative path, e.g. "sql/01-investor.sql"
#         rel_path = os.path.join(root, fname)
#         file_list.append(rel_path)

# print(file_list)
# file_list.sort()
# print(file_list)

files = [
    'sql/01-investor.sql',
    'sql/02-financialgoal.sql',
    'sql/03-risk_tolerance.sql',
    'sql/04-portfolio.sql',
    'sql/05-asset.sql',
    'sql/06-stock.sql',
    'sql/07-bond.sql',
    'sql/08-fund.sql',
    'sql/09-stockInPortfolio.sql',
    'sql/10-bond-in-portfolio.sql',
    'sql/11-fund_in_portfolio.sql',
    "sql/12-transaction.sql",
    "sql/13-portfolio_performance.sql"
]

for file in files:
    print(file)
    create_table(file)
