SELECT
	Gender,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) Attrition_Count,
    ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100/COUNT(*),2) Attrition_Rate
FROM emp
GROUP BY Gender;
