SELECT TOP 3 Goal, COUNT(*) Count FROM Financial_Goal
GROUP BY Goal
ORDER BY Count DESC;