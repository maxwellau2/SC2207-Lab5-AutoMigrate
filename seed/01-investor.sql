-- seeds/01-investor.sql
SET IDENTITY_INSERT dbo.Investor ON;

INSERT INTO dbo.Investor
    (InvestorID, Phone, Name, Gender, DoB, AnnualIncome, Company)
VALUES
    (1, '91234567', 'Alice Tan',   0,  802073600,  75000, 'Grab'),
    (2, '98765432', 'Ben Lim',     1,  586137600,  90000, 'Shopee'),
    (3, '96543210', 'Cynthia Ong', 0,  679516800,  58000, 'Grab'),
    (4, '92345678', 'Daniel Teo',  1,  946944000,  80000, 'DBS'),
    (5, '90011234', 'Elaine Goh',  0,         0, 120000, 'Standard Chartered');

SET IDENTITY_INSERT dbo.Investor OFF;
