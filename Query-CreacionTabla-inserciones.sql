CREATE DATABASE IF NOT EXISTS recamier;

DROP TABLE IF EXISTS Matricula;
DROP TABLE IF EXISTS Asignatura;
DROP TABLE IF EXISTS Grado;
DROP TABLE IF EXISTS Estudiante;
DROP TABLE IF EXISTS Docente;

CREATE TABLE Docente (
    tipoDocumento VARCHAR(10),
    numeroIdentidad VARCHAR(20) PRIMARY KEY,
    nombres VARCHAR(50),
    apellidos VARCHAR(50),
    fechaNacimiento DATE,
    ultimoGradoEscolaridad VARCHAR(50),
    gradoResponsableID INT,
    email VARCHAR(50),
    telefonoFijo VARCHAR(20),
    celular VARCHAR(20)
);

CREATE TABLE Estudiante (
    tipoDocumento VARCHAR(10),
    numeroIdentidad VARCHAR(20) PRIMARY KEY,
    nombres VARCHAR(50),
    apellidos VARCHAR(50),
    fechaNacimiento DATE,
    gradoID INT,
    ciudadResidencia VARCHAR(50),
    direccionResidencia VARCHAR(100),
    email VARCHAR(50),
    telefonoFijo VARCHAR(20),
    celular VARCHAR(20),
    nombreAcudiente VARCHAR(100)
);

CREATE TABLE Asignatura (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    docenteID VARCHAR(20),
    FOREIGN KEY (docenteID) REFERENCES Docente(numeroIdentidad)
);

CREATE TABLE Grado (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    docenteResponsableID VARCHAR(20),
    FOREIGN KEY (docenteResponsableID) REFERENCES Docente(numeroIdentidad)
);

CREATE TABLE Matricula (
    estudianteID VARCHAR(20),
    asignaturaID INT,
    PRIMARY KEY (estudianteID, asignaturaID),
    FOREIGN KEY (estudianteID) REFERENCES Estudiante(numeroIdentidad),
    FOREIGN KEY (asignaturaID) REFERENCES Asignatura(id)
);

INSERT INTO Docente VALUES ('CC', '2001', 'Carlos', 'Ramírez', '2024-01-05', 'Postgrado', 1, 'carlos.ramirez@recamier.com', '2223333', '3102223333');
INSERT INTO Docente VALUES ('CC', '2002', 'Laura', 'Morales', '2024-02-10', 'Maestría', 2, 'laura.morales@recamier.com', '4445555', '3204445555');
INSERT INTO Docente VALUES ('CC', '2003', 'José', 'Hernández', '2024-03-15', 'Doctorado', 3, 'jose.hernandez@recamier.com', '6667777', '3006667777');
INSERT INTO Docente VALUES ('TI', '2004', 'Patricia', 'Torres', '2024-04-20', 'Postgrado', 4, 'patricia.torres@recamier.com', '8889999', '3108889999');
INSERT INTO Docente VALUES ('CC', '2005', 'Miguel', 'Álvarez', '2024-05-25', 'Maestría', 5, 'miguel.alvarez@recamier.com', '1110000', '3151110000');

INSERT INTO Asignatura VALUES (1, 'Matemáticas', '2001');
INSERT INTO Asignatura VALUES (2, 'Ciencias', '2002');
INSERT INTO Asignatura VALUES (3, 'Historia', '2003');
INSERT INTO Asignatura VALUES (4, 'Educación Física', '2004');
INSERT INTO Asignatura VALUES (5, 'Arte', '2005');

INSERT INTO Grado VALUES (1, 'Primero', '2001');
INSERT INTO Grado VALUES (2, 'Segundo', '2002');
INSERT INTO Grado VALUES (3, 'Tercero', '2003');
INSERT INTO Grado VALUES (4, 'Cuarto', '2004');
INSERT INTO Grado VALUES (5, 'Quinto', '2005');

INSERT INTO Estudiante VALUES ('CC', '1001', 'Juan', 'Pérez', '2024-01-10', 1, 'Bogotá', 'Calle 123', 'juan.perez@recamier.com', '1112222', '3001112222', 'Carlos Pérez');
INSERT INTO Estudiante VALUES ('CC', '1002', 'Ana', 'Gomez', '2024-02-15', 1, 'Medellín', 'Carrera 45', 'ana.gomez@recamier.com', '3334444', '3203334444', 'Luisa Gomez');
INSERT INTO Estudiante VALUES ('TI', '1003', 'Sofía', 'Martínez', '2024-03-20', 2, 'Cali', 'Avenida 6N', 'sofia.martinez@recamier.com', '5556666', '3105556666', 'Diana Martínez');
INSERT INTO Estudiante VALUES ('TI', '1004', 'Lucas', 'Fernández', '2024-04-25', 2, 'Barranquilla', 'Calle 76', 'lucas.fernandez@recamier.com', '7778888', '3007778888', 'Pedro Fernández');
INSERT INTO Estudiante VALUES ('CC', '1005', 'Mariana', 'López', '2024-05-30', 3, 'Santa Marta', 'Carrera 10', 'mariana.lopez@recamier.com', '9990000', '3159990000', 'Andrea López');

INSERT INTO Matricula VALUES ('1001', 1);
INSERT INTO Matricula VALUES ('1002', 2);
INSERT INTO Matricula VALUES ('1003', 3);
INSERT INTO Matricula VALUES ('1004', 4);
INSERT INTO Matricula VALUES ('1005', 5);
