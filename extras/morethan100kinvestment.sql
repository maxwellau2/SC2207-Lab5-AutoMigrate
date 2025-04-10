--Total amount invested across all portfolios
WITH TotalInvestedAmount AS (
    SELECT 
		i.InvestorID,
		i.Name,
		SUM(ISNULL((p.MarketValue * 100.0 / (100 + pp.UnrealizedGainLoss)), p.MarketValue)) AS InvestedAmount
	FROM PortfolioPerformance pp
	INNER JOIN (
        SELECT PID, MAX(PerformanceDate) AS LatestDate
        FROM PortfolioPerformance
        GROUP BY PID
    ) latest ON pp.PID = latest.PID AND pp.PerformanceDate = latest.LatestDate
	RIGHT JOIN Portfolio p ON pp.PID = p.PID
	RIGHT JOIN Investor i ON p.InvestorID = i.InvestorID
	GROUP BY i.InvestorID, i.Name
)

SELECT * FROM TotalInvestedAmount
WHERE InvestedAmount > 100000;

--individual portfolios
WITH PortfolioInvestedAmount AS (
    SELECT 
		i.InvestorID,
		i.Name,
		p.PID,
		ISNULL((p.MarketValue * 100.0 / (100 + pp.UnrealizedGainLoss)), p.MarketValue) AS InvestedAmount,
		pp.UnrealizedGainLoss
	FROM PortfolioPerformance pp
	INNER JOIN (
        SELECT PID, MAX(PerformanceDate) AS LatestDate
        FROM PortfolioPerformance
        GROUP BY PID
    ) latest ON pp.PID = latest.PID AND pp.PerformanceDate = latest.LatestDate
	RIGHT JOIN Portfolio p ON pp.PID = p.PID
	RIGHT JOIN Investor i ON p.InvestorID = i.InvestorID
    
)

SELECT * FROM PortfolioInvestedAmount
WHERE InvestedAmount > 100000;