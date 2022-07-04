
/*                SQL PROJECT: HUMAN RESOURCE MANAGEMENT SYSTEM(HRMS)
						TRAINEE NAME : FAIZA ISLAM MUMU
					     TRAINEE ID : 1269318 
                           DATE: 01-06-2022
					  Batch ID : CS/PNTL-A/51/01
					 
*******************************************************************************************/
   ---------------------------------DDL SCRIPT STARTED-----------------------------

--CREATNG DATABASE 
DROP DATABASE IF EXISTS HRMS_DB
GO
CREATE DATABASE HRMS_DB
ON
(
	name = 'HRMS_DB_data_1',
	fileName = 'E:\C# R_51\Module_01_MSSQL\Project\HRMS_DB_data_1.mdf',
	size = 10MB,
	maxsize = 1GB,
	filegrowth = 5%
)
LOG ON
(
	name = 'HRMS_DB_log_1',
	fileName = 'E:\C# R_51\Module_01_MSSQL\Project\HRMS_DB_log_1.ldf',
	size = 10MB,
	maxsize = 1GB,
	filegrowth = 7%
)
GO
USE HRMS_DB
GO

CREATE TABLE job
(
	jobId smallint PRIMARY KEY DEFAULT  null,
	minSalary MONEY not null,
	maxSalary MONEY not null
)
GO
CREATE TABLE jobGrade
(
	jobGradeId INT IDENTITY PRIMARY KEY not null,
	jobGradeName VARCHAR(30) not null
)
GO

SELECT * FROM jobGrade
GO
CREATE TABLE division
(
	divisionId INT PRIMARY KEY not null,
	divisionName VARCHAR(30) not null
)
GO

SELECT * FROM division
GO

CREATE TABLE categorys
(
	catagoryId INT PRIMARY KEY not null,
	catagoryName VARCHAR(30) not null
)
GO


--Create religions table
CREATE TABLE religions
(
	religionId INT PRIMARY KEY ,
	religionName VARCHAR(40)
)
GO


CREATE TABLE maritalstatus
(
	statusId INT PRIMARY KEY,
	statusName VARCHAR(20)
)
GO

CREATE TABLE empinfo
(
	empId INT PRIMARY KEY not null,
	empName VARCHAR(25) not null,
	city VARCHAR(20),
	nationality VARCHAR(20),
	NID NVARCHAR(13) not null,
	Birthdate NVARCHAR(10)  NOT NULL,
	hireDate NVARCHAR(10) not null,
	phoneNo int not null,
	email NVARCHAR(50) not null 
)
GO


CREATE TABLE bloodGroup
(
	bloodGroupId INT DEFAULT NULL,
	bloodGroupName CHAR(4)
)
GO
select * from bloodGroup
CREATE TABLE empdivisionSalary
(
	empId INT REFERENCES empinfo(empId),
	divisionId INT REFERENCES divisions(divisionId)
)
GO

CREATE TABLE salaryinfo
(
	empId INT REFERENCES empinfo(empId) ,
	divisionId INT REFERENCES divisions(divisionId),
	catagoryId INT REFERENCES categorys(catagoryId),
	basicSalary MONEY not null,
	medicalAllowances MONEY not null,
	specialAllowances MONEY not null,
	mobileBill DECIMAL not null,
	houseRent MONEY not null,
	providentFund DECIMAL not null,
	taxOnSalary FLOAT not null,
	PRIMARY KEY(empId,divisionId,catagoryId)
)
GO

CREATE TABLE newSalaryInfo
(
	empId INT REFERENCES empinfo(empId) ,
	divisionId INT REFERENCES tbldivision(divisionId),
	catagoryId INT REFERENCES categorys(catagoryId),
	basicSalary MONEY not null,
	medicalAllowances MONEY not null,
	specialAllowances MONEY not null,
	mobileBill DECIMAL not null,
	houseRent MONEY not null,
	providentFund DECIMAL not null,
	taxOnSalary FLOAT not null,
	PRIMARY KEY(empId,divisionId,catagoryId)
)
GO

select * from newSalaryInfo
select * from tbldivision
select * from categorys
select * from jobGrade
select * from empinfo
select * from maritalstatus






--------------------------------ALTER TABLE(ADD,DROP),DELETE COLUMN,UPDATE,DROP OBJECT--------------------------------------
--ADD COLUMN--
ALTER TABLE empinfo
ADD gender VARCHAR(20) not null
GO



--ADD COLUMN
ALTER TABLE newSalaryInfo
ADD jobGradeId INT REFERENCES jobGrade(jobGradeId) not null
GO



--DROP OBJECTS
DROP TABLE job
GO
DROP TABLE divisions
GO
DROP TABLE salaryinfo
GO
DROP TABLE bloodGroup
GO


--DELETE COLUMN
DELETE FROM jobGrade
WHERE jobGradeId=3
GO



--UPDATE COLUMN
UPDATE division set divisionName='HR&ADMIN' 
WHERE divisionId=303
GO
SELECT * FROM division




						-- CREATING INDEX, VIEW, STORED PROCEDURE, FUNCTIONS, TRIGGERS AND TRANSACTION ON THE TABLE  --


--==================================================   001 INDEX    ======================================================--



--CREATING A NON-CLUSTERED INDEX FOR CUSTOMER TABLE
CREATE UNIQUE NONCLUSTERED INDEX IX_employee
ON empInfo(empId)
GO
DROP index IF EXISTS division.IX_division 
GO
CREATE INDEX IX_division
ON division(divisionId,divisionName)
GO
--AS CLUSTERED INDEX AUTOMETICALLY CREATED FOR PRIMARY KEY COLUMN, I CAN'T CREATED IT. BECAUSE ALL TABLE HOLD A PRIMARY KEY COLUMN.



--==================================================   002 VIEW   ====================================================--


--1.Create a view from base table
CREATE VIEW V_employeeDetail
AS
SELECT * FROM empinfo
GO

--2.
CREATE VIEW v_salaryDetail AS
SELECT 
		emd.empId,
		emd.empName,
		emd.phoneNo,
		jg.jobGradeId,
		d.divisionId,
		emd.gender
FROM empinfo emd	
INNER JOIN division d on emd.empId=d.divisionId
INNER JOIN categorys c on emd.empId=c.catagoryId
INNER JOIN jobGrade jg on emd.empId=jg.jobGradeId
GO

--3.Creating a view to find out Employee of whom are Assistant general manager.
CREATE VIEW v_salaryDetails2
WITH ENCRYPTION 
AS
SELECT jg.jobGradeId,jg.jobGradeName FROM jobGrade jg
INNER JOIN empinfo e ON e.empName=jg.jobGradeName
WHERE jg.jobGradeName='Assistant General Manager'
GO

--================================    003 Store Procedure & Transaction    ==================================

--Creating store procedure for query data

CREATE PROC sp_BasicSalaryInfos
WITH ENCRYPTION 
AS
SELECT * FROM newSalaryInfo
WHERE basicSalary>=12000
GO

--Creating a store procedure insert data

CREATE PROC sp_InsertEmployeescolumn
			@empId INT ,
			@empName VARCHAR(25),
			@city VARCHAR(20),
			@nationality VARCHAR(20),
			@bloodGroup CHAR(4),
			@Birthdate DATE ,
			@hireDate DATE ,
			@email NVARCHAR(50) 
AS
BEGIN
	INSERT INTO empinfo(empId,empName,city,nationality,Birthdate,hireDate,email)
	VALUES(@empId,@empName,@city,@nationality,@bloodGroup,@Birthdate,@hireDate,@email)
END
GO

--Creating a store procedure delete data

CREATE PROC sp_DeleteEmployeesColumn
						@empcity VARCHAR(MAX)
AS 
	DELETE FROM empinfo WHERE city =@empcity
GO

--Creating a store procedure for inserting data with returns values

CREATE PROC sp_InsertEmployeeWithReturn
			@empId INT ,
			@empName VARCHAR(25),
			@city VARCHAR(20),
			@nationality VARCHAR(20),
			@bloodGroup CHAR(4),
			@Birthdate DATE ,
			@hireDate DATE ,
			@email NVARCHAR(50) 
AS
DECLARE @id INT
	INSERT INTO empinfo
	VALUES(@empId,@empName,@city,@nationality,@bloodGroup,@Birthdate,@hireDate,@email)
	SELECT @id =IDENT_CURRENT('empinfo')
	RETURN @id
GO

--Creating store procedure using TRY CATCH, ERROR MESSEGE, TRANSACTION and RAISERROR


CREATE PROCEDURE sp_UpdateEmployeesDeleteDivisionId   
				@empId INT ,
			@empName VARCHAR(25),
			@city VARCHAR(20),
			@nationality VARCHAR(20),
			@bloodGroup CHAR(4),
			@Birthdate DATE ,
			@hireDate DATE ,
			@email NVARCHAR(50) 
 AS
 BEGIN TRY 
 
  BEGIN TRANSACTION  
      
    UPDATE empinfo 
    SET empName='@EmpName'  
    WHERE empId='@Id'  
  
    DELETE FROM division   
    WHERE divisionId='@DId'  
        
   COMMIT TRANSACTION  
 END TRY  
 BEGIN CATCH  
    IF @@TRANCOUNT > 0  
    ROLLBACK TRANSACTION  
    DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
  
    SELECT     
        @ErrorMessage  = ERROR_MESSAGE(),    
        @ErrorSeverity = ERROR_SEVERITY(),   
        @ErrorState    = ERROR_STATE();   
           
    SET @ErrorMessage=@ErrorMessage   
  
    RAISERROR (@ErrorMessage, -- Message text.    
                 @ErrorSeverity, -- Severity.    
                 @ErrorState -- State.    
               );    
 END CATCH  
 GO    

 -- Count Total Employee Through Output Parameters in Stored Procedure

CREATE PROC spCountEmployeedetail (@CountEmployee INT OUTPUT)
AS
BEGIN
    SELECT @CountEmployee = COUNT(empId) FROM empinfo
END
GO

-- DECLARE THE Above Stored Procedure --

DECLARE @TotalEmployee INT 
    EXEC dbo.spCountEmployees @TotalEmployee OUTPUT
    PRINT @TotalEmployee
GO



--==================================================   004 FUNCTIONS   =========================================================--
/*
There are three types of user defined functions in the sql language.
				1.Scalar valued function
				2.Single-Statement table valued function
				3.Multi-Statement table valued function

I have used all the three in my project
*/

--1. Scalar valued function for calculating the total amount basic and special allowances hire date wise.

CREATE FUNCTION fn_salarydetails
					(@month int,@year int)
RETURNS INT
AS
	BEGIN
		DECLARE @netAmount MONEY
		SELECT @netAmount=SUM(basicSalary*specialAllowances) FROM newSalaryInfo S
		JOIN empinfo e ON e.empId=S.empId
		WHERE YEAR(hireDate)=@year AND MONTH(hireDate)=@month
		RETURN @netAmount
	END	
GO



--2. Scalar valued function for calculating the total  amount of salary for each employee
CREATE FUNCTION fn_AllemployeeSalary
					(@empId INT)
RETURNS MONEY
AS
	BEGIN
		DECLARE @amount MONEY
		SELECT @amount=((basicSalary+medicalAllowances+specialAllowances+mobileBill+houseRent)-(providentFund+taxOnSalary)) FROM newSalaryInfo
		WHERE empId=@empId
		RETURN @amount
	END
GO


--3. SINGLE STATEMENT TABLE VALUED FUNCTION(as single statement we won't use BEGIN END block)

CREATE FUNCTION getEmployeeList(@total INT)
RETURNS TABLE
AS
RETURN SELECT * FROM empinfo 
WHERE empId=(empId) 
GO


--4.SINGLE STATEMENT TABLE VALUED FUNCTION to find city of employee
CREATE FUNCTION getEmpcity(@total varchar)
RETURNS TABLE
AS
RETURN SELECT * FROM empinfo 
WHERE city='Dhaka' 
GO


--5. Multi-Statement table-valued function(More than one statement. So we will use BEGIN AND END STATEMENT)


CREATE FUNCTION dbo.udfgetEmployeUpdate
(
@salary INT
) 
RETURNS @ResultTable TABLE
( 
empName VARCHAR(50), salary FLOAT, ScrapReasonDef VARCHAR(100), ScrapStatus VARCHAR(50)
) AS BEGIN
        INSERT INTO @ResultTable
            SELECT PR.Name, SUM([ScrappedQty]), SC.Name, NULL
                FROM [Production].[WorkOrder] AS WO
                        INNER JOIN 
                        Production.Product AS PR
                        ON Pr.ProductID = WO.ProductID
                        INNER JOIN Production.ScrapReason AS SC
                        ON SC.ScrapReasonID = WO.ScrapReasonID
                WHERE WO.ScrapReasonID IS NOT NULL
                GROUP BY PR.Name, SC.Name
UPDATE @ResultTable
            SET ScrapStatus = 
            CASE WHEN ScrapQty > @ScrapComLevel THEN 'Critical'
            ELSE 'Normal'
            END
        
RETURN
END

























--=======================================================   005 TRIGGERS   ============================================================--
/*
			I have used Two types of TRIGGERS 
			1. AFTER/ FOR TRIGGERS
			2. INSTEAD OF TRIGGERS

==========================================================================================================================================*/


--1.AFTER TRIGGER FOR NOT DELETING ANY DATA FROM ORDERS DATA
CREATE TRIGGER tr_empPreventDelete
ON empInfo
FOR DELETE
AS
	BEGIN
			PRINT'YOU CAN NOT DELETE AN EMPLOYEE DATA'
			ROLLBACK TRANSACTION
	END
GO


--2. AFTER TRIGGER FOR INSERT DATA INTO EMPLOYEE TABLE --
CREATE TRIGGER tr_empInsert
ON empInfo
FOR INSERT
AS
	BEGIN
			DECLARE @id INT, @N VARCHAR
			SELECT @id=empId , @N=empName FROM inserted

			UPDATE division
			SET divisionName=divisionName+@N
			WHERE divisionId=@id
	END
GO



--3. AFTER TRIGGER FOR DELETE DATA INTO EMPLOYEE TABLE --
CREATE TRIGGER tr_empdelete
ON empInfo
FOR DELETE
AS
	BEGIN
			DECLARE @id INT, @N VARCHAR
			SELECT @id=empId , @N=empName FROM inserted

			UPDATE division
			SET divisionName=divisionName+@N
			WHERE divisionId=@id
	END
GO



--4.Create INSTEAD OF TRIGGERS ON VIEW FOR INSERTING DATA 

CREATE TRIGGER tr_V_employeeDetails
ON V_employeeDetails
INSTEAD OF INSERT
AS
	BEGIN
			INSERT INTO empinfo(empId,empId,city,nationality,NID,phoneNo,email,Birthdate,hireDate)
			SELECT empId,empId,city,nationality,NID,phoneNo,email,Birthdate,hireDate FROM inserted
	END
GO




--5.CREATING AN INSTEAD OF TRIGGER FOR NOT INSERTING EMPLOYEE BASIC SALARY 

CREATE TRIGGER tr_notInsertemp
ON newSalaryInfo
INSTEAD OF INSERT
AS
	BEGIN
			DECLARE @empId INT, @basic INT,@special INT
			SELECT @empId=empId, @basic=basicSalary FROM inserted
			SELECT @special= SUM(basicSalary) FROM newSalaryInfo WHERE empId=@empId
			
			IF @special>=@basic
					BEGIN 
							INSERT INTO newSalaryInfo(empId,basicSalary,specialAllowances)	
							SELECT empId,basicSalary,specialAllowances FROM inserted
					END

			ELSE
					BEGIN
							RAISERROR('SORRY, THERE IS NOT ENOUGH STOCK.',10,1)
							ROLLBACK TRANSACTION
					END
	END
GO








--=========================================================DDL SCRIPT ENDED=================================================================================















