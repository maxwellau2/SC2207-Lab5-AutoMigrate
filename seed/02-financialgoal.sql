IF OBJECT_ID(N'dbo.Financial_Goal', 'U') IS NOT NULL
BEGIN
    INSERT INTO dbo.Financial_Goal (InvestorID, Goal, Amount, Timeline)
    VALUES
        (1, 'Become king of pirates',              500000, 5),   -- 2028 − 2023 = 5 years
        (1, 'Retirement',             800000, 22),  -- 2045 − 2023 = 22 years
        (4, 'Vacation',                15000, 2),   -- 2025 − 2023 = 2 years
        (5, 'Monthly Passive Income', 600000, 12),  -- 2035 − 2023 = 12 years
        (6, 'Become king of pirates', 900000, 12),  -- 2035 − 2023 = 12 years
        ( 2, 'Car Purchase',            80000,    3),   -- Ben Lim (Shopee)
        ( 2, 'Vacation',                15000,    2),
        ( 2, 'Monthly Passive Income', 200000,    8),

        ( 3, 'Education Fund',         100000,    7),   -- Cynthia Ong (Grab)
        ( 3, 'Retirement',             800000,   22),

        ( 7, 'Car Purchase',            60000,    4),   -- Frank Lee (Grab)
        ( 7, 'Retirement',             500000,   20),

        ( 8, 'Car Purchase',            70000,    3),   -- Grace Tan (Grab)
        ( 8, 'Retirement',             450000,   18),

        ( 9, 'Education Fund',         120000,    5),   -- Henry Chua (Shopee)
        ( 9, 'Vacation',                20000,    2),

        (10, 'Education Fund',          90000,    6),   -- Irene Koh (Shopee)
        (10, 'Retirement',             550000,   22),

        (11, 'Vacation',                15000,    2),   -- Jack Ng (DBS)
        (11, 'Monthly Passive Income', 300000,   10),

        (12, 'Vacation',                18000,    2),   -- Kelly Lim (DBS)
        (12, 'Retirement',             480000,   19),

        (13, 'Car Purchase',            75000,    3),   -- Leo Goh (Standard Chartered)
        (13, 'Education Fund',          95000,    7),
        (13, 'Monthly Passive Income',          95000,    7),

        (14, 'Monthly Passive Income', 400000,   12),  -- Maya Wong (Standard Chartered)
        (14, 'Vacation',                25000,    3),
        (14, 'Retirement',             600000,   25);
END
