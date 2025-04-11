IF OBJECT_ID(N'dbo.PortfolioPerformance', 'U') IS NULL
BEGIN
    CREATE TABLE PortfolioPerformance (
        PID             INT             NOT NULL,
        PerformanceDate BIGINT          NOT NULL CHECK (PerformanceDate >= 0),  -- store as epoch seconds
        UnrealizedGainLoss DECIMAL(12,2) NOT NULL,
        
        CONSTRAINT PK_PortfolioPerformance PRIMARY KEY (PID, PerformanceDate)
    );
END