import csv
import pyodbc

# Kreston Pretoria Portfolio Showcase: CSV Automation Script
# This script automates the manual process of migrating patient data from a CSV export into the SQL Server database.

def import_patients_from_csv(csv_filepath):
    print(f"[INFO] Starting automated data import from {csv_filepath}...")
    
    # Establish connection to SQL Server
    try:
        conn = pyodbc.connect(
            'DRIVER={ODBC Driver 17 for SQL Server};'
            'SERVER=localhost;'
            'DATABASE=HospitalManagement;'
            'Trusted_Connection=yes;'
        )
        cursor = conn.cursor()
        
        # Open and read the CSV file
        with open(csv_filepath, mode='r') as file:
            csv_reader = csv.DictReader(file)
            insert_query = """
                INSERT INTO Patients (FullName, DOB, Phone, InsuranceProvider)
                VALUES (?, ?, ?, ?)
            """
            
            # Loop through CSV rows and insert into database
            success_count = 0
            for row in csv_reader:
                cursor.execute(insert_query, row['FullName'], row['DOB'], row['Phone'], row['InsuranceProvider'])
                success_count += 1
                
        # Commit the transaction
        conn.commit()
        print(f"[SUCCESS] Successfully imported {success_count} patient records into the database.")
        
    except Exception as e:
        print(f"[ERROR] Database integration failed: {e}")
    finally:
        if 'conn' in locals():
            conn.close()

if __name__ == "__main__":
    import_patients_from_csv('patients.csv')