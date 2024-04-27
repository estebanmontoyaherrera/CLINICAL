

INSERT INTO DocumentTypes (Document, State) VALUES ('Cedula de Ciudadania', 1);
INSERT INTO DocumentTypes (Document, State) VALUES ('Pasaporte', 1);
INSERT INTO DocumentTypes (Document, State) VALUES ('Licencia de Conducir', 1);


INSERT INTO TypesAges (TypeAge, State) VALUES ('A�os', 1);
INSERT INTO TypesAges (TypeAge, State) VALUES ('Meses', 1);
INSERT INTO TypesAges (TypeAge, State) VALUES ('D�as', 1);

INSERT INTO Genders (Gender, State) VALUES ('Masculino', 1);
INSERT INTO Genders (Gender, State) VALUES ('Femenino', 1);

INSERT INTO Specialties (Name, State, AuditCreateDate) VALUES ('Cardiolog�a', 1, CURRENT_TIMESTAMP);
INSERT INTO Specialties (Name, State, AuditCreateDate) VALUES ('Pediatr�a', 1, CURRENT_TIMESTAMP);
INSERT INTO Specialties (Name, State, AuditCreateDate) VALUES ('Ortopedia', 1, CURRENT_TIMESTAMP);

INSERT INTO Medics (Names, LastName, MotherMaidenName, Address, Phone, BirthDate, DocumentTypeId, DocumentNumber, SpecialtyId, State, AuditCreateDate) 
VALUES ('Juan', 'P�rez', 'L�pez', 'Calle Falsa 123', '123456789', '1980-05-15', 1, 'AB123456', 1, 1, CURRENT_TIMESTAMP);
INSERT INTO Medics (Names, LastName, MotherMaidenName, Address, Phone, BirthDate, DocumentTypeId, DocumentNumber, SpecialtyId, State, AuditCreateDate) 
VALUES ('Mar�a', 'G�mez', 'Mart�nez', 'Avenida Siempre Viva 456', '987654321', '1975-07-22', 2, 'CD789012', 2, 1, CURRENT_TIMESTAMP);

INSERT INTO Patients (Names, LastName, MotherMaidenName, DocumentTypeId, DocumentNumber, Phone, TypeAgeId, Age, GenderId, State, AuditCreateDate) 
VALUES ('Ana', 'Rodr�guez', 'Vega', 1, 'EF123456', '321654987', 2, 25, 2, 1, CURRENT_TIMESTAMP);
INSERT INTO Patients (Names, LastName, MotherMaidenName, DocumentTypeId, DocumentNumber, Phone, TypeAgeId, Age, GenderId, State, AuditCreateDate) 
VALUES ('Luis', 'Fern�ndez', 'Garc�a', 3, 'GH123456', '654987321', 1, 10, 1, 1, CURRENT_TIMESTAMP);

INSERT INTO Roles (Name) VALUES ('Administrador');
INSERT INTO Roles (Name) VALUES ('M�dico');
INSERT INTO Roles (Name) VALUES ('Paciente');

INSERT INTO Permissions (Name) VALUES ('Acceso a pacientes');
INSERT INTO Permissions (Name) VALUES ('Acceso a m�dicos');
INSERT INTO Permissions (Name) VALUES ('Crear reportes');
INSERT INTO Permissions (Name) VALUES ('Ver resultados de ex�menes');

-- Asignar permisos al Administrador (RoleId = 1)
INSERT INTO RolePermissions (RoleId, PermissionId) VALUES (1, 1);
INSERT INTO RolePermissions (RoleId, PermissionId) VALUES (1, 2);
INSERT INTO RolePermissions (RoleId, PermissionId) VALUES (1, 3);
INSERT INTO RolePermissions (RoleId, PermissionId) VALUES (1, 4);

-- Asignar permisos al M�dico (RoleId = 2)
INSERT INTO RolePermissions (RoleId, PermissionId) VALUES (2, 1);
INSERT INTO RolePermissions (RoleId, PermissionId) VALUES (2, 4);

-- Asignar permisos al Paciente (RoleId = 3)
INSERT INTO RolePermissions (RoleId, PermissionId) VALUES (3, 4);


