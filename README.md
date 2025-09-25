# **HR Analytics Dashboard – Attrition Analysis**

---
## **Project Overview**

This project analyzes employee attrition patterns using the IBM HR Analytics Employee Attrition & Performance Dataset.
The goal is to identify the key drivers of attrition and provide actionable insights for HR teams to improve retention and workforce stability.

I designed the solution in three layers:

Data Preparation (SQL & Python) → Built SQL views to clean and transform data (Age bands, Salary bands, Distance bands, Promotion gaps, etc.).

KPI & Deep-Dive Analysis → Developed queries to calculate attrition rates across different dimensions (Department, Gender, Salary, Age, Distance, Job Role).

Interactive Dashboard (Power BI) → Designed a consulting-style dashboard with executive KPIs, core drivers, and advanced insights.

---

## **Tech Stack**

- SQL (MySQL) → Data preparation & KPI queries

- Python (Pandas, Matplotlib) → Exploratory analysis & quick validation

- Power BI → Interactive dashboard & visualization

---

## **Key Features**

- Executive KPIs → Attrition Rate, Average Salary, Average Tenure, Total Employees
- Attrition Analysis by Core Drivers → Department, Age Group, Gender, Salary Band, Education Field
- Deep-Dive Insights:

    + Salary × Distance Heatmap (Low salary dominates attrition risk even if distance is low)

    + Overtime × Distance Analysis (work-life balance stressors)

    + Promotion Gap × Training Analysis (lack of career growth drives attrition)

    + JobRole × AgeGroup × Department (which roles at which career stage are most at risk)

 ---

 ## **Dashboard Preview**
 <img width="1226" height="686" alt="image" src="https://github.com/user-attachments/assets/48a768cd-931e-410a-a183-b8eb6d16216f" />

---

## **Insights & Impact**

- Early career employees (<30) have the highest attrition.

- Low salary employees contribute disproportionately to attrition, regardless of commute distance.

- Employees without promotion for 4+ years and limited training show higher attrition rates.

- Sales and R&D departments face the most attrition challenges.

These insights can help HR design better retention strategies focusing on compensation, training, and career growth opportunities.

