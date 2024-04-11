--CREATE DATABASE CLINICAL
--GO

USE CLINICAL
GO

CREATE TABLE Analysis (
    AnalysisId int identity(1,1) primary key not null,
    Name varchar(50),
    State int not null,
    AuditCreateDate datetime2(7) not null
)
GO

CREATE TABLE Exams 
(
ExamId int not null Identity(1,1)Primary Key,
Name varchar(100),
AnalysisId int not null,
State int not null,
AuditCreateDate datetime2(7) not null,
Foreign Key(AnalysisId) References Analysis(AnalysisId)
)
GO

CREATE TABLE DocumentTypes
(
DocumentTypeId int not null Identity(1,1)Primary key,
Document varchar(50),
State int,
)
GO
CREATE TABLE TypesAges
(
TypeAgeId int not null Identity(1,1)Primary key,
TypeAge varchar(50),
State int ,
)
GO

CREATE TABLE Genders
(
GenderId int not null Identity(1,1)Primary key,
Gender varchar(50),
State int ,
)
GO

CREATE TABLE Patients
(
PatientId int not null Identity(1,1)Primary key,
Names varchar(100),
LastName varchar(50),
MotherMaidenName varchar(50),
DocumentTypeId int,
DocumentNumber varchar(25),
Phone varchar(15),
TypeAgeId int,
Age int,
GenderId int,
State int ,
AuditCreateDate datetime2(7),
Foreign Key(DocumentTypeId) References DocumentTypes(DocumentTypeId),
Foreign Key(TypeAgeId) References TypesAges(TypeAgeId),
Foreign Key(GenderId) References Genders(GenderId)
)
GO

CREATE TABLE Specialties
(
SpecialtyId int not null Identity(1,1)Primary key,
Name varchar(100),
State int,
AuditCreateDate datetime2(7)
)
GO
CREATE TABLE Medics
(
MedicId int not null Identity(1,1)Primary key,
Names varchar(100),
LastName varchar(50),
MotherMaidenName varchar(50),
Address varchar(255),
Phone varchar(20),
BirthDate date,
DocumentTypeId int,
DocumentNumber varchar(25),
SpecialtyId int not null,
State int ,
AuditCreateDate datetime2(7),
Foreign Key(DocumentTypeId) References DocumentTypes(DocumentTypeId),
Foreign Key(SpecialtyId) References Specialties(SpecialtyId)
)
GO

-------Procedures--------
CREATE PROCEDURE uspAnalysisList
AS
BEGIN
    SELECT
        AnalysisId,
        Name,
        AuditCreateDate,
        State
    FROM Analysis
END
GO
exec uspAnalysisList
GO

CREATE OR ALTER PROCEDURE uspAnalysisById
(
    @AnalysisId int
)
AS
BEGIN
    SELECT
        AnalysisId,
        Name
    FROM Analysis
    WHERE AnalysisId = @AnalysisId;
END
GO
SELECT * FROM Analysis
GO


CREATE PROCEDURE uspAnalysisRegister
(
    @Name varchar(100),
    @State int,
    @AuditCreateDate DATETIME
)
AS
BEGIN
    INSERT INTO Analysis
        (
            Name,
            State,
            AuditCreateDate
        )
    VALUES
        (
            @Name,
            @State,
            @AuditCreateDate
        )
END
GO

CREATE PROCEDURE uspAnalysisEdit
(
    @AnalysisId int,
    @Name varchar(50)
)
AS
BEGIN 
    UPDATE Analysis
        SET Name = @Name
    WHERE AnalysisId = @AnalysisId
END
GO

CREATE PROCEDURE uspAnalysisRemove
(
    @AnalysisId INT
)
AS
BEGIN 
    DELETE FROM Analysis
    WHERE AnalysisId = @AnalysisId
END

GO
    



CREATE OR ALTER PROCEDURE [dbo].[uspAnalysisRegister]
(
    @Name varchar(100)
)
AS
BEGIN
    INSERT INTO Analysis
        (
            Name,
            State,
            AuditCreateDate
        )
    VALUES
        (
            @Name,
            1,
            GETDATE()
        )
END
GO


CREATE OR ALTER PROCEDURE uspAnalysisChangeState
(
    @AnalysisId int,
    @State int
)
AS
BEGIN
    UPDATE Analysis
    SET [State] = @State
    WHERE AnalysisId = @AnalysisId
END
GO

SELECT * FROM Analysis
GO
--------------Exams-------------

CREATE OR ALTER PROCEDURE uspExamList
AS
BEGIN
	 SELECT
		 ex.ExamId,
		 ex.Name,
		 a.Name Analysis,
		 ex.AuditCreateDate,
		 CASE ex.State WHEN 1 THEN 'ACTIVO'
		 ELSE 'INACTIVO'
		 END StateExam
	 FROM Exams ex
		 INNER JOIN Analysis a
		 ON ex.AnalysisId=a.AnalysisId 
END
GO

CREATE OR ALTER PROCEDURE uspExamById 
(
@ExamId INT
)
AS
BEGIN
 SELECT 
 ex.ExamId,
 ex.Name,
 ex.AnalysisId
 FROM Exams ex
 WHERE ex.ExamId=@ExamId
END
GO

CREATE OR ALTER PROCEDURE uspExamRegister
(
	@Name VARCHAR(100),
	@AnalysisId INT 
)
AS
BEGIN
 INSERT INTO Exams (Name, AnalysisId, State, AuditCreateDate)
 VALUES (@Name, @AnalysisId, 1, GETDATE())
END
GO



CREATE OR ALTER PROCEDURE uspExamEdit
    @ExamId INT,
    @Name VARCHAR(100),
    @AnalysisId INT
    
AS
BEGIN
    UPDATE Exams
    SET Name = @Name,
        AnalysisId = @AnalysisId
       
    WHERE ExamId = @ExamId;
END
GO

CREATE OR ALTER PROCEDURE uspExamRemove
(
    @ExamId INT
)
AS
BEGIN 
    DELETE FROM Exams
    WHERE ExamId  = @ExamId 
END
GO

CREATE OR ALTER PROCEDURE uspExamChangeState
(
    @ExamId int,
    @State int
)
AS
BEGIN
    UPDATE Exams
    SET [State] = @State
    WHERE ExamId = @ExamId
END
GO

----------Patients-----------

CREATE OR ALTER PROCEDURE upsPatientList
AS
BEGIN
SELECT 
    P.PatientId,
    P.Names,
CONCAT_WS(' ',P.LastName,P.MotherMaidenName)SurNames,
D.Document DocumentType,
p.DocumentNumber,
P.Phone,
CONCAT_WS(' ',P.Age,T.TypeAge)Age,
G.Gender,
CASE P.State WHEN 1 THEN 'ACTIVO'
		 ELSE 'INACTIVO'
		 END StatePatient,
P.AuditCreateDate
FROM 
    Patients P
INNER JOIN 
    DocumentTypes D ON P.DocumentTypeId = D.DocumentTypeId
INNER JOIN 
    TypesAges T ON P.TypeAgeId = T.TypeAgeId
INNER JOIN 
    Genders G ON P.GenderId = G.GenderId
END
GO



CREATE OR ALTER PROCEDURE upsPatientById 
(
@PatientId INT
)
AS
BEGIN
SELECT 
    P.PatientId,
    P.Names,
	P.LastName,
	P.MotherMaidenName,
	P.DocumentTypeId,
	P.DocumentNumber,
	P.Phone,
	P.TypeAgeId,
	P.Age,
	P.GenderId

FROM 
    Patients P
WHERE PatientId=@PatientId
END
GO



CREATE OR ALTER PROCEDURE uspPatientRegister
    @Names varchar(100),
    @LastName varchar(50),
    @MotherMaidenName varchar(50),
    @DocumentTypeId int,
    @DocumentNumber varchar(25),
    @Phone varchar(15),
    @TypeAgeId int,
    @Age int,
    @GenderId int	

AS
BEGIN
   
    INSERT INTO Patients (Names, LastName, MotherMaidenName, DocumentTypeId, DocumentNumber, Phone, TypeAgeId, Age, GenderId, State, AuditCreateDate)
    VALUES (@Names, @LastName, @MotherMaidenName, @DocumentTypeId, @DocumentNumber, @Phone, @TypeAgeId, @Age, @GenderId, 1, GETDATE());
END
GO


CREATE OR ALTER PROCEDURE uspPatientEdit
    @PatientId int,
    @Names varchar(100),
    @LastName varchar(50),
    @MotherMaidenName varchar(50),
    @DocumentTypeId int,
    @DocumentNumber varchar(25),
    @Phone varchar(15),
    @TypeAgeId int,
    @Age int,
    @GenderId int,
    @State int
AS
BEGIN
   

    UPDATE Patients
    SET Names = @Names,
        LastName = @LastName,
        MotherMaidenName = @MotherMaidenName,
        DocumentTypeId = @DocumentTypeId,
        DocumentNumber = @DocumentNumber,
        Phone = @Phone,
        TypeAgeId = @TypeAgeId,
        Age = @Age,
        GenderId = @GenderId,
        State = @State
    WHERE PatientId = @PatientId;
END
GO

CREATE PROCEDURE uspPatientRemove
    @PatientId int
AS
BEGIN
    DELETE FROM Patients
    WHERE PatientId = @PatientId;
END
GO

CREATE OR ALTER PROCEDURE uspPatientChangeState
    @PatientId int,
    @State int
AS
BEGIN 

    UPDATE Patients
    SET State = @State
    WHERE PatientId = @PatientId;
END
GO
--------------Medics-----------
CREATE OR ALTER PROCEDURE upsMedicList
AS
BEGIN
    
    SELECT  
	M.MedicId,
	M.Names,
	CONCAT_WS(' ',M.LastName,M.MotherMaidenName)SurNames,
	S.Name Specialty,
	D.Document DocumentType,
	M.DocumentNumber,
	M.Address,
	M.Phone,
	M.BirthDate,
	CASE M.State WHEN 1 THEN 'ACTIVO'
		 ELSE 'INACTIVO'
		 END StateMedic,
    M.AuditCreateDate
    FROM Medics M
    INNER JOIN DocumentTypes D ON M.DocumentTypeId = D.DocumentTypeId
    INNER JOIN Specialties S ON M.SpecialtyId = S.SpecialtyId;
END
GO

CREATE OR ALTER PROCEDURE upsMedicById 
(
@MedicId INT
)
AS
BEGIN
SELECT 
    MedicId,
    Names,
	LastName,
	MotherMaidenName,
	Address,
	Phone,
	BirthDate,
	DocumentTypeId,
	DocumentNumber,
	SpecialtyId
FROM 
    Medics 
WHERE MedicId=@MedicId
END
GO

CREATE PROCEDURE uspMedicRegister
    @Names varchar(100),
    @LastName varchar(50),
    @MotherMaidenName varchar(50),
    @Address varchar(255),
    @Phone varchar(20),
    @BirthDate date,
    @DocumentTypeId int,
    @DocumentNumber varchar(25),
    @SpecialtyId int

AS
BEGIN

    INSERT INTO Medics (Names, LastName, MotherMaidenName, Address, Phone, BirthDate, DocumentTypeId, DocumentNumber, SpecialtyId, State, AuditCreateDate)
    VALUES (@Names, @LastName, @MotherMaidenName, @Address, @Phone, @BirthDate, @DocumentTypeId, @DocumentNumber, @SpecialtyId, 1, GETDATE());
END
GO

SELECT * FROM Medics