CREATE OR ALTER VIEW dbo.vPortfolioWithCalc AS
SELECT
  p.InvestorID,
  p.PID,
  p.MarketValue,
  p.InceptionDate,
  p.Fee,
  -- compute the annualized return from performance rows in 2023–2024
  -- for this purpose, we will simply define CAGR to be
  -- mean(performance) * 12 (performance is month on month)
  -- in reality, we would use the ACTUAL formula which needs states
  -- quite hard to do in SQL...
  AVG(pp.UnrealizedGainLoss)*12.0 AS CalcAnnualizedReturn
FROM dbo.Portfolio p
JOIN dbo.PortfolioPerformance pp
  ON p.PID = pp.PID
  AND DATEPART(
        YEAR,
        DATEADD(SECOND, pp.PerformanceDate, '1970-01-01')
      ) BETWEEN 2023 AND 2024
GROUP BY
  p.InvestorID, p.PID, p.MarketValue, p.InceptionDate, p.Fee;
