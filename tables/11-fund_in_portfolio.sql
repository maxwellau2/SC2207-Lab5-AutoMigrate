IF OBJECT_ID(N'dbo.FUND_IN_PORTFOLIO', 'U') IS NULL -- Ensure the table does not already exist before creating it
    BEGIN
        CREATE TABLE Fund_In_Portfolio (
            AssetID         INT           NOT NULL,        -- Asset ID
            PID             INT           NOT NULL,        -- Portfolio ID
            StartDate       BIGINT        NOT NULL,        -- Start date stored as unsigned integer (epoch time)
            AllocationRatio INT           NOT NULL CHECK (AllocationRatio >= 0 AND AllocationRatio <= 100), -- Allocation ratio (percentage)
            PostTradeCO     NVARCHAR(50)  NOT NULL,        -- Post-trade compliance outcome
            CONSTRAINT PK_FUND_IN_PORTFOLIO PRIMARY KEY (PID, AssetID), -- Composite Primary Key
            FOREIGN KEY (AssetID) REFERENCES Fund(AssetID),
            CONSTRAINT FK_FundInPortfolio_Portfolio
                FOREIGN KEY (PID) REFERENCES Portfolio(PID),
        );
    END