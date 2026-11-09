# Hospital Patient Management System (SQL Architecture)

## Overview
A robust relational database system designed to manage core hospital operations, patient records, and financial billing. Built with SQL Server, this project demonstrates advanced multi-table entity-relationship (ER) modeling, data integrity enforcement via triggers, and complex operational querying for healthcare administration.

## Database Architecture
The system is built on a highly normalized relational schema comprising the following core tables:
* **Patients:** Stores demographic and insurance provider data.
* **Wards:** Manages hospital capacity and dynamic occupancy tracking.
* **Appointments:** Tracks daily doctor schedules and patient visits.
* **Invoices:** Handles financial billing and dynamic penalty fee calculations.
* **Pharmacy:** Tracks medication fulfillment statuses.
* **Ambulances:** Monitors live dispatch statuses and vehicle locations.

## Key Operational Features & Queries
This repository includes 10 complex operational queries designed to solve real-world healthcare administration logic:
1. **Ambulance Tracking:** Real-time filtering of active/dispatched emergency vehicles.
2. **Patient Filtering:** String manipulation to isolate specific regional phone area codes.
3. **Insurance Analytics:** Dynamic sorting and grouping of patient insurance providers.
4. **Automated Penalty Fees:** Bulk updating of financial records utilizing computed logic.
5. **Dynamic Age Calculation:** Real-time age computation using DOB and system timestamps.
6. **Executive Financial Summaries:** Multi-table joins with aggregate functions (`SUM`, `GROUP BY`) to calculate revenue per provider.
7. **Ward Occupancy:** Mathematical computation of remaining bed capacity across departments.
8. **Daily Scheduling:** Date-casting and filtering for today's active appointments.
9. **High-Value Accounts:** Sorting and flagging critical patient invoices for audit purposes.
10. **Prescription Fulfillment:** Tracking pending pharmacy medication orders.

## Technical Stack
* **Language:** SQL (T-SQL)
* **Environment:** Microsoft SQL Server (SSMS) / Azure Data Studio
* **Concepts Demonstrated:** DDL/DML, Primary/Foreign Key Constraints, Triggers, Aggregate Functions, Multi-table Joins, Computed Columns.

## How to Run
1. Execute `01_schema_and_triggers.sql` to initialize the database, construct the tables, and deploy the auto-update triggers.
2. Execute `02_hospital_queries.sql` to view the operational business logic and data extraction methods.