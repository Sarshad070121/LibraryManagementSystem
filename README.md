# 📚 Library Management System

This project builds a **database for a Library Management System** using **MySQL**.  
It includes a database schema, sample data, and SQL queries to demonstrate key library functions such as:

- Tracking book inventory  
- Managing customer and employee information  
- Monitoring the borrowing and return of books  

The database is designed to support **operations and reporting** in a structured way.

---

## 🗂️ Database Schema

### 1. **Books**
- **Primary Key:** `ISBN`  
- **Fields:** Title, Category, Rental Price, Availability Status (`1 = available`, `0 = not`), Author, Publisher  

---

### 2. **Customer**
- **Primary Key:** `Customer_id`  
- **Fields:** Customer name, Address, Registration date  

---

### 3. **Branch**
- **Primary Key:** `Branch_no`  
- **Fields:** Manager ID, Branch address, Contact number  

---

### 4. **Employee**
- **Primary Key:** `Emp_id`  
- **Fields:** Name, Position, Salary, Branch association  

---

### 5. **Issues**
- **Primary Key:** `Issue_Id`  
- **Fields:** Customer ID, Issued book title, Issue date, ISBN  

---

### 6. **Returns**
- **Primary Key:** `Return_id`  
- **Fields:** Customer ID, Returned book title, Return date, ISBN  

---

## 📊 Sample Data

- Sample records have been added to each table.  
- Includes **customers, branches, employees, and books** (across fiction, history, classics, etc.).  
- Demonstrates circulation with sample **issue and return transactions**.  

---

## ⚙️ Setup Instructions

1. **Database Setup**  
   - Run the script to remove outdated schemas.  
   - Create a new database and tables.  

2. **Data Population**  
   - Execute the provided `INSERT` queries to add demonstration data.  

3. **Query Execution**  
   - Run the SQL queries to:  
     - Generate reports  
     - Explore data  
     - Modify or extend queries for custom needs  

---

## 🛠️ Features

- **Simple Data Types:** Uses `VARCHAR`, `DATE`, and `BIT` (for availability status).  
- **Realistic IDs:** Some IDs and keys are stored as strings to mimic real-world systems.  
- **SQL Functionality:** Demonstrates joins, aggregations, filtering, ordering, and subqueries.  
- **Extensibility:** Can be expanded to include:  
  - Fines  
  - Reservations  
  - Digital materials  

---

## 📐 ER Diagram

```mermaid
erDiagram
    BOOKS {
        string ISBN PK
        string Title
        string Category
        float Rental_Price
        bit Availability_Status
        string Author
        string Publisher
    }

    CUSTOMER {
        int Customer_id PK
        string Name
        string Address
        date Registration_Date
    }

    BRANCH {
        int Branch_no PK
        int Manager_id
        string Address
        string Contact_Number
    }

    EMPLOYEE {
        int Emp_id PK
        string Name
        string Position
        float Salary
        int Branch_no FK
    }

    ISSUES {
        int Issue_Id PK
        int Customer_id FK
        string Book_Title
        date Issue_Date
        string ISBN FK
    }

    RETURNS {
        int Return_id PK
        int Customer_id FK
        string Book_Title
        date Return_Date
        string ISBN FK
    }

    CUSTOMER ||--o{ ISSUES : "makes"
    CUSTOMER ||--o{ RETURNS : "returns"
    BOOKS ||--o{ ISSUES : "issued"
    BOOKS ||--o{ RETURNS : "returned"
    BRANCH ||--o{ EMPLOYEE : "employs"
