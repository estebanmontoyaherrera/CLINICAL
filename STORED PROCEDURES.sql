USE CLINICAL
GO
-------Procedures--------
CREATE OR ALTER PROCEDURE uspAnalysisList 
(
@PageNumber INT,
@PageSize INT
)
AS
BEGIN
    SELECT
        AnalysisId,
        Name,
        AuditCreateDate,
        State
    FROM Analysis
	ORDER BY AnalysisId
	OFFSET(@PageNumber - 1) * @PageSize ROWS
	FETCH NEXT @PageSize ROWS ONLY
END 
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
    



CREATE OR ALTER PROCEDURE uspAnalysisRegister
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
(
@PageNumber INT,
@PageSize INT
)
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

    ORDER BY ex.ExamId
	OFFSET(@PageNumber - 1) * @PageSize ROWS
	FETCH NEXT @PageSize ROWS ONLY

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
(
@PageNumber INT,
@PageSize INT
)
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

	ORDER BY P.PatientId
	OFFSET(@PageNumber - 1) * @PageSize ROWS
	FETCH NEXT @PageSize ROWS ONLY

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

CREATE OR ALTER PROCEDURE uspPatientRemove
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

CREATE OR ALTER PROCEDURE uspMedicRegister
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
    VALUES (@Names, @LastName, @MotherMaidenName, @Address, @Phone,CONVERT(DATE,@BirthDate), @DocumentTypeId, @DocumentNumber, @SpecialtyId, 1, GETDATE());
END
GO

CREATE OR ALTER PROCEDURE uspMedicEdit
    @MedicId int,
    @Names varchar(100),
    @LastName varchar(50),
    @MotherMaidenName varchar(50),
    @Address varchar(255),
    @Phone varchar(20),
    @BirthDate varchar(10),
    @DocumentTypeId int,
    @DocumentNumber varchar(25),
    @SpecialtyId int
   
AS
BEGIN
    UPDATE Medics
    SET Names = @Names,
        LastName = @LastName,
        MotherMaidenName = @MotherMaidenName,
        Address = @Address,
        Phone = @Phone,
        BirthDate =CONVERT(DATE, @BirthDate),
        DocumentTypeId = @DocumentTypeId,
        DocumentNumber = @DocumentNumber,
        SpecialtyId = @SpecialtyId       
       
    WHERE MedicId = @MedicId;
END
GO

CREATE OR ALTER PROCEDURE uspMedicRemove
    @MedicId int
AS
BEGIN
    DELETE FROM Medics
    WHERE MedicId = @MedicId;
END
GO

CREATE OR ALTER PROCEDURE uspMedicChangeState
    @MedicId int,
    @State int
AS
BEGIN 
    UPDATE Medics
    SET State = @State
    WHERE MedicId = @MedicId;
END
GO

------TakeExam--------------
CREATE OR ALTER PROCEDURE uspTakeExamList 
(
@PageNumber INT,
@PageSize INT
)
AS
BEGIN
    SELECT
	T.TakeExamId,	
	CONCAT_WS(' ',P.Names,P.LastName,P.MotherMaidenName)Patient,
	CONCAT_WS(' ',M.Names,M.LastName,M.MotherMaidenName)Medic,
	CASE T.State WHEN 1 THEN 'FINALIZADO'
		 ELSE 'PENDIENTE'
		 END StateTakeExam,
    T.AuditCreateDate
	FROM TakeExam T
	INNER JOIN Patients P ON T.PatientId = P.PatientId
	INNER JOIN Medics M ON T.MedicId = M.MedicId
    
	ORDER BY TakeExamId
	OFFSET(@PageNumber - 1) * @PageSize ROWS
	FETCH NEXT @PageSize ROWS ONLY
END 
GO


------------DocumentType----------------

CREATE OR ALTER PROCEDURE uspDocumentTypeList 
(
@PageNumber INT,
@PageSize INT
)
AS
BEGIN
     SELECT
	 DocumentTypeId,
	 Document,
	 CASE State WHEN 1 THEN 'ACTIVO'
		 ELSE 'INACTIVO'
		 END State		 
	 FROM DocumentTypes	 
	ORDER BY DocumentTypeId
	OFFSET(@PageNumber - 1) * @PageSize ROWS
	FETCH NEXT @PageSize ROWS ONLY
END 
GO

CREATE OR ALTER PROCEDURE uspDocumentTypeRegister
(
    @Document VARCHAR(50)
   
)
AS
BEGIN
    -- Verificar si el Email ya existe en la tabla Customer
    IF EXISTS (SELECT 1 FROM DocumentTypes WHERE Document = @Document)
    BEGIN
        
        RAISERROR('El Documento ya existe en la base de datos', 16, 1)
        RETURN -1 -- Código de error personalizado, puedes elegir el que mejor se ajuste a tu aplicación
    END
    ELSE
    BEGIN
        -- Si el Email no existe, proceder con la inserción
        INSERT INTO DocumentTypes (Document,State)
	    VALUES ( @Document, 1)
        RETURN @@IDENTITY -- Retornar el ID del registro insertado, si es necesario
    END
END
GO

CREATE OR ALTER PROCEDURE uspDocumentTypeEdit
(
    @DocumentTypeId INT,
    @Document VARCHAR(50)
)
AS
BEGIN 
    UPDATE DocumentTypes
        SET Document = @Document
    WHERE DocumentTypeId = @DocumentTypeId
END
GO




--CREATE OR ALTER PROCEDURE uspUserRegister
--    @FirstName VARCHAR(50),
--    @LastName VARCHAR(50),
--    @Email VARCHAR(255),
--    @Password VARCHAR(MAX),
--    @RoleId INT
   
--AS
--BEGIN
--    INSERT INTO Users (FirtName, LastName, Email, Password, RoleId, Satate, AuditCreateDate)
--    VALUES (@FirstName, @LastName, @Email, @Password, @RoleId, 1, GETDATE())
--END
--GO




CREATE OR ALTER PROCEDURE uspUserRegister
(
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Email VARCHAR(255),
    @Password VARCHAR(MAX),
    @RoleId INT
)
AS
BEGIN
    -- Verificar si el Email ya existe en la tabla Customer
    IF EXISTS (SELECT 1 FROM Users WHERE Email = @Email)
    BEGIN
        
        RAISERROR('El Email ya existe en la base de datos', 16, 1)
        RETURN -1 -- Código de error personalizado, puedes elegir el que mejor se ajuste a tu aplicación
    END
    ELSE
    BEGIN
        -- Si el Email no existe, proceder con la inserción
        INSERT INTO Users (FirtName, LastName, Email, Password, RoleId, Satate, AuditCreateDate)
	    VALUES (@FirstName, @LastName, @Email, @Password, @RoleId, 1, GETDATE())
        RETURN @@IDENTITY -- Retornar el ID del registro insertado, si es necesario
    END
END
GO












