SELECT 
	Department,
	COUNT(*) Total_employees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) Attrition_Count,
    ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100/COUNT(*),2) Attrition_rate
FROM emp
GROUP BY Department
ORDER BY Attrition_rate;
