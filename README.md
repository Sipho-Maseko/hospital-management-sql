# Hospital Patient Management System (SQL Architecture & Python Integration)

## Overview
A robust relational database system designed to manage core hospital operations, patient records, and financial billing, enhanced with Python-based automation and API integrations. Built with SQL Server, this project demonstrates advanced multi-table entity-relationship (ER) modeling, data integrity enforcement via triggers, complex operational querying, and automated data pipelines.

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

## Python Integrations (Automation & API)
To bridge the gap between backend data and external applications, this project includes:
* **Automated CSV Pipeline (`import_data.py`):** A Python automation script utilizing `pyodbc` and the `csv` library to parse external patient data and execute bulk SQL inserts, simulating real-world data migration.
* **REST API Wrapper (`api.py`):** A lightweight `FastAPI` application that serves SQL database queries (e.g., high-value audit invoices) to external frontend dashboards via JSON endpoints.

## Technical Stack
* **Languages:** SQL (T-SQL), Python
* **Database Environment:** Microsoft SQL Server (SSMS) / Azure Data Studio
* **Libraries/Frameworks:** FastAPI, pyodbc, csv
* **Concepts Demonstrated:** DDL/DML, Primary/Foreign Key Constraints, Triggers, Aggregate Functions, Multi-table Joins, REST APIs, JSON formatting, CSV Data Parsing.

## How to Run
1. **Database Setup:** Execute `01_schema_and_triggers.sql` to initialize the database, construct the tables, and deploy the auto-update triggers.
2. **Operational Logic:** Execute `02_hospital_queries.sql` to view the operational business logic and data extraction methods.
3. **Data Import Automation:** Run `python import_data.py` to automate the bulk insertion of dummy records from `patients.csv`.
4. **Launch REST API:** Run the FastAPI server to expose the SQL data as JSON endpoints for external systems.