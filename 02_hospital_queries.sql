-- ========================================================
-- HOSPITAL SYSTEM - 10 CORE OPERATIONAL QUERIES
-- ========================================================

-- 1. Ambulance Tracking (Find active/dispatched ambulances)
SELECT AmbulanceID, VehicleRegistration, CurrentLocation 
FROM Ambulances 
WHERE CurrentStatus = 'Dispatched';

-- 2. Patient Phone Filtering (Search by specific area code)
SELECT FullName, Phone 
FROM Patients 
WHERE Phone LIKE '082%';

-- 3. Dynamic Insurance Searches
SELECT FullName, InsuranceProvider 
FROM Patients 
WHERE InsuranceProvider IS NOT NULL 
ORDER BY InsuranceProvider;

-- 4. Penalty Fee Calculations (Stored Procedure Logic)
UPDATE Invoices 
SET PenaltyFee = BaseAmount * 0.10 
WHERE InvoiceID IN (SELECT InvoiceID FROM Invoices WHERE BaseAmount > 5000);

-- 5. Patient Ages (Calculate age dynamically from DOB)
SELECT FullName, 
       DATEDIFF(YEAR, DOB, GETDATE()) AS CalculatedAge 
FROM Patients;

-- 6. Executive Financial Summaries (Total revenue per provider)
SELECT P.InsuranceProvider, SUM(I.TotalAmount) AS TotalRevenue
FROM Patients P
JOIN Invoices I ON P.PatientID = I.PatientID
GROUP BY P.InsuranceProvider;

-- 7. Ward Occupancy (Calculate remaining capacity)
SELECT WardName, 
       TotalCapacity, 
       CurrentOccupancy, 
       (TotalCapacity - CurrentOccupancy) AS RemainingBeds 
FROM Wards;

-- 8. Daily Appointments (Filter for today's schedule)
SELECT A.AppointmentID, P.FullName, A.DoctorName, A.AppointmentDate 
FROM Appointments A
JOIN Patients P ON A.PatientID = P.PatientID
WHERE CAST(A.AppointmentDate AS DATE) = CAST(GETDATE() AS DATE);

-- 9. High-Value Invoices (Flag critical accounts)
SELECT InvoiceID, PatientID, TotalAmount 
FROM Invoices 
WHERE TotalAmount > 10000.00 
ORDER BY TotalAmount DESC;

-- 10. Pharmacy Prescription Fulfillments
SELECT PrescriptionID, PatientID, Medication 
FROM Pharmacy 
WHERE FulfillmentStatus = 'Pending';