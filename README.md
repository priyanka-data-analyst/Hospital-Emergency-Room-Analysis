🏥 Hospital Emergency Room Volume & Wait Time Analysis

🎯 Project Overview

This project analyzes 9,216 patient records from a Hospital Emergency Room to identify operational bottlenecks, patient wait-time trends, and department efficiency.
The goal was to build an End-to-End Data Pipeline—taking raw, messy data, processing it with Python, storing it in a cloud data warehouse (Snowflake), and visualizing actionable insights in Power BI.

📊 Executive Summary of Insights

⁕ Critical Bottleneck Identified: Patient wait times spike by 40% on Monday evenings (6 PM - 9 PM), indicating a need for shift-rostering adjustments.
⁕ Demographic Disparity: Seniors (Age 65+) report higher satisfaction scores (6.8/10) compared to Young Adults (4.2/10), despite similar wait times.
⁕ Department Performance: The General Practice department has the highest average wait time (45 mins), suggesting triage inefficiencies.

🛠️ Tech Stack & Architecture

⁕ Python (Pandas): Data Cleaning, Feature Engineering (Age Segmentation), and Schema Standardization.
⁕ Snowflake (SQL): Cloud Data Warehousing, Table Architecture, and Bulk Data Loading.
⁕ Power BI (DAX): Executive Dashboarding, Heatmaps, and Cross-Filtering logic.

⚙️ The Process (Step-by-Step)

👉 Step 1: Data Engineering with Python

Raw data from Kaggle often contains formatting issues (spaces in column names) and lacks analytical features. I used Python to:

⁕ Standardize Schema: Replaced spaces in column names with underscores (e.g., Patient Waittime → Patient_Waittime) to prevent SQL loading errors.
⁕ Feature Engineering: Created a new Age_Group column. instead of analyzing 90 individual ages, I grouped them into Child, Teen, Adult, and Senior for better demographic     analysis.
⁕ Handling Nulls: Imputed missing wait times with the departmental average.

Python Code Snippet:

⁕ Feature Engineering: Creating Age Groups for Demographic Analysis
bins = [0, 18, 35, 65, 120]
labels = ['Child/Teen', 'Young Adult', 'Adult', 'Senior']
df['Age_Group'] = pd.cut(df['Patient_Age'], bins=bins, labels=labels)

⁕ Schema Standardization for Snowflake
df.columns = df.columns.str.replace(' ', '_')

👉 Step 2: Cloud Warehousing with Snowflake

I chose Snowflake for its scalability and separation of storage/compute.
Database Architecture: Created a structured HOSPITAL_DB with a dedicated ER_DATA schema.
Table Creation: Defined strict data types (INTEGER vs VARCHAR) to ensure data integrity.
Data Loading: Created a custom File Format (ISO-8859-1) to handle special characters during the bulk load of the CSV.

Snowflake SQL Snippet:
⁕ CREATE OR REPLACE TABLE HOSPITAL_DB.ER_DATA.ER_VISITS (
    Patient_Id VARCHAR(50),
    Patient_Admission_Date VARCHAR(50),
    Patient_Age INTEGER,
    Patient_Waittime INTEGER,
    Age_Group VARCHAR(50) -- The custom Python feature
    ...
);

👉 Step 3: Visualization with Power BI

The final dashboard focuses on Operational Efficiency and Health Equity.
⁕ Heatmap: Visualizes traffic volume by Day of Week vs Hour of Day to pinpoint staffing gaps.
⁕ Health Equity Check: A bar chart comparing Wait Time by Patient Race to identify potential bias in care delivery.
⁕ KPI Cards: Tracking Total Visits (9K+) and Average Satisfaction Score (5.4).

📂 File Structure

⁕ hospital_data_cleaning.py: The Python script for ETL.
⁕ snowflake_setup.sql: The SQL commands to build the Warehouse and Table.
⁕ hospital_dashboard.pbix: The final Power BI report file.
⁕ cleaned_hospital_data.csv: The processed dataset ready for upload.

🚀 How to Run This Project

⁕ Clone the Repo: git clone https://github.com/YourUsername/Hospital-ER-Analysis.git
⁕ Run Python Script: Execute hospital_data_cleaning.py to generate the clean CSV.
⁕ Setup Snowflake: Run the SQL script in your Snowflake Worksheet to create the database.
⁕ Load Data: Use the Snowflake "Load Data" wizard to upload the CSV.
⁕ View Dashboard: Open .pbix file, change the Data Source settings to point to your Snowflake instance.

💡 Business Impact

This dashboard allows Hospital Administrators to move from reactive (fixing problems after complaints) to proactive (scheduling staff before the Monday rush occurs). The Age_Group analysis further assists in tailoring patient care protocols for different demographics.

🌐Author 
Priyanka Deshpande 
Data Analyst

# Hospital-Emergency-Room-Analysis
End-to-End Data Engineering project using python, Snowflake, and Power BI
