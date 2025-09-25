CREATE OR REPLACE VIEW vw_attrition_dashboard AS
SELECT
    EmployeeNumber,
    Age,
    Gender,
    Department,
    JobRole,
    BusinessTravel,
    DistanceFromHome,
    MonthlyIncome,
    YearsAtCompany,
    OverTime,
    Attrition,
    TotalWorkingYears,
    NumCompaniesWorked,
    YearsSinceLastPromotion,
    TrainingTimesLastYear,
    EducationField,

    -- Derived: Age Group
    CASE 
        WHEN Age < 30 THEN 'Early Career (<30)'
        WHEN Age BETWEEN 30 AND 40 THEN 'Mid Career (30-40)'
        WHEN Age BETWEEN 40 AND 50 THEN 'Experienced (40-50)'
        ELSE 'Late Career (50+)'
    END AS AgeGroup,

    -- Derived: Salary Band
    CASE 
        WHEN MonthlyIncome < 5000 THEN 'Low Salary (<5K)'
        WHEN MonthlyIncome BETWEEN 5000 AND 10000 THEN 'Mid Salary (5K-10K)'
        WHEN MonthlyIncome BETWEEN 10000 AND 15000 THEN 'Upper Mid Salary (10K-15K)'
        ELSE 'High Salary (15K+)'
    END AS SalaryBand,

    -- Derived: Distance Band
    CASE
        WHEN DistanceFromHome BETWEEN 1 AND 5 THEN 'Very Close (1-5)'
        WHEN DistanceFromHome BETWEEN 6 AND 10 THEN 'Close (6-10)'
        WHEN DistanceFromHome BETWEEN 11 AND 20 THEN 'Moderate (11-20)'
        ELSE 'Far (20+)'
    END AS DistanceBand,

    -- Derived: Employee Type
    CASE
        WHEN TotalWorkingYears = 0 AND NumCompaniesWorked = 0 THEN 'Fresher'

        WHEN TotalWorkingYears <= 5 AND NumCompaniesWorked >= 3 THEN 'Early Job Hopper'
        WHEN TotalWorkingYears <= 5 AND NumCompaniesWorked < 3 THEN 'Junior Stable'

        WHEN TotalWorkingYears <= 15 AND NumCompaniesWorked >= 5 THEN 'Mid Career Hopper'
        WHEN TotalWorkingYears <= 15 AND NumCompaniesWorked < 5 THEN 'Stable Professional'

        WHEN TotalWorkingYears > 15 AND NumCompaniesWorked >= 6 THEN 'High Experience Hopper'
        WHEN TotalWorkingYears > 15 AND NumCompaniesWorked < 6 THEN 'Loyal Expert'

        ELSE 'Unknown'
    END AS EmployeeType,

    -- Derived: Promotion Gap
    CASE
        WHEN YearsSinceLastPromotion = 0 THEN 'Recently Promoted'
        WHEN YearsSinceLastPromotion BETWEEN 1 AND 3 THEN '1-3 Years Since Promotion'
        WHEN YearsSinceLastPromotion BETWEEN 4 AND 7 THEN '4-7 Years Since Promotion'
        ELSE '8+ Years Since Promotion'
    END AS PromotionGap,

    -- Derived: Training level
    CASE
        WHEN TrainingTimesLastYear = 0 THEN 'No Training'
        WHEN TrainingTimesLastYear BETWEEN 1 AND 2 THEN 'Low Training (1-2)'
        WHEN TrainingTimesLastYear BETWEEN 3 AND 4 THEN 'Moderate Training (3-4)'
        ELSE 'High Training (5+)'
    END AS TrainingLevel
FROM emp;
