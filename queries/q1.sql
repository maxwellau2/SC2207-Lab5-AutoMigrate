-- Q1. Find investors who are making on average a loss across all their portfolios in 2024.

WITH investorportfolio2024 AS
(SELECT investor.investorid, name, sum(portfolioperformance.unrealizedgainloss) as pnl2024
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
GROUP BY investor.investorid, investor.name
)

SELECT * FROM investorportfolio2024
WHERE pnl2024 < 0
ORDER BY InvestorID ASC;