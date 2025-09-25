SELECT 
	CASE
		WHEN DistanceFromHome BETWEEN 1 AND 5 THEN 'VERY CLOSE(1-5)'
        WHEN DistanceFromHome BETWEEN 6 AND 10 THEN 'CLOSE(6-10)'
        WHEN DistanceFromHome BETWEEN 11 AND 20 THEN 'MODERATE(11-20)'
        ELSE 'FAR(20+)'
	END DistanceBand,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AttritionCount,
ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100/COUNT(*),2) AttritionRate_By_Distance
FROM emp
GROUP BY DistanceBand
ORDER BY AttritionRate_By_Distance;
