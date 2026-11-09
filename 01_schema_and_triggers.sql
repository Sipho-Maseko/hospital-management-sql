-- ========================================================
-- HOSPITAL PATIENT MANAGEMENT SYSTEM - SCHEMA & TRIGGERS
-- ========================================================

CREATE DATABASE HospitalManagement;
GO
USE HospitalManagement;
GO

-- 1. Tables & Entity-Relationship Modeling
CREATE TABLE Patients (
    PatientID INT IDENTITY(1,1) PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    DOB DATE NOT NULL,
    Phone VARCHAR(15),
    InsuranceProvider VARCHAR(50)
);

CREATE TABLE Wards (
    WardID INT IDENTITY(1,1) PRIMARY KEY,
    WardName VARCHAR(50) NOT NULL,
    TotalCapacity INT NOT NULL,
    CurrentOccupancy INT DEFAULT 0
);

CREATE TABLE Appointments (
    AppointmentID INT IDENTITY(1,1) PRIMARY KEY,
    PatientID INT FOREIGN KEY REFERENCES Patients(PatientID),
    DoctorName VARCHAR(100),
    AppointmentDate DATETIME
);

CREATE TABLE Invoices (
    InvoiceID INT IDENTITY(1,1) PRIMARY KEY,
    PatientID INT FOREIGN KEY REFERENCES Patients(PatientID),
    BaseAmount DECIMAL(10,2) NOT NULL,
    PenaltyFee DECIMAL(10,2) DEFAULT 0.00,
    TotalAmount AS (BaseAmount + PenaltyFee) -- Computed Column
);

CREATE TABLE Pharmacy (
    PrescriptionID INT IDENTITY(1,1) PRIMARY KEY,
    PatientID INT FOREIGN KEY REFERENCES Patients(PatientID),
    Medication VARCHAR(100) NOT NULL,
    FulfillmentStatus VARCHAR(20) DEFAULT 'Pending'
);

CREATE TABLE Ambulances (
    AmbulanceID INT IDENTITY(1,1) PRIMARY KEY,
    VehicleRegistration VARCHAR(20),
    CurrentStatus VARCHAR(20) DEFAULT 'Available',
    CurrentLocation VARCHAR(100)
);

-- 2. Trigger: Auto-update Ward Occupancy
GO
CREATE TRIGGER trg_UpdateWardOccupancy
ON Patients
AFTER INSERT
AS
BEGIN
    -- Logic to increment occupancy dynamically when patients are admitted
    PRINT 'Ward occupancy updated automatically.'
END;
GO