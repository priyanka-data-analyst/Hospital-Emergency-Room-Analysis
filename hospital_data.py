import pandas as pd

# 1. LOAD DATA
print("Loading data...")
try:
    df = pd.read_csv('Hospital ER_Data.csv', encoding='ISO-8859-1')
    print(f"✅ Loaded {len(df)} rows.")
except FileNotFoundError:
    print("❌ Error: Check filename. It must be 'Hospital ER_Data.csv'")
    exit()

# 2. AUTO-FIX COLUMN NAMES (The Pro Move)
# This replaces spaces with underscores (e.g., "Patient Age" -> "Patient_Age")
df.columns = df.columns.str.replace(' ', '_')
print("✅ Column names fixed (Spaces removed).")

# 3. CREATE AGE GROUP
# Now we use the underscore name: 'Patient_Age'
bins = [0, 18, 35, 65, 120]
labels = ['Child/Teen', 'Young Adult', 'Adult', 'Senior']
df['Age_Group'] = pd.cut(df['Patient_Age'], bins=bins, labels=labels)

# 4. FILL MISSING WAIT TIMES
# Now we use the underscore name: 'Patient_Waittime'
avg_wait = df['Patient_Waittime'].mean()
df['Patient_Waittime'] = df['Patient_Waittime'].fillna(avg_wait)

# 5. SAVE CLEAN FILE
df.to_csv('cleaned_hospital_data.csv', index=False)
print("✅ Success! Created 'cleaned_hospital_data.csv'")