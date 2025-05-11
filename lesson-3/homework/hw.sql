1. Definition of BULK INSERT in SQL Server:
  
BULK INSERT is a Transact-SQL (T-SQL) command used in SQL Server to import large amounts of data from an external data file directly into a SQL Server table or view.
Purpose of BULK INSERT:
High-performance data loading: It allows fast insertion of large volumes of data into a database, making it ideal for data warehousing, reporting, and ETL (Extract, Transform, Load) processes.
Efficient file-based import: Instead of inserting rows one at a time, BULK INSERT loads data in batches, which is significantly faster.
Supports various file formats and delimiters: It can handle CSVs, tab-delimited files, and other structured text files with options for field and row terminators.

  2. Four File Formats That Can Be Imported into SQL Server:
CSV (Comma-Separated Values)
Common text-based format where each line is a row, and columns are separated by commas.
TXT (Plain Text)
Delimited text files (e.g., tab-delimited) where fields are separated by a specific character like tab or pipe (|).
XML
Structured data format; can be imported using OPENXML, XML BULK LOAD, or BULK INSERT with additional parsing.
JSON
Lightweight data-interchange format; can be imported using OPENROWSET(BULK ...) and then parsed using SQL Server's JSON functions.

  3.
  create table Products (ProductID INT PRIMARY KEY, ProductName VARCHAR(50), Price DECIMAL(10,2))
  4.
insert into Products values (1, 'Apple', 15), (2, 'Strawberry', 9), (3, 'Watermellon', 18)

  5. 
| **Concept**        | **`NULL`**                                                  | **`NOT NULL`**                                                             |
| ------------------ | ----------------------------------------------------------- | -------------------------------------------------------------------------- |
| **Definition**     | Represents the **absence of a value** (unknown or missing)  | Indicates that a **value must be provided**; cannot be empty               |
| **Usage**          | Used when a column can optionally have **no value**         | Used when a column must **always have a value**                            |
| **Constraint**     | No constraint on data entry; can leave the column blank     | Enforces data entry; blank entries are not allowed                         |
| **Example**        | `ProductDescription TEXT NULL` → allows empty descriptions  | `ProductName VARCHAR(50) NOT NULL` → requires every product to have a name |
| **Query Behavior** | `= NULL` does not work; must use `IS NULL` or `IS NOT NULL` | Can be compared using normal equality (`=`) or inequality (`!=`)           |

  6.
  ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);
  7. 
  Here’s an example of a SQL query with a comment explaining its purpose:
  -- This query retrieves all products with a price greater than 100
SELECT ProductID, ProductName, Price
FROM Products
WHERE Price > 100;

  8.
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100) UNIQUE
);

  9. 
  The IDENTITY column in SQL Server is used to automatically generate unique numeric values for each new row inserted into a table—commonly used for primary keys.

  10.
  BULK INSERT Products
FROM 'C:\Data\products.txt'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

  11. 
  ALTER TABLE Products
ADD CategoryID INT;

ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);

  12.
  | Feature          | PRIMARY KEY                              | UNIQUE KEY                           |
| ---------------- | ---------------------------------------- | ------------------------------------ |
| Uniqueness       | Must be unique                           | Must be unique                       |
| Nulls Allowed    | **Not allowed** (implicitly `NOT NULL`)  | **Allowed** (only one `NULL` if any) |
| Number per Table | Only **one** per table                   | Can have **multiple**                |
| Main Purpose     | Uniquely identifies a row                | Ensures unique values in a column    |
| Index            | Creates a **clustered** index by default | Creates a **non-clustered** index    |

  13.
  ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive CHECK (Price > 0);

  14. 
  ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;

  15.
  Purpose:

A FOREIGN KEY enforces referential integrity between two tables.

Ensures that values in the child table match values in the parent table or are NULL.

Usage:

Used to link tables, maintaining data consistency.

Prevents inserting invalid foreign key values.

Enables cascading updates or deletes (optional).

  16.
  CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Age INT,
    CHECK (Age >= 18)
);

  17.
  CREATE TABLE Products (
    ProductID INT IDENTITY(100, 10) PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

  18.

  CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID)
);

  19.
  COALESCE: Returns the first non-NULL value in a list of expressions.
Syntax: COALESCE(expression1, expression2, ...)
Example:
SELECT COALESCE(Price, 0) FROM Products;
If Price is NULL, it returns 0.
ISNULL: Replaces NULL with a specified replacement value.
Syntax: ISNULL(expression, replacement_value)
Example:
SELECT ISNULL(Price, 0) FROM Products;
If Price is NULL, it returns 0.
Differences:
COALESCE can accept multiple arguments, returning the first non-NULL value.
ISNULL only accepts two arguments and returns a fixed replacement for NULL.

  20.
  CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Email VARCHAR(100) UNIQUE
);

  21.
  CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

