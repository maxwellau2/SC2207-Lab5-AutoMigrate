IF OBJECT_ID(N'dbo.Risk_Tolerance', 'U') IS NULL
BEGIN
    CREATE TABLE Risk_Tolerance (
        InvestorID INT PRIMARY KEY,
        RiskLevel NVARCHAR(20) NOT NULL, -- enum string, so using NVARCHAR
        Q1answer NVARCHAR(50) NOT NULL,
        Q2answer NVARCHAR(50) NOT NULL,
        Q3answer NVARCHAR(50) NOT NULL,
        Q4answer NVARCHAR(50) NOT NULL,
        Q5answer NVARCHAR(50) NOT NULL,
        CONSTRAINT FK_RiskTolerance_Investor FOREIGN KEY (InvestorID) REFERENCES Investor(InvestorID),
        -- Constraint to only these enum values
        CONSTRAINT RiskLevelCheck CHECK (RiskLevel IN ('Conservative', 'Moderate', 'Aggressive') )
    );
END
