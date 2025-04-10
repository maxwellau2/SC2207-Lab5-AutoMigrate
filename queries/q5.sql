-- Q5. Find investors who consistently top up their investment at the beginning of every month (dollar-cost averaging) in 2024 for at least one of their portfolios.

WITH TopUps2024 AS (
    SELECT
        InvestorID,
        PID,
        DATEADD(SECOND, TransactionDate, '1970-01-01') AS TxnDate
    FROM dbo.Transactions
    WHERE TransactionType = 'TopUp'
      AND DATEADD(SECOND, TransactionDate, '1970-01-01') >= '2024-01-01'
      AND DATEADD(SECOND, TransactionDate, '1970-01-01') <  '2025-01-01'
      AND DATEPART(DAY, DATEADD(SECOND, TransactionDate, '1970-01-01')) <= 7
)
, ConsistentTopUps AS (
    SELECT
        InvestorID,
        PID,
        COUNT(DISTINCT DATEPART(MONTH, TxnDate)) AS MonthsTopped
    FROM TopUps2024
    GROUP BY InvestorID, PID
    HAVING COUNT(DISTINCT DATEPART(MONTH, TxnDate)) = 12
)
SELECT DISTINCT Investor.InvestorID, Investor.Name
FROM ConsistentTopUps
JOIN Investor
ON Investor.InvestorID = ConsistentTopUps.InvestorID;
