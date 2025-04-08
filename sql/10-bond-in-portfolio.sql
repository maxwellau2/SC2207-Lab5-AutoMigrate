IF OBJECT_ID(N'dbo.Bond_In_Portfolio', 'U') IS NULL
BEGIN
    CREATE TABLE Bond_In_Portfolio (
        PID              INT         NOT NULL,
        AssetID          INT         NOT NULL,
        StartDate        BIGINT      NOT NULL CHECK (StartDate >= 0),         -- store as epoch seconds
        AllocationRatio  FLOAT       NOT NULL CHECK (AllocationRatio >= 0),   -- ratio (e.g. 0.25 for 25%)
        PostTradeCO      NVARCHAR(50) NOT NULL,

        CONSTRAINT PK_Bond_In_Portfolio PRIMARY KEY (PID, AssetID),
        -- CONSTRAINT FK_BondInPortfolio_Portfolio
            -- FOREIGN KEY (PID) REFERENCES Portfolio(PID),
        CONSTRAINT FK_BondInPortfolio_Bond
            FOREIGN KEY (AssetID)
            REFERENCES Bond(AssetID)
    );
END
