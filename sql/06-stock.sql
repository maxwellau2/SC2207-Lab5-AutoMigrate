IF OBJECT_ID(N'dbo.Stock', 'U') IS NULL
BEGIN
    CREATE TABLE Stock (
        AssetID       INT PRIMARY KEY,
        P_E_Ratio     DECIMAL(5,2)      NOT NULL,
        EPS           DECIMAL(6,2)      NOT NULL,
        MarketValue   BIGINT            NOT NULL CHECK (MarketValue >= 0),
        FOREIGN KEY (AssetID) REFERENCES Asset(AssetID)
    );
END
