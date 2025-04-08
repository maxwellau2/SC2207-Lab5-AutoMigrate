SELECT 
    MONTH(DATEADD(SECOND, pp.PerformanceDate, '1970-01-01')) AS Month,
    AVG(pp.UnrealizedGainLoss) AS AverageMonthlyGainLoss
FROM dbo.PortfolioPerformance AS pp
WHERE 
    -- Filter for performances in 2024
    pp.PerformanceDate >= 1704067200  -- Jan 1, 2024
    AND pp.PerformanceDate < 1735689599  -- Dec 31, 2024
GROUP BY 
    MONTH(DATEADD(SECOND, pp.PerformanceDate, '1970-01-01'))
ORDER BY 
    Month;