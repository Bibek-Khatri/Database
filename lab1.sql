#1 	Create a database named dbemp and switch to it.
create database dbemp1;
use dbemp1;
#2 Create an employee table with appropriate data
#types and constraints for employee details.
CREATE TABLE employees(
EmployeeID varchar(10),
FirstName varchar(20),
LastName varchar(20),
Gender char(1),
DateofBirth date,
Designation varchar(20),
DepartmentName varchar(20),
ManagerID varchar(10),
JoinedDate date,
Salary decimal(10,0)
);
#3 Insert at least two employee records into the employee table
INSERT into employees(
EmployeeID ,FirstName ,LastName ,Gender ,DateofBirth ,Designation ,DepartmentName ,ManagerID ,JoinedDate ,
Salary )
values('1', 'Ram', 'kumar', 'M', '2000-01-02', 'NA', 'NA', '3873', '2025-1-05', '50000') 