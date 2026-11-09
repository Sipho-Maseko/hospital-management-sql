from fastapi import FastAPI, HTTPException
import pyodbc

# Kreston Pretoria Portfolio Showcase: REST API Wrapper
# This API exposes internal SQL database metrics to external hospital dashboards via JSON.

app = FastAPI(title="Hospital Management Integration API")

def get_db_connection():
    return pyodbc.connect(
        'DRIVER={ODBC Driver 17 for SQL Server};'
        'SERVER=localhost;'
        'DATABASE=HospitalManagement;'
        'Trusted_Connection=yes;'
    )

@app.get("/")
def health_check():
    return {"status": "active", "message": "Hospital Management API is running."}

@app.get("/api/invoices/high-value")
def get_high_value_invoices():
    """
    Fetches high-value patient accounts for executive audit review.
    Returns data in JSON format.
    """
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        
        # Execute the high-value audit query
        cursor.execute("""
            SELECT InvoiceID, PatientID, TotalAmount 
            FROM Invoices 
            WHERE TotalAmount > 10000.00 
            ORDER BY TotalAmount DESC
        """)
        
        # Format the SQL results into a JSON-friendly dictionary
        invoices = []
        for row in cursor.fetchall():
            invoices.append({
                "invoice_id": row.InvoiceID,
                "patient_id": row.PatientID,
                "total_amount_zar": float(row.TotalAmount)
            })
            
        return {"audit_count": len(invoices), "data": invoices}
        
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        if 'conn' in locals():
            conn.close()