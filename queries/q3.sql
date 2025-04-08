SELECT
    FORMAT(DATEADD(SECOND, PerformanceDate, '1970-01-01'), 'yyyy-MM') AS [YearMonth],
    AVG(UnrealizedGainLoss)                                AS AvgUnrealizedGainLoss
FROM dbo.PortfolioPerformance
-- restrict to all of 2024
WHERE PerformanceDate 
      BETWEEN DATEDIFF(SECOND, '1970-01-01', '2024-01-01')
          AND DATEDIFF(SECOND, '1970-01-01', '2025-01-01') - 1
GROUP BY FORMAT(DATEADD(SECOND, PerformanceDate, '1970-01-01'), 'yyyy-MM')
ORDER BY [YearMonth];
