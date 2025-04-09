SELECT I.InvestorID, I.Name, COUNT(*) as 'Number of portfolios'
FROM Investor I, Portfolio P
WHERE I.InvestorID = p.InvestorID
GROUP BY I.InvestorID, I.Name
HAVING COUNT(*) >= 2;