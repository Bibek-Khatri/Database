create database COMPANYDB;
use COMPANYDB;

create table DEPARTMENT(
DNAME varchar(20),
DNUMBER int primary key,
MGRSSN varchar(15),
MGRSTARTDATE date
);

	Create table EMPLOYEE(
    FNAME varchar(20),
    MINIT char(1),
    LNAME varchar(15),
    SSN varchar(15) primary key,
    BDATE date,
    ADDRESS varchar(100),
    SEX char(1),
    SALARY int,
    SUPERSSN varchar(15),
    DNO int,
    foreign key (DNO)
    references DEPARTMENT (DNUMBER)
    );
    -- Insert sample data into DEPARTMENT
INSERT INTO DEPARTMENT VALUES ('Research', 1, '11111', '2020-01-15');
INSERT INTO DEPARTMENT VALUES ('Sales', 2, '22222', '2019-03-10');
INSERT INTO DEPARTMENT VALUES ('HR', 3, '33333', '2021-07-01');
INSERT INTO DEPARTMENT VALUES ('IT', 4, '44444', '2018-11-20');
INSERT INTO DEPARTMENT VALUES ('Finance', 5, '55555', '2022-05-05');

-- Insert sample data into EMPLOYEE
INSERT INTO EMPLOYEE VALUES ('John', 'A', 'Smith', '11111', '1985-06-12', 'New York, NY', 'M', 60000, NULL, 1);
INSERT INTO EMPLOYEE VALUES ('Mary', 'B', 'Johnson', '22222', '1990-09-25', 'Los Angeles, CA', 'F', 55000, '11111', 2);
INSERT INTO EMPLOYEE VALUES ('David', 'C', 'Williams', '33333', '1982-03-14', 'Chicago, IL', 'M', 70000, '11111', 3);
INSERT INTO EMPLOYEE VALUES ('Susan', 'D', 'Brown', '44444', '1988-12-05', 'Houston, TX', 'F', 65000, '22222', 4);
INSERT INTO EMPLOYEE VALUES ('James', 'E', 'Davis', '55555', '1992-07-19', 'Miami, FL', 'M', 62000, '33333', 5);

SELECT * FROM DEPARTMENT;
SELECT * FROM EMPLOYEE;

#q1 10% Salary raise for research department
SELECT E.FNAME, E.SALARY, (E.SALARY * 1.10) AS NEW_SALARY
FROM EMPLOYEE E
INNER JOIN DEPARTMENT D
ON E.DNO = D.DNUMBER
WHERE D.DNAME = 'Research';

#q2 Salary statistics of IT Department
SELECT 
    E.FNAME,
    E.SALARY,
    SUM(E.SALARY) OVER() AS Total_Salary,
    MIN(E.SALARY) OVER() AS Minimum_Salary,
    MAX(E.SALARY) OVER() AS Maximum_Salary,
    AVG(E.SALARY) OVER() AS Average_Salary
FROM EMPLOYEE E
INNER JOIN DEPARTMENT D
ON E.DNO = D.DNUMBER
WHERE D.DNAME = 'IT';

#q3 Employees controlled by department no 5
select FNAME,LNAME from EMPLOYEE E
where exists(select * from EMPLOYEE e
where e.DNO =5 AND E.SSN = e.SSN);

#q4 Department haviing at least 2 employee
SELECT D.DNAME, COUNT(E.SSN) AS Total_Employees
FROM EMPLOYEE E
INNER JOIN DEPARTMENT D 
ON E.DNO = D.DNUMBER
GROUP BY D.DNAME
HAVING COUNT(E.SSN) >= 2; 

#q5 Rmployees Born in 1950 (!955-1999)
select * from EMPLOYEE
where year(BDATE) between 1955 and 1999;
