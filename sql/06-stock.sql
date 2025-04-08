IF OBJECT_ID(N'dbo.Stock', 'U') IS NULL
BEGIN
    CREATE TABLE Stock (
        AssetID INT PRIMARY KEY,
        P_E_Ratio FLOAT NOT NULL,
        EPS FLOAT NOT NULL,
        MarketValue FLOAT NOT NULL,
        CONSTRAINT FK_Stock_Asset FOREIGN KEY (AssetID) REFERENCES Asset(AssetID)
    );
END
