-- Query: Investors with an average loss across portfolios in 2024
SELECT 
    i.InvestorID,
    i.Name,
    AVG(p.AnnualizedReturn) AS AvgPerformance
FROM dbo.Investor AS i
JOIN dbo.Portfolio AS p 
    ON i.InvestorID = p.InvestorID
-- We filter for portfolios that started in or before 2024
WHERE p.InceptionDate < 1735660800 and p.InceptionDate >= 	1704038400   -- Dec 31, 2024
GROUP BY i.InvestorID, i.Name
HAVING AVG(p.AnnualizedReturn) < 0;