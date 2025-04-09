SELECT I.InvestorID, I.Name
FROM Investor I
WHERE NOT EXISTS (
	SELECT *
	FROM Portfolio P
	WHERE I.InvestorID = p.InvestorID
);