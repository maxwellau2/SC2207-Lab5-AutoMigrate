SELECT DISTINCT I.InvestorID, I.Name
FROM Investor I, Portfolio P, Stock_In_Portfolio S
WHERE I.InvestorID=P.InvestorID AND P.PID = S.PID AND S.AllocationRatio > 60;