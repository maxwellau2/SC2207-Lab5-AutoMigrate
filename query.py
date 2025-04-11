from util import query
from pprint import pprint
from decimal import Decimal
import pandas as pd

print("Q1. Find investors who are making on average a loss across all their portfolios in 2024.")
res = query("queries/q1.sql")
res = [list(r) for r in res]
df = pd.DataFrame(data=res, columns=['Investor ID', "Investor Name", "Loss %"])
print(df)
print("\n")
print("Q2. Find investors who are seeing an annualized return of more than 10% from their portfolios in 2024.")
res = query("queries/q2.sql")
res = [list(r) for r in res]
df = pd.DataFrame(data=res, columns=['Investor ID', "Investor Name", "Annualized Return"])
print(df)
print("\n")
print("Q3. Find the monthly average unrealized gain/loss of portfolios for each month in 2024.")
res = query("queries/q3.sql")
res = [list(r) for r in res]
df = pd.DataFrame(data=res, columns=['Year-Month', "Average Unrealized Gain/Loss"])
print(df)
print("\n")
print("Q4. What is the top three most popular first financial goals for investors in 2024?")
res = query("queries/q4.sql")
res = [list(r) for r in res]
df = pd.DataFrame(data=res, columns=['Occurence', "Goal"])
print(df)
print("\n")
print("Q5. Find investors who consistently top up their investment at the beginning of every month (dollar-cost averaging) in 2024 for at least one of their portfolios.")
res = query("queries/q5.sql")
res = [list(r) for r in res]
df = pd.DataFrame(data=res, columns=['Investor ID', "Investor Name"])
print(df)
print("\n")
print("Q6. Find the most popular financial goals for investors working in the same company and whose age is between 30 to 40 years old.")
res = query("queries/q6.sql")
res = [list(r) for r in res]
df = pd.DataFrame(data=res, columns=['Company', "Goal", "Goal Count"])
print(df)
print("\n")
print("Q7. Are male investors in their 20s making more money from their investments than their female counterparts in 2024?")
print("a: per PERSON basis")
res = query("queries/q7a.sql")
res = [list(r) for r in res]
df = pd.DataFrame(data=res, columns=['Gender', "Number of Investors", "Average Return %", "Average Profit per Investor", "Average Portfolio Size"])
print(df)
print("\n")
print("b: per PORTFOLIO basis")
res = query("queries/q7b.sql")
res = [list(r) for r in res]
df = pd.DataFrame(data=res, columns=['Gender', "Number of Investors", "Average Return %", "Average Profit per Investor", "Average Portfolio Size", "Weighted Average Return"])
print(df)
print("\n")