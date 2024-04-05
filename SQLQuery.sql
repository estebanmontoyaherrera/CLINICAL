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