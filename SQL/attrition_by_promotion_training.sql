SELECT 
    CASE
        WHEN YearsSinceLastPromotion = 0 THEN 'Recently Promoted'
        WHEN YearsSinceLastPromotion BETWEEN 1 AND 3 THEN '1-3 Years Since Promotion'
        WHEN YearsSinceLastPromotion BETWEEN 4 AND 7 THEN '4-7 Years Since Promotion'
        ELSE '8+ Years Since Promotion'
    END AS PromotionGap,

    CASE
        WHEN TrainingTimesLastYear = 0 THEN 'No Training'
        WHEN TrainingTimesLastYear BETWEEN 1 AND 2 THEN 'Low Training (1-2)'
        WHEN TrainingTimesLastYear BETWEEN 3 AND 4 THEN 'Moderate Training (3-4)'
        ELSE 'High Training (5+)'
    END AS TrainingLevel,

    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS AttritionCount,
    ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS AttritionRate

FROM emp
GROUP BY PromotionGap, TrainingLevel
ORDER BY AttritionRate DESC;
