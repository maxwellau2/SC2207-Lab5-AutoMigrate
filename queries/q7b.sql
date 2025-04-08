-- Compare total 2024 profits for male vs. female investors aged
-- per portfolio
WITH Profits2024 AS (
    SELECT
        i.Gender,
        -- approximate 2024 profit = MarketValue * (AnnualizedReturn / 100)
        p.MarketValue * p.AnnualizedReturn / 100.0 AS Profit
    FROM dbo.Investor i
    JOIN dbo.Portfolio p
      ON i.InvestorID = p.InvestorID
    WHERE 
      -- age as of Jan 1 2024 between 20 and 29
      DATEDIFF(
        YEAR,
        DATEADD(SECOND, i.DoB, '1970-01-01'),
        '2024-01-01'
      ) BETWEEN 20 AND 29
)

SELECT
    CASE WHEN Gender = 1 THEN 'Male' ELSE 'Female' END AS Gender,
    COUNT(*)                AS NumPortfolios,
    SUM(Profit)             AS TotalProfit,
    AVG(Profit)             AS AvgProfitPerPortfolio
FROM Profits2024
GROUP BY Gender;