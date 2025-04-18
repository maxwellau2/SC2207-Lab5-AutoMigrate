IF OBJECT_ID(N'dbo.Stock_In_Portfolio', 'U') IS NULL
    BEGIN
        CREATE TABLE Stock_In_Portfolio (
            AssetID         INT             NOT NULL,
            PID             INT             NOT NULL,
            StartDate       INT             NOT NULL CHECK (StartDate >= 0),  -- unsigned int
            AllocationRatio INT             NOT NULL CHECK (AllocationRatio >= 0),
            PostTradeCO     NVARCHAR(50)    NOT NULL,
            PRIMARY KEY (PID, AssetID),
            FOREIGN KEY (PID) REFERENCES Portfolio(PID),
            FOREIGN KEY (AssetID) REFERENCES Asset(AssetID)
        );
    END
