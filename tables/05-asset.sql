IF OBJECT_ID(N'dbo.Asset', 'U') IS NULL
BEGIN
    CREATE TABLE Asset (
        AssetID INT PRIMARY KEY,
        Name NVARCHAR(50) NOT NULL,
        Price FLOAT NOT NULL
    );
END
