-- HOSPITAL EMERGENCY ROOM PROJECT
-- Database Setup & Table Creation Code

-- 1. Setup the Architecture
CREATE WAREHOUSE IF NOT EXISTS HOSPITAL_WH WITH WAREHOUSE_SIZE = 'X-SMALL';
CREATE DATABASE IF NOT EXISTS HOSPITAL_DB;
CREATE SCHEMA IF NOT EXISTS HOSPITAL_DB.ER_DATA;

-- 2. Create the Table 
-- Note: Column names match the Python-cleaned CSV (spaces replaced with underscores)
CREATE OR REPLACE TABLE HOSPITAL_DB.ER_DATA.ER_VISITS (
    Patient_Id VARCHAR(50),
    Patient_Admission_Date VARCHAR(50),
    Patient_First_Inital VARCHAR(10),
    Patient_Last_Name VARCHAR(50),
    Patient_Gender VARCHAR(10),
    Patient_Age INTEGER,
    Patient_Race VARCHAR(50),
    Department_Referral VARCHAR(100),
    Patient_Admission_Flag VARCHAR(10),
    Patient_Satisfaction_Score INTEGER,
    Patient_Waittime INTEGER,
    Patients_CM VARCHAR(255),
    Age_Group VARCHAR(50)
);

-- 3. Data Loading Note
-- Data was loaded via Snowflake Web Interface (Classic Console) 
-- utilizing a CSV File Format with ISO-8859-1 encoding.