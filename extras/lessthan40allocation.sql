SELECT DISTINCT I.InvestorID, I.Name
FROM Investor I, Portfolio P, Bond_In_Portfolio BiP
WHERE I.InvestorID=P.InvestorID AND P.PID = BiP.PID AND BiP.AllocationRatio < 40;