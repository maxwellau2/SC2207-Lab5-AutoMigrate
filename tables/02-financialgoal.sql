IF OBJECT_ID(N'dbo.Financial_Goal', 'U') IS NULL
BEGIN
    CREATE TABLE Financial_Goal (
        InvestorID INT           NOT NULL,
        Goal       NVARCHAR(50)  NOT NULL,
        Amount     BIGINT        NOT NULL CHECK (Amount >= 0),
        Timeline   INT           NOT NULL CHECK (Timeline >= 0),  -- in years
        StartDate  BIGINT        NOT NULL CHECK (StartDate >= 0), -- epoch time in seconds
        CONSTRAINT PK_Financial_Goal PRIMARY KEY (InvestorID, Goal),
        CONSTRAINT FK_Financial_Goal_Investor
            FOREIGN KEY (InvestorID)
            REFERENCES Investor(InvestorID)
    );
END
