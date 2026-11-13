CREATE DATABASE ayudas;
USE ayudas;

CREATE TABLE hogar (
    id INTEGER PRIMARY KEY, 
    idpersona_contacto INTEGER,
    idubicacion INTEGER,
    numero_integrantes INTEGER NOT NULL,
);

CREATE TABLE persona_contacto (
    id INTEGER PRIMARY KEY, 
    primer_nombre VARCHAR(13),
    segundo_nombre VARCHAR(13),
    primer_apellido VARCHAR(13),
    segundo_apellido VARCHAR(13),
    genero ENUM('Masculino', 'Femenino', 'Otro', 'Prefiero no decirlo') NOT NULL,
    tipo_documento ENUM('Cédula', 'Pasaporte', 'Cédula Extranjería', 'Registro Civil') NOT NULL,
    numero_documento VARCHAR(10),
    edad VARCHAR(3),
    numero_telefono VARCHAR(10),
);

CREATE TABLE ubicacion (
    id INTEGER PRIMARY KEY,
    barrio VARCHAR(20),
    corregimiento VARCHAR(20),
    vereda VARCHAR(20),
    comunidad VARCHAR(20),
    referencia_ubicacion VARCHAR(30),
);

CREATE TABLE reporte (
    id INTEGER PRIMARY KEY,
    idhogar INTEGER,
    idnecesidad INTEGER,
    condicion_prioridad ENUM('Embarazada', 'Niño', 'Discapacitado', 'Adulto Mayor', 'Ninguna'),
    cantidad INTEGER,
    observacion VARCHAR(1000),
    fecha DATETIME,
    nivel_urgencia ENUM('Bajo', 'Medio', 'Alto'),
    estado ENUM('Entregado', 'Pendiente', 'Incompleto'),
    
);

CREATE TABLE necesidad (
    id INTEGER PRIMARY KEY,
    categoria ENUM('Alimentaria', 'Refugio', 'Agua', 'Medicamento', 'Elementos Aseo'),
);

CREATE TABLE seleccion_ayuda (
    id INTEGER PRIMARY KEY,
    idreporte INTEGER,
    idinventario INTEGER,
    cantidad INTEGER,
    idpunto_atencion INTEGER,
);

CREATE TABLE punto_atencion (
    id INTEGER PRIMARY KEY,
    idseleccion_ayuda INTEGER,
    idubicacion INTEGER,
    idinventario INTEGER,
);

CREATE TABLE entrega (
    id INTEGER PRIMARY,
    idpunto_atencion INTEGER,
    idjornada_entrega INTEGER,
);

CREATE TABLE jornada_entrega (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR(20),
    fecha DATETIME,
    lugar VARCHAR(20),
    descripcion VARCHAR(30),
);

CREATE TABLE inventario (
    id INTEGER PRIMARY KEY,
    idseleccion_ayuda INTEGER,
    cantidad INTEGER,
    disponible INTEGER,
);

CREATE TABLE donacion (
    id INTEGER PRIMARY KEY,
    id_donante INTEGER,
    fecha DATETIME,
);

CREATE TABLE donante (
    id INTEGER PRIMARY KEY,
    tipo_donante ENUM('Natural', 'Juridico'),
    nombre VARCHAR(40),
);

CREATE TABLE tipo_ayuda (
    id INTEGER PRIMARY KEY,
    categoria ENUM('Alimento', 'Medicamento', 'Aseo'),
    nombre_articulo VARCHAR(20),
);

CREATE TABLE detalle_donacion (
    id INTEGER PRIMARY KEY,
    iddonacion INTEGER,
    idtipo_ayuda INTEGER,
    cantidad INTEGER,
    unidad_medida INTEGER,
    idinventario INTEGER,
)