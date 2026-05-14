CREATE DATABASE IF NOT EXISTS healthcare_project;
USE healthcare_project;
CREATE DATABASE healthcare_project;
USE healthcare_project;
SHOW DATABASES;
USE healthcare_project;

CREATE TABLE blood_data (
    Glucose FLOAT,
    Cholesterol FLOAT,
    Hemoglobin FLOAT,
    Platelets FLOAT,
    White_Blood_Cells FLOAT,
    Red_Blood_Cells FLOAT,
    Hematocrit FLOAT,
    Mean_Corpuscular_Volume FLOAT,
    Mean_Corpuscular_Hemoglobin FLOAT,
    Mean_Corpuscular_Hemoglobin_Concentration FLOAT,
    Insulin FLOAT,
    BMI FLOAT,
    Systolic_Blood_Pressure FLOAT,
    Diastolic_Blood_Pressure FLOAT,
    Triglycerides FLOAT,
    HbA1c FLOAT,
    LDL_Cholesterol FLOAT,
    HDL_Cholesterol FLOAT,
    ALT FLOAT,
    AST FLOAT,
    Heart_Rate FLOAT,
    Creatinine FLOAT,
    Troponin FLOAT,
    C_reactive_Protein FLOAT,
    Disease VARCHAR(100)
);
SELECT COUNT(*) AS total_rows FROM blood_data;
USE healthcare_project;
SELECT * FROM blood_data LIMIT 10;
SELECT
    SUM(CASE WHEN Glucose IS NULL THEN 1 ELSE 0 END) AS missing_glucose,
    SUM(CASE WHEN Cholesterol IS NULL THEN 1 ELSE 0 END) AS missing_cholesterol,
    SUM(CASE WHEN Hemoglobin IS NULL THEN 1 ELSE 0 END) AS missing_hemoglobin,
    SUM(CASE WHEN Platelets IS NULL THEN 1 ELSE 0 END) AS missing_platelets,
    SUM(CASE WHEN White_Blood_Cells IS NULL THEN 1 ELSE 0 END) AS missing_wbc,
    SUM(CASE WHEN Red_Blood_Cells IS NULL THEN 1 ELSE 0 END) AS missing_rbc,
    SUM(CASE WHEN BMI IS NULL THEN 1 ELSE 0 END) AS missing_bmi,
    SUM(CASE WHEN Disease IS NULL THEN 1 ELSE 0 END) AS missing_disease
FROM blood_data;
SHOW COLUMNS FROM blood_data;
SELECT
    SUM(CASE WHEN Glucose IS NULL THEN 1 ELSE 0 END) AS missing_glucose,
    SUM(CASE WHEN Cholesterol IS NULL THEN 1 ELSE 0 END) AS missing_cholesterol,
    SUM(CASE WHEN Hemoglobin IS NULL THEN 1 ELSE 0 END) AS missing_hemoglobin,
    SUM(CASE WHEN Platelets IS NULL THEN 1 ELSE 0 END) AS missing_platelets,
    SUM(CASE WHEN `White Blood Cells` IS NULL THEN 1 ELSE 0 END) AS missing_wbc,
    SUM(CASE WHEN `Red Blood Cells` IS NULL THEN 1 ELSE 0 END) AS missing_rbc,
    SUM(CASE WHEN BMI IS NULL THEN 1 ELSE 0 END) AS missing_bmi,
    SUM(CASE WHEN Disease IS NULL THEN 1 ELSE 0 END) AS missing_disease
FROM blood_data;
SELECT 
    Disease,
    COUNT(*) AS total_patients
FROM blood_data
GROUP BY Disease
ORDER BY total_patients DESC;
SELECT
    Disease,
    COUNT(*) AS high_risk_patients
FROM blood_data
WHERE Glucose > 150 AND BMI > 30
GROUP BY Disease
ORDER BY high_risk_patients DESC;
SELECT
    Disease,
    ROUND(AVG(Glucose), 2) AS avg_glucose,
    ROUND(AVG(Cholesterol), 2) AS avg_cholesterol,
    ROUND(AVG(Hemoglobin), 2) AS avg_hemoglobin,
    ROUND(AVG(BMI), 2) AS avg_bmi,
    ROUND(AVG(HbA1c), 2) AS avg_hba1c
FROM blood_data
GROUP BY Disease
ORDER BY Disease;
SELECT
    Disease,
    ROUND(AVG(`Heart Rate`), 2) AS avg_heart_rate,
    ROUND(MIN(`Heart Rate`), 2) AS min_heart_rate,
    ROUND(MAX(`Heart Rate`), 2) AS max_heart_rate
FROM blood_data
GROUP BY Disease
ORDER BY avg_heart_rate DESC;
SELECT
    Disease,
    ROUND(AVG(`LDL Cholesterol`), 2) AS avg_ldl,
    ROUND(AVG(`HDL Cholesterol`), 2) AS avg_hdl,
    ROUND(AVG(Triglycerides), 2) AS avg_triglycerides
FROM blood_data
GROUP BY Disease
ORDER BY avg_ldl DESC;
SELECT
    Disease,
    ROUND(AVG(`Systolic Blood Pressure`), 2) AS avg_systolic,
    ROUND(AVG(`Diastolic Blood Pressure`), 2) AS avg_diastolic,
    COUNT(CASE WHEN `Systolic Blood Pressure` > 140 THEN 1 END) AS hypertension_count
FROM blood_data
GROUP BY Disease
ORDER BY avg_systolic DESC;
SELECT
    Disease,
    ROUND(AVG(ALT), 2) AS avg_alt,
    ROUND(AVG(AST), 2) AS avg_ast,
    COUNT(CASE WHEN ALT > 40 THEN 1 END) AS high_alt_count
FROM blood_data
GROUP BY Disease
ORDER BY avg_alt DESC;
SELECT
    COUNT(*) AS total_patients,
    ROUND(AVG(Glucose), 2) AS avg_glucose,
    ROUND(AVG(BMI), 2) AS avg_bmi,
    ROUND(AVG(Cholesterol), 2) AS avg_cholesterol,
    ROUND(AVG(`Heart Rate`), 2) AS avg_heart_rate,
    -- COMPLETE HEALTHCARE ANALYSIS REPORT

-- 1. Disease Distribution
SELECT 'Disease Distribution' AS Analysis_Type,
    Disease, COUNT(*) AS total_patients,
    NULL AS avg_glucose, NULL AS avg_bmi
FROM blood_data
GROUP BY Disease

UNION ALL

-- 2. Average Blood Values by Disease
SELECT 'Avg Blood Values' AS Analysis_Type,
    Disease,
    COUNT(*) AS total_patients,
    ROUND(AVG(Glucose), 2) AS avg_glucose,
    ROUND(AVG(BMI), 2) AS avg_bmi
FROM blood_data
GROUP BY Disease;
    ROUND(AVG(HbA1c), 2) AS avg_hba1c,
    ROUND(AVG(Creatinine), 2) AS avg_creatinine
FROM blood_data;
-- 1. Disease Distribution
SELECT Disease, COUNT(*) AS total_patients
FROM blood_data
GROUP BY Disease
ORDER BY total_patients DESC;
-- 2. Average Blood Values by Disease
SELECT
    Disease,
    ROUND(AVG(Glucose), 2) AS avg_glucose,
    ROUND(AVG(Cholesterol), 2) AS avg_cholesterol,
    ROUND(AVG(Hemoglobin), 2) AS avg_hemoglobin,
    ROUND(AVG(BMI), 2) AS avg_bmi,
    ROUND(AVG(HbA1c), 2) AS avg_hba1c
FROM blood_data
GROUP BY Disease
ORDER BY Disease;
-- 3. Overall Summary
SELECT
    COUNT(*) AS total_patients,
    ROUND(AVG(Glucose), 2) AS avg_glucose,
    ROUND(AVG(BMI), 2) AS avg_bmi,
    ROUND(AVG(Cholesterol), 2) AS avg_cholesterol,
    ROUND(AVG(`Heart Rate`), 2) AS avg_heart_rate,
    ROUND(AVG(HbA1c), 2) AS avg_hba1c,
    ROUND(AVG(Creatinine), 2) AS avg_creatinine
FROM blood_data;