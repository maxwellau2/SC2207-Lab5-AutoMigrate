from util import seed
import os
files = os.listdir("seed")
files.sort()
for i, obj in enumerate(files):
    files[i] = "seed/" + obj
# print(files)

# files = [
#     'seed/01-investor.sql',
#     'seed/02-financialgoal.sql',
#     'seed/03-risk_tolerance.sql',
#     'seed/04-portfolio.sql',
#     'seed/05-asset.sql',
#     'seed/06-stock.sql',
#     'seed/07-bond.sql',
#     'seed/08-fund.sql',
#     'seed/09-stockInPortfolio.sql',
#     'seed/10-bond-in-portfolio.sql',
#     'seed/11-fund_in_portfolio.sql',
#     "seed/12-transaction.sql",
#     "seed/13-portfolio_performance.sql"
# ]

for file in files:
    seed(file)