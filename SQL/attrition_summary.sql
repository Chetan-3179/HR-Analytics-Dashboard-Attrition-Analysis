SELECT ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100/COUNT(*),2) Attrition_rate
FROM emp;

SELECT ROUND(AVG(MonthlyIncome),2) Avg_Salary, ROUND(AVG(YearsAtCompany),2) Avg_Tenure
FROM emp;

SELECT COUNT(*) Active_Employees
FROM emp
WHERE Attrition="No";

SELECT SUM(CASE WHEN Attrition="Yes" THEN 1 ELSE 0 END) Attrition_Count
FROM emp;

SELECT COUNT(*) Total_Employees
FROM emp;
