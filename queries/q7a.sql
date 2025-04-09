WITH InvestorPerformance2024 AS (
    -- Get performance data for 2024 only
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
        p.MarketValue
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
),
InvestorTotals AS (
    -- Aggregate at the investor level
    SELECT
        InvestorID,
        Gender,
        -- Calculate weighted average return based on portfolio size
        SUM(TotalReturn2024 * MarketValue) / SUM(MarketValue) AS WeightedTotalReturn,
        -- Calculate estimated profit in cash terms
        SUM(MarketValue * TotalReturn2024 / 100) AS EstimatedProfit,
        SUM(MarketValue) AS TotalPortfolioValue
    FROM InvestorPerformance2024
    GROUP BY InvestorID, Gender
)
-- Final summary by gender
SELECT
    CASE WHEN Gender = 1 THEN 'Male' ELSE 'Female' END AS Gender,
    COUNT(*) AS NumberOfInvestors,
    AVG(WeightedTotalReturn) AS AvgReturnPct,
    AVG(EstimatedProfit) AS AvgProfitPerInvestor,
    SUM(TotalPortfolioValue) / COUNT(*) AS AvgPortfolioSize
FROM InvestorTotals
GROUP BY Gender
ORDER BY AvgReturnPct DESC;