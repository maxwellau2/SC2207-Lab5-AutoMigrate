-- seeds/01-investor.sql
SET IDENTITY_INSERT dbo.Investor ON;

INSERT INTO dbo.Investor
    (InvestorID, Phone, Name, Gender, DoB, AnnualIncome, Company)
VALUES
    ( 1, '91234567', 'Alice Tan',               0,  813456000,  75000, 'Grab'),                -- 1995-10-12 (age 28)
    ( 2, '98765432', 'Ben Lim',                 1,  893462400,  90000, 'Shopee'),              -- 1998-04-25 (age 25)
    ( 3, '96543210', 'Cynthia Ong',             0,  996451200,  58000, 'Grab'),                -- 2001-07-30 (age 22)
    ( 4, '92345678', 'Daniel Teo',              1,  953078400,  80000, 'DBS'),                 -- 2000-03-15 (age 23)
    ( 5, '90011234', 'Elaine Goh',              0,  881280000, 120000, 'Standard Chartered'),  -- 1997-12-05 (age 25)
    ( 6, '09123091', 'Mike Hawks Laung',        1,  740534400, 120000, 'Standard Chartered'),  -- 1993-06-20 (age 30)
    ( 7, '91230001', 'Frank Lee',    1, 483619200,  70000, 'Grab'),                -- 1985‑05‑20 (age 38)
    ( 8, '91230002', 'Grace Tan',    0, 561283200,  82000, 'Grab'),                -- 1987‑09‑10 (age 36)
    ( 9, '91230003', 'Henry Chua',   1, 599616000,  90000, 'Shopee'),              -- 1988‑12‑05 (age 35)
    (10, '91230004', 'Irene Koh',    0, 567993600,  75000, 'Shopee'),              -- 1988‑01‑01 (age 35)
    (11, '91230005', 'Jack Hoff',      1, 536457600,  68000, 'DBS'),                 -- 1987‑01‑01 (age 36)
    (12, '91230006', 'Kelly Lim',    0, 507907200,  72000, 'DBS'),                 -- 1986‑02‑01 (age 37)
    (13, '91230007', 'Leo Goh',      1, 499420800,  88000, 'Standard Chartered'),  -- 1985‑11‑10 (age 38)
    (14, '91230008', 'Maya Wong',    0, 552019200,  85000, 'Standard Chartered');  -- 1987‑06‑05 (age 36)

SET IDENTITY_INSERT dbo.Investor OFF;
