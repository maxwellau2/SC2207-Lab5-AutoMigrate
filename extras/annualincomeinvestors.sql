SELECT (COUNT(I.InvestorID) * 100.0 / (SELECT COUNT(*) FROM Investor)) AS 'Percentage'
FROM Investor I
WHERE I.AnnualIncome >= 80000 AND I.AnnualIncome <= 100000;