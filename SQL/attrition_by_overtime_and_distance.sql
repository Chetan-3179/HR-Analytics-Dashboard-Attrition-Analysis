SELECT 
    OverTime,
    CASE
        WHEN DistanceFromHome <= 5 THEN 'Very Close'
        WHEN DistanceFromHome <= 10 THEN 'Close'
        WHEN DistanceFromHome <= 20 THEN 'Moderate'
        ELSE 'Far'
    END AS DistanceBand,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS AttritionCount,
    ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS AttritionRate
FROM emp
GROUP BY OverTime, DistanceBand
ORDER BY AttritionRate DESC;
