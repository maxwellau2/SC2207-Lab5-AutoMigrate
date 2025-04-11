-- -- Q2. Find investors who are seeing an annualized return of more than 10% from their portfolios in 2024.

SELECT pv.InvestorID, i.name, AnnualizedReturn
FROM vPortfolioWithCalc pv
JOIN Investor i
ON pv.InvestorID = i.InvestorID
WHERE pv.AnnualizedReturn > 10.0
ORDER BY InvestorID ASC;