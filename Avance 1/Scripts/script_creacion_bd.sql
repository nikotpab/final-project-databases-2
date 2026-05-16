-- Convertido a PostgreSQL 16
-- Fecha: 2026-05-14

-- 1. Tablas independientes (maestras)
CREATE TABLE GENERO (
    id_genero INT NOT NULL,
    nombre_genero VARCHAR(20),
    CONSTRAINT GENERO_PK PRIMARY KEY (id_genero)
);

CREATE TABLE ARTISTA (
    id_artista INT NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    pais VARCHAR(20) NOT NULL,
    CONSTRAINT ARTISTA_PK PRIMARY KEY (id_artista)
);

CREATE TABLE ASISTENTE (
    id_asistente INT NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    email VARCHAR(30) NOT NULL,
    numero_telefonico BIGINT, -- Se usa BIGINT para números de celular
    CONSTRAINT ASISTENTE_PK PRIMARY KEY (id_asistente)
);

CREATE TABLE ESCENARIO (
    id_escenario INT NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    capacidad_maxima SMALLINT NOT NULL,
    ubicacion VARCHAR(39) NOT NULL,
    CONSTRAINT ESCENARIO_PK PRIMARY KEY (id_escenario)
);

CREATE TABLE METODO_PAGO (
    id_metodo_pago INT NOT NULL,
    nombre_metodo_pago VARCHAR(20),
    CONSTRAINT METODO_PAGO_PK PRIMARY KEY (id_metodo_pago)
);

CREATE TABLE ROL (
    id_rol INT NOT NULL,
    nombre_rol VARCHAR(20),
    CONSTRAINT ROL_PK PRIMARY KEY (id_rol)
);

CREATE TABLE TIPO_BOLETA (
    id_tipo_boleta INT NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    CONSTRAINT TIPO_BOLETA_PK PRIMARY KEY (id_tipo_boleta)
);

-- 2. Tablas con dependencias (FKs)
CREATE TABLE ART_GEN (
    artista_id_artista INT NOT NULL,
    genero_id_genero INT NOT NULL,
    CONSTRAINT Tenerv1_PK PRIMARY KEY (artista_id_artista, genero_id_genero),
    CONSTRAINT Tenerv1_ARTISTA_FK FOREIGN KEY (artista_id_artista) REFERENCES ARTISTA (id_artista),
    CONSTRAINT Tenerv1_GENERO_FK FOREIGN KEY (genero_id_genero) REFERENCES GENERO (id_genero)
);

CREATE TABLE CONTRATO (
    id_contrato INT NOT NULL,
    clausula VARCHAR(100) NOT NULL,
    fecha_firma DATE NOT NULL,
    vigencia DATE NOT NULL,
    artista_id_artista INT NOT NULL,
    monto NUMERIC(15,2) NOT NULL, -- Uso de NUMERIC para valores monetarios
    CONSTRAINT CONTRATO_PK PRIMARY KEY (id_contrato),
    CONSTRAINT CONTRATO_ARTISTA_FK FOREIGN KEY (artista_id_artista) REFERENCES ARTISTA (id_artista)
);

CREATE UNIQUE INDEX CONTRATO_ARTISTA_IDX ON CONTRATO (artista_id_artista);

CREATE TABLE INTEGRANTE (
    id_integrante INT NOT NULL,
    nombre_integrante VARCHAR(20),
    artista_id_artista INT NOT NULL,
    CONSTRAINT INTEGRANTE_PK PRIMARY KEY (id_integrante),
    CONSTRAINT INTEGRANTE_ARTISTA_FK FOREIGN KEY (artista_id_artista) REFERENCES ARTISTA (id_artista)
);

CREATE TABLE EQUIPAMIENTO (
    escenario_id_escenario INT NOT NULL,
    id_equipamiento INT NOT NULL,
    nombre_equipamiento VARCHAR(20),
    CONSTRAINT EQUIPAMIENTO_PK PRIMARY KEY (id_equipamiento),
    CONSTRAINT EQUIPAMIENTO_ESCENARIO_FK FOREIGN KEY (escenario_id_escenario) REFERENCES ESCENARIO (id_escenario)
);

CREATE TABLE PRESENTACION (
    id_presentacion INT NOT NULL,
    fecha DATE NOT NULL,
    artista_id_artista INT NOT NULL,
    hora_inicio TIMESTAMP NOT NULL, -- DATE en Oracle incluye hora, en Postgres usamos TIMESTAMP
    hora_fin TIMESTAMP NOT NULL,
    escenario_id_escenario INT NOT NULL,
    CONSTRAINT PRESENTACION_PK PRIMARY KEY (id_presentacion),
    CONSTRAINT PRESENTACION_ARTISTA_FK FOREIGN KEY (artista_id_artista) REFERENCES ARTISTA (id_artista),
    CONSTRAINT PRESENTACION_ESCENARIO_FK FOREIGN KEY (escenario_id_escenario) REFERENCES ESCENARIO (id_escenario)
);

CREATE UNIQUE INDEX PRESENTACION_ARTISTA_IDX ON PRESENTACION (artista_id_artista);

CREATE TABLE STAFF (
    id_staff INT NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    inicio_turno TIMESTAMP NOT NULL,
    fin_turno TIMESTAMP NOT NULL,
    escenario_id_escenario INT NOT NULL,
    rol_id_rol INT NOT NULL,
    CONSTRAINT STAFF_PK PRIMARY KEY (id_staff),
    CONSTRAINT STAFF_ESCENARIO_FK FOREIGN KEY (escenario_id_escenario) REFERENCES ESCENARIO (id_escenario),
    CONSTRAINT STAFF_ROL_FK FOREIGN KEY (rol_id_rol) REFERENCES ROL (id_rol)
);

CREATE TABLE BOLETA (
    id_boleta INT NOT NULL,
    fecha DATE NOT NULL,
    escenario_id_escenario INT NOT NULL,
    tipo_boleta_id_tipo_boleta INT NOT NULL,
    CONSTRAINT BOLETA_PK PRIMARY KEY (id_boleta),
    CONSTRAINT BOLETA_ESCENARIO_FK FOREIGN KEY (escenario_id_escenario) REFERENCES ESCENARIO (id_escenario),
    CONSTRAINT BOLETA_TIPO_BOLETA_FK FOREIGN KEY (tipo_boleta_id_tipo_boleta) REFERENCES TIPO_BOLETA (id_tipo_boleta)
);

CREATE TABLE COMPRA (
    boleta_id_boleta INT NOT NULL,
    asistente_id_asistente INT NOT NULL,
    id_compra VARCHAR(20) NOT NULL,
    fecha DATE,
    total NUMERIC(15,2),
    metodo_pago_id_metodo_pago INT NOT NULL,
    CONSTRAINT COMPRA_PK PRIMARY KEY (id_compra),
    CONSTRAINT COMPRA_ASISTENTE_FK FOREIGN KEY (asistente_id_asistente) REFERENCES ASISTENTE (id_asistente),
    CONSTRAINT COMPRA_BOLETA_FK FOREIGN KEY (boleta_id_boleta) REFERENCES BOLETA (id_boleta),
    CONSTRAINT COMPRA_METODO_PAGO_FK FOREIGN KEY (metodo_pago_id_metodo_pago) REFERENCES METODO_PAGO (id_metodo_pago)
);

CREATE UNIQUE INDEX COMPRA_BOLETA_IDX ON COMPRA (boleta_id_boleta);