SELECT I.InvestorID, I.Name
FROM Investor I
WHERE NOT EXISTS (
	SELECT *
	FROM Financial_Goal f
	WHERE I.InvestorID = f.InvestorID
);