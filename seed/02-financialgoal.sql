IF OBJECT_ID(N'dbo.Financial_Goal', 'U') IS NOT NULL
BEGIN
    INSERT INTO dbo.Financial_Goal (InvestorID, Goal, Amount, Timeline)
    VALUES
      (1, 'Buy House',              500000, 5),   -- 2028 − 2023 = 5 years
      (1, 'Retirement',             800000, 22),  -- 2045 − 2023 = 22 years
      (2, 'Car Purchase',            80000, 3),   -- 2026 − 2023 = 3 years
      (3, 'Education Fund',         100000, 7),   -- 2030 − 2023 = 7 years
      (4, 'Vacation',                15000, 2),   -- 2025 − 2023 = 2 years
      (5, 'Monthly Passive Income', 600000, 12);  -- 2035 − 2023 = 12 years
END
