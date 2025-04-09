IF OBJECT_ID(N'dbo.Portfolio', 'U') IS NULL
    BEGIN
        CREATE TABLE Portfolio (
            InvestorID       INT             NOT NULL,
            PID              INT             NOT NULL,
            InceptionDate    INT             NOT NULL CHECK (InceptionDate >= 0),  -- unsigned int
            MarketValue      FLOAT           NOT NULL CHECK (MarketValue >= 0),
            Fee              FLOAT           NOT NULL CHECK (Fee >= 0),
            PRIMARY KEY (InvestorID, PID),
            FOREIGN KEY (InvestorID) REFERENCES Investor(InvestorID)
        );
    END