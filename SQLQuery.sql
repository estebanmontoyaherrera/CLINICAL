CREATE DATABASE CLINICAL
GO

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

CREATE TABLE TakeExam
(
TakeExamId INT NOT NULL IDENTITY(1,1)PRIMARY KEY,
PatientId INT,
MedicId INT,
State INT,
AuditCreateDate datetime2(7),
FOREIGN KEY (PatientId) REFERENCES Patients(PatientId),
FOREIGN KEY (MedicId) REFERENCES Medics(MedicId)
)
GO

CREATE TABLE TakeExamDetail
(
TakeExamDetailId INT NOT NULL IDENTITY(1,1)PRIMARY KEY,
TakeExamId INT,
ExamId INT,
AnalysisId INT,
)
GO

CREATE TABLE Results
(
ResultId INT NOT NULL IDENTITY(1,1)PRIMARY KEY,
TakeExamId INT,
State INT,
AuditCreateDate datetime2(7),
FOREIGN KEY (TakeExamId) REFERENCES TakeExam(TakeExamId)
)
GO

CREATE TABLE ResultDetail
(
ResultDetailId INT NOT NULL IDENTITY(1,1)PRIMARY KEY,
ResultId INT,
ResultFile VARCHAR(MAX),
TakeExamDetailId INT,
FOREIGN KEY (ResultId) REFERENCES Results(ResultId),
FOREIGN KEY (TakeExamDetailId) REFERENCES TakeExamDetail(TakeExamDetailId)
)
GO
---------------
CREATE TABLE Roles
(
RoleId INT NOT NULL IDENTITY(1,1)PRIMARY KEY,
Name VARCHAR(100),
)
GO



CREATE TABLE Permissions
(
PermissionId INT NOT NULL IDENTITY(1,1)PRIMARY KEY,
Name VARCHAR(150)
)
GO

CREATE TABLE RolePermissions
(
RoleId INT,
PermissionId INT,
FOREIGN KEY (RoleId) REFERENCES Roles(RoleId),
FOREIGN KEY (PermissionId) REFERENCES Permissions(PermissionId)
)
GO

CREATE TABLE Users
(
UserId INT NOT NULL IDENTITY(1,1)PRIMARY KEY,
FirtName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(255),
Password VARCHAR(MAX),
RoleId INT,
Satate INT,
AuditCreateDate DATETIME2(7),
FOREIGN KEY (RoleId) REFERENCES Roles(RoleId)
)
GO






SELECT * FROM users

SELECT * FROM roles
select * from analysis
select * from TakeExam
SELECT TakeExamDetailId,TakeExamId,ExamId,AnalysisId  FROM TakeExamDetail 