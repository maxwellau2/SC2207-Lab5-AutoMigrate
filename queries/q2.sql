-- -- Q2. Find investors who are seeing an annualized return of more than 10% from their portfolios in 2024.

-- -- SELECT 
-- --     i.InvestorID,
-- --     i.Name,
-- --     AVG(p.AnnualizedReturn) AS AvgPerformance
-- -- FROM dbo.Investor AS i
-- -- JOIN dbo.Portfolio AS p 
-- --     ON i.InvestorID = p.InvestorID
-- -- -- We filter for portfolios that existed in 2024 (inception date in 2024)
-- -- WHERE p.InceptionDate >= 1704038400 AND p.InceptionDate < 1735660800  -- Jan 1, 2024 to Dec 31, 2024
-- -- GROUP BY i.InvestorID, i.Name
-- -- HAVING AVG(p.AnnualizedReturn) > 10;

-- with investorportfolio2024 as
-- (select investor.investorid, name, portfolio.pid, sum(portfolioperformance.unrealizedgainloss) as pnl2024
-- from investor
-- join portfolio
-- on investor.investorid=portfolio.investorid
-- join portfolioperformance
-- on portfolio.pid=portfolioperformance.pid	
-- -- Method A: extract the year after converting to DATETIME
-- WHERE DATEPART(
--         YEAR,
--         DATEADD(SECOND, portfolioperformance.performancedate, '1970-01-01')
--       ) = 2024
-- 	  AND 
-- 	  DATEPART(
--         YEAR,
--         DATEADD(SECOND, portfolio.inceptiondate, '1970-01-01')
--       ) < 2025
-- group by investor.investorid, portfolio.pid, investor.name
-- )

-- SELECT * from investorportfolio2024
-- WHERE pnl2024 > 10;
SELECT pv.InvestorID, i.name, CalcAnnualizedReturn
FROM dbo.vPortfolioWithCalc pv
JOIN Investor i
ON pv.InvestorID = i.InvestorID
WHERE pv.CalcAnnualizedReturn > 10.0;