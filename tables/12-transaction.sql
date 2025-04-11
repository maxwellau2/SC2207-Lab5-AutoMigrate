IF OBJECT_ID(N'dbo.Transactions', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.Transactions (
        TransactionID INT,
        PID INT,
        InvestorID INT,
        TransactionType VARCHAR(20), -- 'TopUp', 'Withdraw', 'Rebalance'
        TransactionDate BIGINT NOT NULL CHECK (TransactionDate >= 0), -- store as epoch seconds like other tables
        Amount DECIMAL(12,2) NOT NULL,
        CONSTRAINT PK_Transaction PRIMARY KEY (TransactionID, PID),
        CONSTRAINT FK_Transaction_Portfolio
            FOREIGN KEY (PID) 
            REFERENCES Portfolio(PID),
        CONSTRAINT FK_Transaction_Investor
            FOREIGN KEY (InvestorID) 
            REFERENCES Investor(InvestorID)
    );
END