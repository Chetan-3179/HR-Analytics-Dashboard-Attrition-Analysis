SELECT 
    CASE 
        WHEN MonthlyIncome < 5000 THEN 'Low Salary (<5K)'
        WHEN MonthlyIncome BETWEEN 5000 AND 10000 THEN 'Mid Salary (5K-10K)'
        WHEN MonthlyIncome BETWEEN 10000 AND 15000 THEN 'Upper Mid Salary (10K-15K)'
        ELSE 'High Salary (15K+)'
    END AS SalaryBand,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS AttritionRate
FROM emp
GROUP BY SalaryBand
ORDER BY AttritionRate DESC;
