IF OBJECT_ID(N'dbo.Financial_Goal', 'U') IS NOT NULL
BEGIN
    INSERT INTO dbo.Financial_Goal (InvestorID, Goal, Amount, Timeline, StartDate)
    VALUES
        (1, 'Residential property purchase',              500000, 5, 1672531200),   -- 2028 − 2023 = 5 years
        (1, 'Retirement',             800000, 22, 1672531200),  -- 2045 − 2023 = 22 years
        (4, 'Vacation',                15000, 2, 1672531200),   -- 2025 − 2023 = 2 years
        (5, 'Residential property purchase', 600000, 12, 1672531200),  -- 2035 − 2023 = 12 years
        (6, 'Become king of pirates', 900000, 12, 1672531200),  -- 2035 − 2023 = 12 years
        ( 2, 'Car Purchase',            80000,    3, 1704045600),   -- Ben Lim (Shopee) 2024 Jan
        ( 2, 'Vacation',                15000,    2, 1704047600),
        ( 2, 'Residential property purchase', 200000,    8, 1704048600),

        ( 3, 'Education Fund',         100000,    7, 1714500000),   -- Cynthia Ong (Grab)
        ( 3, 'Become king of pirates',             800000,   22, 1714520000),

        ( 7, 'Car Purchase',            60000,    4, 1714600000),   -- Frank Lee (Grab)
        ( 7, 'Retirement',             500000,   20, 1714700000),

        ( 8, 'Car Purchase',            70000,    3, 1719870400),   -- Grace Tan (Grab)
        ( 8, 'Become king of pirates',             450000,   18, 1719970400),

        ( 9, 'Education Fund',         120000,    5, 1719770400),   -- Henry Chua (Shopee)
        ( 9, 'Vacation',                20000,    2, 1719780400),

        (10, 'Education Fund',          90000,    6, 1719770400),   -- Irene Koh (Shopee)
        (10, 'Retirement',             550000,   22, 1719780400),

        (11, 'Vacation',                15000,    2, 1719770400),   -- Jack Ng (DBS)
        (11, 'Become king of pirates', 300000,   10, 1719780400),

        (12, 'Vacation',                18000,    2, 1719770400),   -- Kelly Lim (DBS)
        (12, 'Retirement',             480000,   19, 1719780400),

        (13, 'Car Purchase',            75000,    3, 1719770400),   -- Leo Goh (Standard Chartered)
        (13, 'Education Fund',          95000,    7, 1719780400),
        (13, 'Become king of pirates',          95000,    7, 1672531200),

        (14, 'Become king of pirates', 400000,   12, 1719770400),  -- Maya Wong (Standard Chartered)
        (14, 'Vacation',                25000,    3, 1719780400),
        (14, 'Retirement',             600000,   25, 1672531200);
END