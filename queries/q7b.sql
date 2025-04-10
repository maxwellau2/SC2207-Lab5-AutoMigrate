-- Q7. Are male investors in their 20s making more money from their investments than their female counterparts in 2024? (Per Portfolio Basis)


-- Compare total 2024 profits for male vs. female investors aged 20-29
-- per portfolio
WITH PortfolioPerformance2024 AS (
    -- Get performance data for 2024 by portfolio
    SELECT 
        i.InvestorID,
        i.Gender,
        DATEDIFF(
            YEAR,
            DATEADD(SECOND, i.DoB, '1970-01-01'),
            '2024-01-01'
        ) AS Age,
        p.PID,
        -- Sum of monthly percentage returns for 2024 (non-compounding)
        SUM(pp.UnrealizedGainLoss) AS TotalReturn2024,
        p.MarketValue,
        -- Calculate estimated profit in cash terms using the formula
        SUM(MarketValue * (pp.UnrealizedGainLoss/100)) AS EstimatedProfit
    FROM dbo.Investor i
    JOIN dbo.Portfolio p ON i.InvestorID = p.InvestorID
    JOIN dbo.PortfolioPerformance pp ON p.PID = pp.PID
    WHERE 
        -- Filter for investors in their 20s
        DATEDIFF(
            YEAR,
            DATEADD(SECOND, i.DoB, '1970-01-01'),
            '2024-01-01'
        ) BETWEEN 20 AND 29
        -- Filter for 2024 performance data
        AND DATEPART(
            YEAR,
            DATEADD(SECOND, pp.PerformanceDate, '1970-01-01')
        ) = 2024
    GROUP BY 
        i.InvestorID, i.Gender, i.DoB, p.PID, p.MarketValue
)
-- Final summary by gender at portfolio level
SELECT
    CASE WHEN Gender = 1 THEN 'Male' ELSE 'Female' END AS Gender,
    COUNT(*) AS NumberOfPortfolios,
    AVG(TotalReturn2024) AS AvgReturnPct,
    AVG(EstimatedProfit) AS AvgProfitPerPortfolio,
    AVG(MarketValue) AS AvgPortfolioSize,
    SUM(EstimatedProfit) / SUM(MarketValue) * 100 AS WeightedAvgReturn
FROM PortfolioPerformance2024
GROUP BY Gender
ORDER BY AvgReturnPct DESC;