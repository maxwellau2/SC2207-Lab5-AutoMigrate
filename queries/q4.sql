-- Q4. What is the top three most popular first financial goals for investors in 2024?

-- partition fn will split by investorid into subtables, and sort by start date. RANK will assign rank in asc order

WITH RankedGoals AS(
	SELECT f.InvestorID,
		f.Goal,
		f.Amount,
		f.StartDate,
		f.Timeline,
		RANK() OVER (
			PARTITION BY f.InvestorID
			ORDER BY f.StartDate ASC
		) as ranknum
	FROM Financial_Goal f
	WHERE DATEPART(YEAR, DATEADD(SECOND, f.StartDate, '1970-01-01')) = 2024
)
SELECT * FROM RankedGoals

-- since we want the first goal of 2024, we only consider rank 1
-- Then pick the top 3
SELECT TOP 3 COUNT(Goal) as Occurence, Goal FROM RankedGoals
WHERE ranknum=1
GROUP BY Goal;