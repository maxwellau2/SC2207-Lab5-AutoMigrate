from util import create_table
import os

files = os.listdir("tables")
files.sort()
for i, obj in enumerate(files):
    files[i] = "tables/" + obj
# print(files)
# files = [
#     'sql/01-investor.sql',
#     'sql/02-financialgoal.sql',
#     'sql/03-risk_tolerance.sql',
#     'sql/04-portfolio.sql',
#     'sql/05-asset.sql',
#     'sql/06-stock.sql',
#     'sql/07-bond.sql',
#     'sql/08-fund.sql',
#     'sql/09-stockInPortfolio.sql',
#     'sql/10-bond-in-portfolio.sql',
#     'sql/11-fund_in_portfolio.sql',
#     "sql/12-transaction.sql",
#     "sql/13-portfolio_performance.sql"
# ]

for file in files:
    print(file)
    create_table(file)
