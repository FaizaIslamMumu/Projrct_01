			/*                SQL PROJECT: HUMAN RESOURCE MANAGEMENT SYSTEM(HRMS)
									TRAINEE NAME : FAIZA ISLAM MUMU
									 TRAINEE ID : 1269318 
									   DATE: 01-06-2022
								  Batch ID : CS/PNTL-A/51/01
					 
*******************************************************************************************
Table of Contents: DML
    => SECTION 01: INSERTING DATA INTO TABLE (Normal Insert Into)
    => SECTION 02: INSERTING DATA INTO TABLE (Through Store Procedure)
    => SECTION 03: TEST (View, Trigger, Function, Transaction)
    => SECTION 04: Query to retrieve data from database 
*/


--=======================================================DML SCRIPT STARTED=======================================================

USE HRMS_DB
GO

--Insert Data into jobGrade Table
INSERT INTO jobGrade VALUES
('Chief Financial Officer'),
('Directot'),
('General Manager'),
('Assistant General Manager'),
('Manager'),
('Deputy Manager'),
('Assistant Manager'),
('Senior Exicutive'),
('Exicutive'),
('Officer'),
('Assistance Officer')
GO

--Insert data into division table
INSERT INTO division VALUES
(301,'SALES'),
(302,'MARKETING'),
(303,'HRMS'),
(304,'IT'),
(305,'FINANCE'),
(306,'COMMERCIAL'),
(307,'LEGAL')
GO
--Insert data to category Table 
INSERT INTO category VALUES
(1,'PROBATION'),
(2,'PERMANENT')
GO 

--Insert data into religion table
INSERT INTO religions VALUES
(11,'ISLAM'),
(22,'HINDU'),
(33,'CHRISTIANITY'),
(44,'BUDDHISM')
GO

--Insert data into marital status
INSERT INTO maritalstatus VALUES
(01,'Unmarried'),
(02,'Married')
GO


--Insert data into bloodGroup
INSERT INTO bloodGroup values
(1,'A+'),
(2,'A-'),
(3,'B+'),
(4,'B-'),
(5,'AB+'),
(6,'AB-'),
(7,'O+'),
(8,'O-')
GO
select * from bloodGroup



--Insert data to empinfo table
select * from empinfo
insert into empinfo values
(500206,'Md. Kamrul Hassan','Dhaka','Bangladeshi','2972748937482','06-01-62','11-07-1997','01765847980','kamrul@gmail.com','Male'),
(501106	,'Md.Fokhruzzaman','Dhaka','Bangladeshi','2972756737482','25-09-63','01-03-92','01875847984','fakhru@gmail.com','Male'),
(500203,'Md.Faisal Hussain','Dhaka','Bangladeshi','2972748937482','06-01-62','11-07-1997','01765887984','kamrul@gmail.com','Male')
GO
insert into empinfo values
(500606,'Abdullah Al Mamun','Dhaka','Bangladeshi','2990748937482','04-11-77','12-04-07','01768747984','mamun12@gmail.com','Male'),
(500604,'Md.Mohammed Jashim Uddin','Barishal','Bangladeshi','2972748907482','26-12-72','01-12-04','01769047984','jasim45@gmail.com','Male'),
(500607,'Md.Palash Ranjan Bhowmik ','Magura','Bangladeshi','2972676937482','01-01-82','01-02-09','01728747984','palash67@gmail.com','Male'),
(500628,'Kazi Md. Zafrullah ','Rajshahi','Bangladeshi','2902748937482','24-08-65','07-05-90','01738647984','zafar12@gmail.com','Male'),
(501379,'Md.Mazharul Islam','Barishal','Bangladeshi','2972878937482','13-04-64','03-12-03','01728764794','mazharulislam@gmail.com','Male'),
(500621,'Md.Zaraif Ayaat Hossain','Dhaka','Bangladeshi','2972458937482','13-07-94','02-06-16','01834847984','zaraif89@gmail.com','Male'),
(500615,'Md.Sanjib Kumar Rudra','Magura','Bangladeshi','2232748937482','08-11-83','20-06-09','01965847984','sanjib@gmail.com','Male'),
(500609,'Md.Shakawat Hossain ','Bogura','Bangladeshi','2972748934682','01-11-85','01-03-17','01365847984','shakawat56@gmail.com','Male'),
(500616,'Md.Asaduzzaman','Dhaka','Bangladeshi','2956748937482','12-02-69','11-06-03','01555847984','asad23@gmail.com','Male')
GO
insert into empinfo values
(501384,'Md.Shakhawat Hossain ','Dhaka','Bangladeshi','2925748937482','20-09-75','01-12-02','01555847984','shahawat67@gmail.com','Male')
insert into empinfo values
(500627,'Rajib Kanti Bhowmik','kishoregonj','Bangladeshi','2968748937482','18-12-85','02-10-21','01905847984','rajib@gmail.com','Male')
insert into empinfo values
(501444,'Mohammad Ruhan Miah','Faridpur','Bangladeshi','2972749890748','03-02-75','18-09-10','01724484798','ruhan@gmail.com','Male')
insert into empinfo values
(500614,'Md.Raju Ahmed','Pabna','Bangladeshi','2972742337482','17-10-68','01-04-12','01765444798','raju@gmail.com','Male')
insert into empinfo values
(500625,'Miss. Salma Tabassum','Dhaka','Bangladeshi','2989748937482','08-09-1995','11-07-2019','0176524798','salma@gmail.com','Female')
insert into empinfo values
(500626,'Miss.Rahima','Dhaka','Bangladeshi','2972748990482','01-11-91','04-03-21','01765123984','rahima@gmail.com','Female')
insert into empinfo values
(500618,'Faiza Islam Mumu','Barishal','Bangladeshi','297489390982','15-03-1996','19-04-2020','01894847984','mumu@gmail.com','Female')
insert into empinfo values
(501967,'Afsana sarkar','Dhaka','Bangladeshi','2972743437482','01-01-73','01-03-05','017658473544','afsana@gmail.com','Female')
insert into empinfo values
(501954,'Md.Ruman Uddin','Dhaka','Bangladeshi','29728097482','06-06-80','01-09-08','0176584756','kamrul@gmail.com','Male')
insert into empinfo values
(502225,'Lubna Ghosal','Barishal','Bangladeshi','0891973873842','19-09-1988','16-01-2022','01877389889','lubna@gmail.com','Female')
insert into empinfo values
(502541,'Maliha Akter','Barishal','Bangladeshi','07689729198','07-09-1984','03-02-2022','01879240933','maliha45@gmail.com','Female')
GO


-------------------------------------------------------------------------------------------------------------------------------------------------




--Insert data into newsalaryInfo table
INSERT into newSalaryInfo values
(500203,302,2,22000.00,2000.00,256800.00,2000.00,2500.00,2500.00,5000.00,1)
GO
INSERT into newSalaryInfo values
(500206,301,2,20970.00,1500.00,211789.00,2000.00,2000.00,2349.00,4080.00,1),
(500604,301,2,20540.00,1260.00,150760.00,2000.00,1457.00,2200.00,3000.00,2),
(500606,302,2,19870.00,1260.00,134570.00,2000.00,1475.00,2300.00,3890.00,1),
(500607,302,2,18570.00,1260.00,132780.00,2000.00,1354.00,2200.00,3668.00,2),
(500609,303,2,19876.00,1500.00,157890.00,2000.00,1462.00,2290.00,3908.00,4),
(500614,303,2,20870.00,2080.00,168990.00,2000.00,1678.00,2299.00,3688.00,4),
(500615,301,2,20975.00,2080.00,168546.00,2000.00,1678.00,2270.00,3990.00,4),
(500616,304,2,17097.00,1600.00,122356.00,1500.00,1590.00,2100.00,3982.00,6),
(500618,304,2,16789.00,1550.00,128663.00,1500.00,1567.00,2020.00,2087.00,7),
(500621,305,2,15500.00,1550.00,112780.00,1500.00,1500.00,2000.00,2990.00,8),
(500625,305,2,15500.00,1550.00,113746.00,1500.00,1500.00,2000.00,1898.00,8),
(500626,306,2,22500.00,2080.00,167868.00,2000.00,2000.00,2500.00,1900.00,1),
(500627,306,2,15090.00,1500.00,120800.00,1550.00,1450.00,2000.00,2080.00,6),
(500628,307,2,18098.00,2000.00,147860.00,1600.00,1600.00,2500.00,1990.00,4),
(501106,307,2,14787.00,2000.00,128900.00,1500.00,1600.00,2000.00,1290.00,9),
(501379,307,2,18990.00,2000.00,156890.00,2000.00,1600.00,2000.00,1500.00,5),
(501384,304,2,16500.00,1550.00,127880.00,1550.00,1600.00,2000.00,1550.00,5),
(501444,303,2,14500.00,1200.00,145000.00,1560.00,1500.00,1500.00,1290.00,8),
(501954,301,2,15500.00,1550.00,126668.00,1260.00,1550.00,1550.00,1280.00,8),
(502225,305,1,12500.00,1200.00,150060.00,1250.00,1550.00,1290.00,1250.00,10),
(502541,301,1,12500.00,1200.00,134500.00,1250.00,1550.00,1290.00,1250.00,11)
GO





---------------------------------------------QUERY-----------------------------------------------------------
--simple query
SELECT * FROM empInfo
GO

SELECT * FROM newSalaryInfo
GO

SELECT * FROM division
GO

SELECT * FROM categorys
GO


SELECT * FROM religions
GO

SELECT * FROM maritalstatus
GO

SELECT * FROM jobGrade
GO



--JOIN QUARY TO FIND OUT EMPLOYEES
SELECT * FROM empInfo E
JOIN newSalaryDetail NS ON e.empId=NS.empId
WHERE E.empId = 500203
GO


/*         JOIN QUARY WITH AGGREGATE COLUMN WITH GROUP BY,ORDERBY CLAUSE
           TO FIND OUT CUSTOMER WISE TOTAL DISCOUNT                        */
			
SELECT empId,SUM((basicSalary+mobileBill+houseRent)-(providentFund+taxOnSalary))  'GROSS' FROM newSalaryInfo n
INNER JOIN empInfo e ON e.empId=n.empId
GROUP BY empId
ORDER BY e.empId
GO


--DISPLAY THOSE EMPLOYEES WHO CONTAIN A LETTER S TO THEIR  NAME , DIVISION AND CITY  -- Using Like Operator

SELECT [E.empName] FROM empInfo E
JOIN division d On E.empId=d.divisionId
WHERE [E.empName] like '%S%'
GO
 

 --SUBQUERY TO FIND OUT THE ORDERS DETAILS OF A SPECIFIC CUSTOMER


SELECT * FROM division d
JOIN newSalaryInfo NS ON d.divisionId= NS.divisionId
WHERE NS.divisionId=(SELECT divisionId FROM division WHERE divisionName='MARKETING')
GO


-- Using GROUP BY clause with the MIN and MAX functions example---

SELECT
    basicSalary,
	specialAllowances
    MIN(basicSalary) AS 'min_price',
    MAX(specialAllowances) AS 'max_price'
FROM
    v_salaryDetails1
WHERE basicSalary IN 15500
GROUP BY
    basicSalary,
	specialAllowances
ORDER BY
    basicSalary
GO




------------------------------ROLLUP------------------------------------------------

--USING ROLLUP 

SELECT empId,empName,SUM(basicSalary+medicalAllowances) AS 'NET_ORDER_AMOUNT' FROM newSalaryInfo NS
JOIN empInfo E ON NS.empId=E.empId
GROUP BY ROLLUP (empId,empName)
HAVING SUM(basicSalary+madicalAllowances)>=5000
ORDER BY empId
GO


-- Using RollUp

SELECT
  empId,divisionId
    SUM (empId,divisionid) 
FROM
    v_salaryDetails
GROUP BY
    ROLLUP(empId,divisionId)
GO

-- Using CUBE

select empId,
where sum(basicSalary)
from newSalaryInfo
GROUP BY CUBE(empId)
ORDER BY empId
GO






-------------------------------------------------------CTE------------------------------------------------------------



-- CTE

WITH
 Cte_Operation_Employee
AS 
(
SELECT 
   E.empName,
	E.email,
   D.divisionName
FROM empInfo E
JOIN division D ON D.divisionId = E.empId
WHERE D.divisionName = 'HR&ADMIN'
),

Cte_Support_Employee

AS 
(
SELECT 
   E.empName,
	E.email,
   D.divisionName
FROM empInfo E
JOIN division D ON D.divisionId = E.empId
WHERE D.divisionName = 'HR&ADMIN'
)

SELECT * FROM Cte_Operation_Employee
UNION ALL
SELECT * FROM Cte_Support_Employee
GO



------------------------------------------------------------MERGE----------------------------------------------------------------


SELECT * FROM empInfo
SELECT * FROM newSalaryInfo

--Synchronize the target table with refreshed data from source table

MERGE empInfo AS TARGET
USING newSalaryInfo AS SOURCE 
ON (TARGET.empId = SOURCE.empId) 

--When records are matched, update the records if there is any change
WHEN MATCHED AND TARGET.empName <> SOURCE.empName OR TARGET.basicsalary <> SOURCE.basicSalary 
THEN UPDATE SET TARGET.empName = SOURCE.empName, TARGET.basicsalary = SOURCE.basicsalary

--When no records are matched, insert the incoming records from source table to target table
WHEN NOT MATCHED BY TARGET 
THEN INSERT (empId, empName, basicSalary) VALUES (SOURCE.empId, SOURCE.empName, SOURCE.basicSalary)

--When there is a row that exists in target and same record does not exist in source then delete this record target
WHEN NOT MATCHED BY SOURCE 
THEN DELETE 

--$action specifies a column of type nvarchar(10) in the OUTPUT clause that returns 
--one of three values for each row: 'INSERT', 'UPDATE', or 'DELETE' according to the action that was performed on that row
OUTPUT $action, 
DELETED.empId AS TargetempId, 
DELETED.ProductName AS TargetProductName, 
DELETED.basicSalary AS TargetbasicSalary, 
INSERTED.empId AS SourceempId, 
INSERTED.empName AS SourceempName, 
INSERTED.basicSalary AS SourcebasicSalary; 

SELECT @@ROWCOUNT;
GO






----------------------------------------------------------TEST VIEW---------------------------------------------------



--Check for view
select * from V_employeeDetails
GO
--2.
 select * from V_employeeDetails1
GO

--Check for stored procedure
EXEC sp_BasicSalaryInfo
GO

--INSERTING data using STORED PROCEDURE
DECLARE @id INT
EXEC @id = sp_InsertEmployee 46212,'MD. ABU BAKAR','DHAKA','BANGLADESHI',1995-02-10,2015-10-15,'kalam@gmail.com'
PRINT 'New product inserted with Id : '+STR(@id)
GO



 -----------------------------UDF---------------------------------

 --1.TEST scalar FUNCTION
select dbo.fn_salarydetails(07,1997) AS Net_Amount
GO


--2.TEST Scalar valued function
select dbo.fn_AllemployeeSalary(502541) AS 'AMOUNT'
GO

--3.TEST single tabled valued function
select * from dbo.getEmployeeList(501954)
GO

--TEST single table valued function
select * from dbo.getEmpcity('Dhaka')
GO


----------------------------------------------TRIGGER----------------------------------------------------------

--1.TEST FOR AFTER TRIGGER THAT DOES NOT LET TO DELETE ANY DATA FROM EMPLOYEE TABLE
DELETE FROM empinfo
WHERE empName='Md.Kamrul Hossain'
GO

--2.TEST FOR AFTER TRIGGER TO INSERT DATA--
INSERT INTO empinfo VALUES (501954,'Md.Shakhawat','Dhaka','Indian','47785799',20-09-75,01-12-02,'01485688','shakhawt@gmail.com','Male')
GO

--3.TEST FOR AFTER TRIGGERS FOR DELETE DATA
DELETE FROM empinfo
WHERE empId=501444
GO


--Test INSTED OF TRIGERS FOR INSERT DATA INTO A VIEW
INSERT INTO V_employeeDetails VALUES(2878,'Kamal','Pabna','Bangladeshi','83669984983','029879493','kamal@gmail.com',01-01-1998,05-07-2021)
GO


----Test INSTED OF TRIGERS FOR INSERT DATA INTO TABLE. CAN'T INSERTED, SO ROLLBACKED.

INSERT INTO newSalaryInfo VALUES(21,11678.00,12000.00)
GO

INSERT INTO empinfo VALUES(22,10008.00,20000.00)
GO

SELECT * FROM newSalaryInfo
SELECT * FROM empinfo










-----------------------------------------------------DML SCRIPT ENDED------------------------------------------------------------------------