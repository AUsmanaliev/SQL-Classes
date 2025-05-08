create table Employees (EmpID int, Name varchar(50), Salary decimal (10,2))
Insert into Employees values (1, 'Jacob', 1400), (2, 'Ethan', 1600), (3, 'Thomas', 1200)
select * from Employees
update Employees
Set Salary = 2300
where EmpID=1;
delete from Employees
where EmpID=2
select * from Employees

create table Test (EmpID int, Name varchar(50), Salary decimal (10,2))

Insert into Test values (1, 'Adam', 1400), (2, 'Cooper', 1600), (3, 'Jack', 1200), (4, 'Susan', 850), (5, 'Anna', 650)
select * from Test
delete from Test
where Salary=650
begin tran
truncate  table Test
rollback tran
begin tran 
delete Test
select * from Test
rollback tran
alter table Employees 
alter column Name varchar(100)
alter table Employees 
add Department varchar(50)
select * from Employees
alter table Employees
alter column Salary FLOAT

create table Departments (DepartmentID int primary key, DepartmentName varchar(50), Salary varchar(50))
select * from Departments
truncate table Employees
select * from Employees

Insert into Departments (DepartmentID, DepartmentName)
Select 1, 'Finance' union all
Select 2, 'Marketing' union all
Select 3, 'Service' union all
Select 4, 'HR' union all
Select 5, 'Sales'
select * from Departments
alter table Departments
add Salary varchar(50)
update Departments
set Salary = 1500
where DepartmentID = 1
update Departments
set Salary = 8200
where DepartmentID = 2
update Departments
set Salary = 10200
where DepartmentID = 3
update Departments
set Salary = 650
where DepartmentID = 4
update Departments
set Salary = 3400
where DepartmentID = 5
select * from Departments

update Departments
set DepartmentName = 'Management'
where Salary > 5000
begin tran
truncate table Departments
rollback tran
select * from Departments

select * from Employees
Insert into Employees values (1, 'Jacob', 1400, ), (2, 'Ethan', 1600), (3, 'Thomas', 1200)

alter table Employees
drop column Department
alter table Employees Rename to Staffmembers

Alter Employees 
Rename to Staffmembers;
exec sp_rename 'Employees', 'Staffmember'


Select * from Staffmember

drop table Departments



create table Products (ProductID int primary key, ProductName varchar(50), Category varchar(100), Price decimal(10,3))

insert into Products values (1, 'Laptop', 'Device', 1500)
insert into Products values (2, 'Phone', 'Device', 650)
insert into Products values (3, 'Washing Machine', 'HA', 3200)
insert into Products values (4, 'TV', 'HA', 1540)
insert into Products values (5, 'Vacuum Cleaner', 'HA', 430)
select * from Products


alter table Products 
Add constraint chk_price_positive check (Price > 0)
ALTER TABLE Products 
ADD StockQuantity INT DEFAULT 50;

update Products
Set StockQuantity = 50
where StockQuantity is NULL;
select * from Products

ALTER TABLE Inventory

EXEC sp_rename 'dbo.Inventory.ProductCategoryaaaa', 'ProductCategory', 'COLUMN';

select * from Products

select  * into Products_Backup
from Products

select * from Products_Backup
select * from Products

EXEC sp_rename 'Products', 'Inventory';



select * from Products_Backup
select * from Inventory2

ALTER TABLE Inventory  
ALTER COLUMN Price FLOAT;


create table inventory2 (ProductID int primary key, ProductName varchar(50), ProductCategory varchar(100), Price decimal(10,3), Productcode int identity (1000,5))

insert into Inventory2 values (1, 'Laptop', 'Device', 1500)
insert into Inventory2 values (2, 'Phone', 'Device', 650)
insert into Inventory2 values (3, 'Washing Machine', 'HA', 3200)
insert into Inventory2 values (4, 'TV', 'HA', 1540)
insert into Inventory2 values (5, 'Vacuum Cleaner', 'HA', 430)
