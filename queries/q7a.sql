-- per person basis

WITH
-- 1) Compute each portfolio's 2024 profit
Profits2024 AS (
    SELECT
        i.InvestorID,
        i.Gender,
        p.MarketValue * p.AnnualizedReturn / 100.0 AS Profit
    FROM dbo.Investor i
    JOIN dbo.vPortfolioWithCalc p
      ON i.InvestorID = p.InvestorID
    WHERE 
      DATEDIFF(
        YEAR,
        DATEADD(SECOND, i.DoB, '1970-01-01'),
        '2024-01-01'
      ) BETWEEN 20 AND 29
),
-- 2) Sum up profits per investor
InvestorTotals AS (
    SELECT
        InvestorID,
        Gender,
        SUM(Profit) AS TotalProfit
    FROM Profits2024
    GROUP BY InvestorID, Gender
)
-- 3) Compare across genders, per person
SELECT
    CASE WHEN Gender = 1 THEN 'Male' ELSE 'Female' END AS Gender,
    COUNT(*)                   AS NumInvestors,
    SUM(TotalProfit)           AS SumOfAllProfits,
    AVG(TotalProfit)           AS AvgProfitPerInvestor
FROM InvestorTotals
GROUP BY Gender;