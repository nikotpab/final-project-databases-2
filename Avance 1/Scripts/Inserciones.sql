-- Inserción del género musical principal
INSERT INTO GENERO (id_genero, nombre_genero) 
VALUES (1, 'Indie/Independiente');

-- Inserción de escenarios con capacidades estimadas para el Parque El Tunal
INSERT INTO ESCENARIO (id_escenario, nombre, capacidad_maxima, ubicacion) VALUES 
(1, 'Frenchies', 4000, 'Parque Metropolitano El Tunal - Zona Norte'),
(2, 'Hojas verdes', 4000, 'Parque Metropolitano El Tunal - Zona Centro'),
(3, 'Principal', 5000, 'Parque Metropolitano El Tunal - Zona Sur');

-- Inserción de los tipos de boleta oficiales
INSERT INTO TIPO_BOLETA (id_tipo_boleta, tipo) VALUES 
(1, 'Boleta plata'),
(2, 'Boleta verde'),
(3, 'Boleta gold');

-- Inserción de algunos artistas de la alineación oficial
INSERT INTO ARTISTA (id_artista, nombre, pais) VALUES 
(1, 'Margarita Siempre Viva', 'Colombia'),
(2, 'Oh''laville', 'Colombia'),
(3, 'Nicolás y los Fumadores', 'Colombia'),
(4, 'Armenia', 'Colombia');

-- Relación Artista - Género
INSERT INTO ART_GEN (artista_id_artista, genero_id_genero) VALUES 
(1, 1), (2, 1), (3, 1), (4, 1);

-- Inserción de Métodos de Pago comunes
INSERT INTO METODO_PAGO (id_metodo_pago, nombre_metodo_pago) VALUES 
(1, 'Efectivo'),
(2, 'Tarjeta de Crédito'),
(3, 'Nequi/Daviplata');

-- Asistentes de prueba
INSERT INTO ASISTENTE (id_asistente, nombre, apellido, email, numero_telefonico) VALUES 
(1, 'Carlos', 'Mendoza', 'carlos.mendoza@email.com', 3101234567),
(2, 'Luisa', 'Gómez', 'luisa.gomez@email.com', 3209876543),
(3, 'Andrés', 'Pérez', 'andres.perez@email.com', 3154445566);