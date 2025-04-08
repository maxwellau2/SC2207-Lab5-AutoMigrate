IF OBJECT_ID(N'dbo.Investor', 'U') IS NULL -- add this to every query to prevent dupes
    BEGIN
        CREATE TABLE Investor (
            InvestorID    INT       IDENTITY(1,1) PRIMARY KEY,
            Phone         NVARCHAR(20)   NOT NULL,
            Name          NVARCHAR(100)  NOT NULL,
            Gender        INT            NOT NULL,
            DoB           BIGINT         NOT NULL,               -- store epoch seconds
            AnnualIncome  BIGINT         NOT NULL CHECK (AnnualIncome >= 0),
            Company       NVARCHAR(100)  NULL
        );
    END