SELECT (COUNT(DISTINCT f.InvestorID) * 100.0 / (SELECT COUNT(*) FROM Investor)) AS 'Percentage'
FROM Financial_Goal f
WHERE f.Goal = 'Residential property purchase' AND f.Timeline <= 10;