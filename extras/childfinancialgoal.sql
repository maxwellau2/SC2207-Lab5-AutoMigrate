SELECT (COUNT(DISTINCT f.InvestorID) * 100.0 / (SELECT COUNT(*) FROM Investor)) AS 'Percentage'
FROM Financial_Goal f
WHERE f.Goal = 'Child education purchase' AND f.Timeline = 20; --not sure if exactly 20 years or within 20 years