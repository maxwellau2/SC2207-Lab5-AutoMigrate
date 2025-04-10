-- Q6. Find the most popular financial goals for investors working in the same company and whose age is between 30 to 40 years old.

WITH EligibleGoals AS (
    SELECT 
        i.Company,
        fg.Goal,
        COUNT(*) AS GoalCount
    FROM dbo.Investor i
    INNER JOIN dbo.Financial_Goal fg 
        ON i.InvestorID = fg.InvestorID
    WHERE 
        -- Compute age using DATEDIFF of years from the date of birth.
        -- DATEADD converts the stored epoch seconds to a DATETIME.
        DATEDIFF(YEAR, DATEADD(SECOND, i.DoB, '1970-01-01'), GETDATE()) BETWEEN 30 AND 40
    GROUP BY 
        i.Company, 
        fg.Goal
), RankedGoals AS (
    SELECT 
        Company,
        Goal,
        GoalCount,
        RANK() OVER (PARTITION BY Company ORDER BY GoalCount DESC) AS rnk
    FROM EligibleGoals
)
SELECT 
    Company, 
    Goal, 
    GoalCount
FROM RankedGoals
WHERE rnk = 1;
