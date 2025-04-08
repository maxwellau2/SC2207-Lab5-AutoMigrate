IF OBJECT_ID(N'dbo.Bond', 'U') IS NULL
BEGIN
    CREATE TABLE Bond (
        AssetID       INT     NOT NULL,
        InterestRate  FLOAT   NOT NULL CHECK (InterestRate >= 0),
        MaturityDate  BIGINT  NOT NULL CHECK (MaturityDate >= 0),  -- store as epoch seconds

        CONSTRAINT PK_Bond PRIMARY KEY (AssetID),
        CONSTRAINT FK_Bond_Asset
            FOREIGN KEY (AssetID)
            REFERENCES Asset(AssetID)
    );
END
