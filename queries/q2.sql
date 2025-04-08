SELECT 
    i.InvestorID,
    i.Name,
    AVG(p.AnnualizedReturn) AS AvgPerformance
FROM dbo.Investor AS i
JOIN dbo.Portfolio AS p 
    ON i.InvestorID = p.InvestorID
-- We filter for portfolios that existed in 2024 (inception date in 2024)
WHERE p.InceptionDate >= 1704038400 AND p.InceptionDate < 1735660800  -- Jan 1, 2024 to Dec 31, 2024
GROUP BY i.InvestorID, i.Name
HAVING AVG(p.AnnualizedReturn) > 10;