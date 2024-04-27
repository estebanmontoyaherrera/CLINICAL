

INSERT INTO DocumentTypes (Document, State) VALUES ('Cedula de Ciudadania', 1);
INSERT INTO DocumentTypes (Document, State) VALUES ('Pasaporte', 1);
INSERT INTO DocumentTypes (Document, State) VALUES ('Licencia de Conducir', 1);


INSERT INTO TypesAges (TypeAge, State) VALUES ('Años', 1);
INSERT INTO TypesAges (TypeAge, State) VALUES ('Meses', 1);
INSERT INTO TypesAges (TypeAge, State) VALUES ('Días', 1);

INSERT INTO Genders (Gender, State) VALUES ('Masculino', 1);
INSERT INTO Genders (Gender, State) VALUES ('Femenino', 1);

INSERT INTO Specialties (Name, State, AuditCreateDate) VALUES ('Cardiología', 1, CURRENT_TIMESTAMP);
INSERT INTO Specialties (Name, State, AuditCreateDate) VALUES ('Pediatría', 1, CURRENT_TIMESTAMP);
INSERT INTO Specialties (Name, State, AuditCreateDate) VALUES ('Ortopedia', 1, CURRENT_TIMESTAMP);

INSERT INTO Medics (Names, LastName, MotherMaidenName, Address, Phone, BirthDate, DocumentTypeId, DocumentNumber, SpecialtyId, State, AuditCreateDate) 
VALUES ('Juan', 'Pérez', 'López', 'Calle Falsa 123', '123456789', '1980-05-15', 1, 'AB123456', 1, 1, CURRENT_TIMESTAMP);
INSERT INTO Medics (Names, LastName, MotherMaidenName, Address, Phone, BirthDate, DocumentTypeId, DocumentNumber, SpecialtyId, State, AuditCreateDate) 
VALUES ('María', 'Gómez', 'Martínez', 'Avenida Siempre Viva 456', '987654321', '1975-07-22', 2, 'CD789012', 2, 1, CURRENT_TIMESTAMP);

INSERT INTO Patients (Names, LastName, MotherMaidenName, DocumentTypeId, DocumentNumber, Phone, TypeAgeId, Age, GenderId, State, AuditCreateDate) 
VALUES ('Ana', 'Rodríguez', 'Vega', 1, 'EF123456', '321654987', 2, 25, 2, 1, CURRENT_TIMESTAMP);
INSERT INTO Patients (Names, LastName, MotherMaidenName, DocumentTypeId, DocumentNumber, Phone, TypeAgeId, Age, GenderId, State, AuditCreateDate) 
VALUES ('Luis', 'Fernández', 'García', 3, 'GH123456', '654987321', 1, 10, 1, 1, CURRENT_TIMESTAMP);

INSERT INTO Roles (Name) VALUES ('Administrador');
INSERT INTO Roles (Name) VALUES ('Médico');
INSERT INTO Roles (Name) VALUES ('Paciente');

INSERT INTO Permissions (Name) VALUES ('Acceso a pacientes');
INSERT INTO Permissions (Name) VALUES ('Acceso a médicos');
INSERT INTO Permissions (Name) VALUES ('Crear reportes');
INSERT INTO Permissions (Name) VALUES ('Ver resultados de exámenes');

-- Asignar permisos al Administrador (RoleId = 1)
INSERT INTO RolePermissions (RoleId, PermissionId) VALUES (1, 1);
INSERT INTO RolePermissions (RoleId, PermissionId) VALUES (1, 2);
INSERT INTO RolePermissions (RoleId, PermissionId) VALUES (1, 3);
INSERT INTO RolePermissions (RoleId, PermissionId) VALUES (1, 4);

-- Asignar permisos al Médico (RoleId = 2)
INSERT INTO RolePermissions (RoleId, PermissionId) VALUES (2, 1);
INSERT INTO RolePermissions (RoleId, PermissionId) VALUES (2, 4);

-- Asignar permisos al Paciente (RoleId = 3)
INSERT INTO RolePermissions (RoleId, PermissionId) VALUES (3, 4);


