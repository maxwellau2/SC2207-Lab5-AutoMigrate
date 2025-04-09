IF OBJECT_ID(N'dbo.FUND', 'U') IS NULL -- Ensure the table does not already exist before creating it
    BEGIN
        CREATE TABLE Fund (
            AssetID         INT            PRIMARY KEY,     -- Primary Key
            ExpenseRatio    FLOAT          NOT NULL,        -- Expense ratio of the fund
            DividendYield   FLOAT          NOT NULL,        -- Dividend yield (percentage)
            InterestRate    FLOAT          NULL,            -- Derived attribute (functional dependency)
            MaturityDate    DATE           NULL             -- Derived attribute (functional dependency)
            -- CONSTRAINT PRIMARY KEY (AssetID),
            FOREIGN KEY (AssetID) REFERENCES Asset(AssetID)
        );
    END
