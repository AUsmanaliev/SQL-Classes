1
  Raw facts, figures, or information that can be processed or analyzed to generate meaningful insights. Data can be in various forms, such as numbers, text, images, or audio
  Database – A structured collection of data that is stored, managed, and accessed electronically. Databases are designed to efficiently store and retrieve data for various applications
  Relational Database – A type of database that organizes data into structured tables with rows and columns, where relationships between tables are established using 
  keys (such as primary and foreign keys). It follows the principles of relational database management systems (RDBMS), such as MySQL, PostgreSQL, and SQL Server
  Table – A fundamental structure within a relational database that organizes data into rows and columns. Each row (or record) represents an individual entry, and each column (or field) represents a specific attribute of that entry

2
Relational Database Management – SQL Server organizes data into structured tables, supporting relationships between them using primary and foreign keys
High Availability & Disaster Recovery (HADR) – It includes features like Always On Availability Groups, failover clustering, and database mirroring to ensure data reliability and minimize downtime
Security & Compliance – SQL Server offers advanced security features such as Transparent Data Encryption (TDE), Always Encrypted, Row-Level Security, and Role-Based Access Control (RBAC) to protect sensitive data
Scalability & Performance Optimization – With indexing, partitioning, in-memory processing (such as In-Memory OLTP), and query optimization techniques, SQL Server enhances performance and scalability for large datasets
Business Intelligence & Analytics – SQL Server integrates with tools like SQL Server Analysis Services (SSAS), SQL Server Reporting Services (SSRS), and SQL Server Integration Services (SSIS) to support data analytics, reporting, and ETL (Extract, Transform, Load) processes


3
SQL Server provides the following authentication modes when connecting:
Windows Authentication Mode – Uses Windows credentials (Active Directory or local Windows accounts) to authenticate users. It is considered more secure because it leverages integrated security mechanisms such as Kerberos and NTLM
SQL Server Authentication Mode – Requires a separate username and password stored within SQL Server. This mode is useful for non-Windows users or applications that need independent credentials
Additionally, SQL Server can operate in Mixed Mode Authentication, which allows both Windows Authentication and SQL Server Authentication simultaneously

4
create database SchoolDB;

5
use SchoolDB;
create table Students (ID int primary key, name varchar(50), age int),
insert  Students values (1, 'Abror', 35);

6
SQL Server is the actual database system
SSMS is a management tool to work with SQL Server
SQL is the language used to communicate with SQL Server and other databases

7
DQL (Data Query Language)
Used to retrieve data from a database.
Key Command: SELECT
Example:
SELECT * FROM Students;
Retrieves all records from the Students table.

DML (Data Manipulation Language)
Used to modify data in the database.
Key Commands: INSERT, UPDATE, DELETE
Examples:
INSERT INTO Students (StudentID, Name, Age) VALUES (1, 'Alice', 20);
Adds a new record to the Students table.
UPDATE Students SET Age = 21 WHERE StudentID = 1;
Updates the Age of the student with StudentID = 1.
DELETE FROM Students WHERE StudentID = 1;
DELETE FROM Students WHERE StudentID = 1;
Deletes the student with StudentID = 1.

DDL (Data Definition Language)
Used to define and modify the structure of database objects (tables, schemas, indexes, etc.).
Key Commands: CREATE, ALTER, DROP, TRUNCATE
Examples:
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);
Creates the Students table.
ALTER TABLE Students ADD Email VARCHAR(100);
Adds a new column Email to the Students table.
DROP TABLE Students;
Deletes the Students table completely.
TRUNCATE TABLE Students;
Removes all records from the Students table but keeps the structure.

DCL (Data Control Language)
Used to control access to the database.
Key Commands: GRANT, REVOKE
Examples:
GRANT SELECT, INSERT ON Students TO user1;
Gives user1 permission to SELECT and INSERT data into the Students table.
REVOKE INSERT ON Students FROM user1;
Removes user1’s permission to insert data into the Students table.


TCL (Transaction Control Language)
Used to manage transactions (grouping SQL statements to be executed as a unit).
Key Commands: COMMIT, ROLLBACK, SAVEPOINT
Examples:
BEGIN TRANSACTION;
UPDATE Students SET Age = 22 WHERE StudentID = 1;
COMMIT;
Saves the changes permanently.
BEGIN TRANSACTION;
DELETE FROM Students WHERE StudentID = 1;
ROLLBACK;
Undoes the deletion and restores the original data.
SAVEPOINT sp1;
UPDATE Students SET Age = 25 WHERE StudentID = 2;
ROLLBACK TO sp1;
Creates a savepoint and rolls back to it if needed.


8
insert into Students
values (1, 'Thomas', 20), (2, 'Robert', 22), (3, 'Ethan', 30)

9
Step 1: Copy the Backup File
Place the AdventureWorksDW2022.bak file in a location accessible by the SQL Server. A typical path is:C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\
Step 2: Open SSMS and Connect to Server
Launch SQL Server Management Studio (SSMS).

Connect to your SQL Server instance.

Step 3: Start the Restore Process
In Object Explorer, right-click on Databases.

Select Restore Database...

Step 4: Configure Restore Settings
In the Restore Database window:

Select Device.

Click the ... (browse) button.

Click Add and select the AdventureWorksDW2022.bak file.

Click OK.

Under Destination, the database name should automatically populate as AdventureWorksDW2022 (you can change it if desired).

In the Files tab (optional):

Make sure the restore paths are valid for your system.

Change the file paths if needed to point to valid folders on your server.

In the Options tab:

Choose Overwrite the existing database (WITH REPLACE) if restoring over an existing one.

Ensure Recovery state is set to RESTORE WITH RECOVERY.

Step 5: Execute the Restore
Click OK to begin the restore.

Wait for the success message: “Database ‘AdventureWorksDW2022’ restored successfully.”
  After Restoration
To confirm it's restored:
  USE AdventureWorksDW2022;
GO

SELECT name FROM sys.tables;

