-- Q1. Find investors who are making on average a loss across all their portfolios in 2024.

-- -- Query: Investors with an average loss across portfolios in 2024
-- SELECT 
--     i.InvestorID,
--     i.Name,
--     AVG(p.AnnualizedReturn) AS AvgPerformance
-- FROM dbo.Investor AS i
-- JOIN dbo.Portfolio AS p 
--     ON i.InvestorID = p.InvestorID
-- -- We filter for portfolios that started in or before 2024
-- WHERE p.InceptionDate < 1735660800 and p.InceptionDate >= 	1704038400   -- Dec 31, 2024
-- GROUP BY i.InvestorID, i.Name
-- HAVING AVG(p.AnnualizedReturn) < 0;


WITH investorportfolio2024 AS
(SELECT investor.investorid, name, portfolio.pid, sum(portfolioperformance.unrealizedgainloss) as pnl2024
FROM investor
JOIN portfolio
ON investor.investorid=portfolio.investorid
JOIN portfolioperformance
ON portfolio.pid=portfolioperformance.pid	
-- Method A: extract the year after converting to DATETIME
WHERE DATEPART(
        YEAR,
        DATEADD(SECOND, portfolioperformance.performancedate, '1970-01-01')
      ) = 2024
	  AND 
	  DATEPART(
        YEAR,
        DATEADD(SECOND, portfolio.inceptiondate, '1970-01-01')
      ) < 2025
GROUP BY investor.investorid, portfolio.pid, investor.name
)

SELECT * FROM investorportfolio2024
WHERE pnl2024 < 0
ORDER BY InvestorID ASC;