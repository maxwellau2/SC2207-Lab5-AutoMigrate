WITH InvestorGainLoss AS (
    SELECT 
		i.InvestorID,
		i.Name,
		SUM((p.MarketValue * 100.0 / (100 + pp.UnrealizedGainLoss))) AS InvestedAmount,
		SUM((p.MarketValue * pp.UnrealizedGainLoss / (100 + pp.UnrealizedGainLoss))) AS UnrealizedGainLossAmount,
		(SUM((p.MarketValue * pp.UnrealizedGainLoss / (100 + pp.UnrealizedGainLoss))) / SUM((p.MarketValue * 100.0 / (100 + pp.UnrealizedGainLoss))) * 100.0) AS TotalUnrealizedGainLossPct
	FROM Investor i
    INNER JOIN Portfolio p ON i.InvestorID = p.InvestorID
	INNER JOIN PortfolioPerformance pp ON p.PID = pp.PID
    INNER JOIN (
        SELECT PID, MAX(PerformanceDate) AS LatestDate
        FROM PortfolioPerformance
        GROUP BY PID
    ) latest ON pp.PID = latest.PID AND pp.PerformanceDate = latest.LatestDate
	GROUP BY i.InvestorID, i.Name
)

SELECT * FROM InvestorGainLoss
WHERE TotalUnrealizedGainLossPct <= 20;