SELECT 
    JobRole,
    CASE 
        WHEN Age < 30 THEN 'Early Career (<30)'
        WHEN Age BETWEEN 30 AND 40 THEN 'Mid Career (30-40)'
        WHEN Age BETWEEN 40 AND 50 THEN 'Experienced (40-50)'
        ELSE 'Late Career (50+)'
    END AS AgeGroup,

    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS AttritionCount,
    ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS AttritionRate

FROM emp
GROUP BY JobRole, AgeGroup
ORDER BY AttritionRate,Department DESC;
