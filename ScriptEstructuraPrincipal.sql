/*
==========================================================
BASE DE DATOS - FESTIVAL MUSICAL
Versión: 1.0
Fecha de creación: 10/05/2026
Actualización: #1

Descripción:
Este script crea la estructura principal de la base
de datos del sistema de gestión para un festival musical.

El sistema permite administrar:
- Artistas y sus integrantes
- Escenarios
- Presentaciones
- Compras y boletas
- Staff de apoyo
- Contratos
- Implementos técnicos
- Asistentes al evento


Autor:
Equipo Festival Musical
==========================================================
*/


/* ======================================================
   TABLA GENERO
   Guarda los géneros musicales disponibles.
====================================================== */
CREATE TABLE GENERO (
    id_genero NUMBER NOT NULL,
    genero VARCHAR2(50 CHAR) NOT NULL,

    CONSTRAINT GENERO_PK
        PRIMARY KEY (id_genero)
);


/* ======================================================
   TABLA ARTISTA
   Guarda la información principal de los artistas.
====================================================== */
CREATE TABLE ARTISTA (
    id_artista NUMBER NOT NULL,
    nombre VARCHAR2(40 CHAR) NOT NULL,
    pais VARCHAR2(20 CHAR) NOT NULL,
    genero VARCHAR2(15 CHAR) NOT NULL,

    CONSTRAINT ARTISTA_PK
        PRIMARY KEY (id_artista)
);


/* ======================================================
   TABLA ART_GEN
   Relaciona artistas con géneros musicales.
====================================================== */
CREATE TABLE ART_GEN (
    GENERO_id_genero NUMBER NOT NULL,
    ARTISTA_id_artista NUMBER NOT NULL,

    CONSTRAINT ART_GEN_GENERO_FK
        FOREIGN KEY (GENERO_id_genero)
        REFERENCES GENERO(id_genero),

    CONSTRAINT ART_GEN_ARTISTA_FK
        FOREIGN KEY (ARTISTA_id_artista)
        REFERENCES ARTISTA(id_artista)
);


/* ======================================================
   TABLA INTEGRANTE
   Guarda los integrantes de agrupaciones musicales.
====================================================== */
CREATE TABLE INTEGRANTE (
    id_integrante NUMBER NOT NULL,
    nombre_integrante VARCHAR2(100 CHAR),
    ARTISTA_id_artista NUMBER NOT NULL,

    CONSTRAINT INTEGRANTE_PK
        PRIMARY KEY (id_integrante),

    CONSTRAINT INTEGRANTE_ARTISTA_FK
        FOREIGN KEY (ARTISTA_id_artista)
        REFERENCES ARTISTA(id_artista)
);


/* ======================================================
   TABLA CONTRATO
   Guarda contratos realizados con artistas.
====================================================== */
CREATE TABLE CONTRATO (
    id_contrato NUMBER NOT NULL,
    clausula VARCHAR2(2000 CHAR) NOT NULL,
    fecha_firma DATE NOT NULL,
    vigencia DATE NOT NULL,
    monto NUMBER NOT NULL,
    ARTISTA_id_artista NUMBER NOT NULL,

    CONSTRAINT CONTRATO_PK
        PRIMARY KEY (id_contrato),

    CONSTRAINT CONTRATO_ARTISTA_FK
        FOREIGN KEY (ARTISTA_id_artista)
        REFERENCES ARTISTA(id_artista)
);


/* ======================================================
   TABLA ESCENARIO
   Guarda la información de los escenarios.
====================================================== */
CREATE TABLE ESCENARIO (
    id_escenario NUMBER NOT NULL,
    nombre VARCHAR2(20 CHAR) NOT NULL,
    capacidad_maxima SMALLINT NOT NULL,
    ubicacion VARCHAR2(39 CHAR) NOT NULL,
    ARTISTA_id_artista NUMBER NOT NULL,

    CONSTRAINT ESCENARIO_PK
        PRIMARY KEY (id_escenario),

    CONSTRAINT ESCENARIO_ARTISTA_FK
        FOREIGN KEY (ARTISTA_id_artista)
        REFERENCES ARTISTA(id_artista)
);


/* ======================================================
   TABLA IMPLEMENTO
   Guarda implementos usados en escenarios.
====================================================== */
CREATE TABLE IMPLEMENTO (
    id_implemento NUMBER NOT NULL,
    implemento VARCHAR2(30 CHAR),

    CONSTRAINT IMPLEMENTO_PK
        PRIMARY KEY (id_implemento)
);


/* ======================================================
   TABLA IMP_ESC
   Relaciona escenarios con implementos.
====================================================== */
CREATE TABLE IMP_ESC (
    IMPLEMENTO_id_implemento NUMBER NOT NULL,
    ESCENARIO_id_escenario NUMBER NOT NULL,

    CONSTRAINT IMP_ESC_IMPLEMENTO_FK
        FOREIGN KEY (IMPLEMENTO_id_implemento)
        REFERENCES IMPLEMENTO(id_implemento),

    CONSTRAINT IMP_ESC_ESCENARIO_FK
        FOREIGN KEY (ESCENARIO_id_escenario)
        REFERENCES ESCENARIO(id_escenario)
);


/* ======================================================
   TABLA STAFF
   Guarda el personal de apoyo del evento.
====================================================== */
CREATE TABLE STAFF (
    id_staff NUMBER NOT NULL,
    nombre VARCHAR2(30 CHAR) NOT NULL,
    rol VARCHAR2(19 CHAR) NOT NULL,
    inicio_turno DATE NOT NULL,
    fin_turno DATE NOT NULL,
    ESCENARIO_id_escenario NUMBER NOT NULL,

    CONSTRAINT STAFF_PK
        PRIMARY KEY (id_staff),

    CONSTRAINT STAFF_ESCENARIO_FK
        FOREIGN KEY (ESCENARIO_id_escenario)
        REFERENCES ESCENARIO(id_escenario)
);


/* ======================================================
   TABLA PRESENTACION
   Guarda las presentaciones musicales.
====================================================== */
CREATE TABLE PRESENTACION (
    id_presentacion NUMBER NOT NULL,
    fecha DATE NOT NULL,
    ESCENARIO_id_escenario NUMBER NOT NULL,
    ARTISTA_id_artista NUMBER NOT NULL,
    hora_inicio DATE NOT NULL,
    hora_fin DATE NOT NULL,

    CONSTRAINT PRESENTACION_PK
        PRIMARY KEY (id_presentacion),

    CONSTRAINT PRESENTACION_ARTISTA_FK
        FOREIGN KEY (ARTISTA_id_artista)
        REFERENCES ARTISTA(id_artista),

    CONSTRAINT PRESENTACION_ESCENARIO_FK
        FOREIGN KEY (ESCENARIO_id_escenario)
        REFERENCES ESCENARIO(id_escenario)
);


/* ======================================================
   TABLA ASISTENTE
   Guarda la información de los asistentes.
====================================================== */
CREATE TABLE ASISTENTE (
    id_asistente NUMBER NOT NULL,
    nombre_completo VARCHAR2(30 CHAR) NOT NULL,
    email VARCHAR2(50 CHAR) NOT NULL,
    numero_telefono VARCHAR2(10 CHAR) NOT NULL,

    CONSTRAINT ASISTENTE_PK
        PRIMARY KEY (id_asistente)
);


/* ======================================================
   TABLA ASI_PRE
   Relaciona asistentes con presentaciones.
====================================================== */
CREATE TABLE ASI_PRE (
    PRESENTACION_id_presentacion NUMBER NOT NULL,
    ASISTENTE_id_asistente NUMBER NOT NULL,

    CONSTRAINT ASI_PRE_PRESENTACION_FK
        FOREIGN KEY (PRESENTACION_id_presentacion)
        REFERENCES PRESENTACION(id_presentacion),

    CONSTRAINT ASI_PRE_ASISTENTE_FK
        FOREIGN KEY (ASISTENTE_id_asistente)
        REFERENCES ASISTENTE(id_asistente)
);


/* ======================================================
   TABLA COMPRA
   Guarda las compras realizadas por asistentes.
====================================================== */
CREATE TABLE COMPRA (
    id_venta NUMBER NOT NULL,
    precio SMALLINT NOT NULL,
    fecha DATE NOT NULL,
    ASISTENTE_id_asistente NUMBER NOT NULL,

    CONSTRAINT COMPRA_PK
        PRIMARY KEY (id_venta),

    CONSTRAINT COMPRA_ASISTENTE_FK
        FOREIGN KEY (ASISTENTE_id_asistente)
        REFERENCES ASISTENTE(id_asistente)
);


/* ======================================================
   TABLA BOLETA
   Guarda las boletas del evento.
====================================================== */
CREATE TABLE BOLETA (
    id_boleta NUMBER NOT NULL,
    fecha DATE NOT NULL,
    COMPRA_id_venta NUMBER NOT NULL,
    PRESENTACION_id_presentacion NUMBER NOT NULL,

    CONSTRAINT BOLETA_PK
        PRIMARY KEY (id_boleta),

    CONSTRAINT BOLETA_COMPRA_FK
        FOREIGN KEY (COMPRA_id_venta)
        REFERENCES COMPRA(id_venta),

    CONSTRAINT BOLETA_PRESENTACION_FK
        FOREIGN KEY (PRESENTACION_id_presentacion)
        REFERENCES PRESENTACION(id_presentacion)
);


/* ======================================================
   TABLA TIPO_BOLETA
   Guarda los tipos de boletas disponibles.
====================================================== */
CREATE TABLE TIPO_BOLETA (
    id_tipo_boleta NUMBER NOT NULL,
    tipo VARCHAR2(10 CHAR) NOT NULL,
    BOLETA_id_boleta NUMBER NOT NULL,

    CONSTRAINT TIPO_BOLETA_PK
        PRIMARY KEY (id_tipo_boleta),

    CONSTRAINT TIPO_BOLETA_BOLETA_FK
        FOREIGN KEY (BOLETA_id_boleta)
        REFERENCES BOLETA(id_boleta)
);


/* ======================================================
   TABLA DETALLE_COMPRA
   Guarda el detalle de cada compra realizada.
====================================================== */
CREATE TABLE DETALLE_COMPRA (
    id_detalle_compra NUMBER NOT NULL,
    cantidad NUMBER,
    subtotal NUMBER,
    BOLETA_id_boleta NUMBER NOT NULL,
    COMPRA_id_venta NUMBER NOT NULL,

    CONSTRAINT DETALLE_COMPRA_PK
        PRIMARY KEY (id_detalle_compra),

    CONSTRAINT DETALLE_COMPRA_BOLETA_FK
        FOREIGN KEY (BOLETA_id_boleta)
        REFERENCES BOLETA(id_boleta),

    CONSTRAINT DETALLE_COMPRA_COMPRA_FK
        FOREIGN KEY (COMPRA_id_venta)
        REFERENCES COMPRA(id_venta)
);


/*
==========================================================
FIN DEL SCRIPT

Versión actual: 1.0
Estado:
Estructura principal creada correctamente.

Proyecto:
Festival Musical
==========================================================
*/