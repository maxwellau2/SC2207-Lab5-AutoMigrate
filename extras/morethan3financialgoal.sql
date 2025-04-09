SELECT I.InvestorID, I.Name, COUNT(*) as 'Number of Financial Goals'
FROM Investor I, Financial_Goal f
WHERE I.InvestorID=f.InvestorID
GROUP BY I.InvestorID, I.Name
HAVING COUNT(*) >= 3;