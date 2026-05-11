/* ======================================================
   INSERCIONES
====================================================== */
 
-- GENERO
INSERT INTO GENERO VALUES (1,'Rock'),(2,'Pop'),(3,'Jazz'),(4,'Metal'),(5,'Reggaeton'),
(6,'Salsa'),(7,'Cumbia'),(8,'Hip Hop'),(9,'Electronica'),(10,'Blues'),
(11,'Country'),(12,'Folk'),(13,'R&B'),(14,'Soul'),(15,'Funk'),
(16,'Clasica'),(17,'Indie'),(18,'Punk'),(19,'Reggae'),(20,'Bossa Nova'),
(21,'Vallenato'),(22,'Tango'),(23,'Merengue'),(24,'Bachata'),(25,'Tropical'),
(26,'Gospel'),(27,'K-Pop'),(28,'Afrobeat'),(29,'Latin Jazz'),(30,'Alternativo');
 
-- ARTISTA
INSERT INTO ARTISTA VALUES
(1,'Los Rodantes','Colombia','Rock'),(2,'Neon Vibes','Argentina','Pop'),
(3,'Jazz Collective','USA','Jazz'),(4,'Iron Storm','Alemania','Metal'),
(5,'Ritmo Urbano','Colombia','Reggaeton'),(6,'La Orquesta Sol','Cuba','Salsa'),
(7,'Cumbia Kings','Mexico','Cumbia'),(8,'Flow Street','Colombia','Hip Hop'),
(9,'Synthetika','Francia','Electronica'),(10,'Delta Blues Band','USA','Blues'),
(11,'Nashville Roots','USA','Country'),(12,'The Folk Tree','Reino Unido','Folk'),
(13,'Soul Express','USA','R&B'),(14,'Groove Machine','Brasil','Funk'),
(15,'Filarmonica BCN','Espana','Clasica'),(16,'Indie Noise','Colombia','Indie'),
(17,'The Punkers','Reino Unido','Punk'),(18,'Rasta Fire','Jamaica','Reggae'),
(19,'Bossa Rio','Brasil','Bossa Nova'),(20,'Valles y Acordes','Colombia','Vallenato'),
(21,'Tango Sur','Argentina','Tango'),(22,'Merengue Total','Rep Dom','Merengue'),
(23,'Bachata Passion','Rep Dom','Bachata'),(24,'Gospel Glory','USA','Gospel'),
(25,'K-Wave','Corea','K-Pop'),(26,'Afro Rhythm','Nigeria','Afrobeat'),
(27,'Latin Jazz All','Cuba','Latin Jazz'),(28,'Alt Nation','Colombia','Alternativo'),
(29,'Sunset Tropical','Colombia','Tropical'),(30,'Urban Soul','Colombia','Soul');
 
-- ART_GEN
INSERT INTO ART_GEN VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),
(11,11),(12,12),(13,13),(14,15),(15,15),(16,17),(17,18),(18,19),(19,20),(20,21),
(21,22),(22,23),(23,24),(24,26),(25,27),(26,28),(27,29),(28,30),(29,25),(30,14);
 
-- INTEGRANTE
INSERT INTO INTEGRANTE VALUES
(1,'Carlos Mejia',1),(2,'Ana Torres',1),(3,'Luis Gomez',2),(4,'Sofia Reyes',2),
(5,'Mark Johnson',3),(6,'Emma Davis',3),(7,'Hans Muller',4),(8,'Klaus Bauer',4),
(9,'Jhon Prada',5),(10,'Valentina Cruz',5),(11,'Miguel Salcedo',6),(12,'Carmen Rivero',6),
(13,'Pedro Ruiz',7),(14,'Maria Lozano',7),(15,'Andres Vargas',8),(16,'Natalia Ospina',8),
(17,'Pierre Dubois',9),(18,'Leon Martin',9),(19,'Robert King',10),(20,'Betty White',10),
(21,'Jake Brown',11),(22,'Tom Walker',12),(23,'Marcus Reed',13),(24,'Diego Castillo',14),
(25,'Isabella Mora',15),(26,'Santiago Diaz',16),(27,'Rachel Green',17),(28,'Bob Marley Jr',18),
(29,'Lucas Ferreira',19),(30,'Javier Ariza',20);
 
-- CONTRATO
INSERT INTO CONTRATO VALUES
(1,'Presentacion unica sin grabaciones','2026-01-10','2026-12-31',15000000,1),
(2,'Dos presentaciones incluidas','2026-01-12','2026-12-31',12000000,2),
(3,'Contrato con clausula de exclusividad','2026-01-15','2026-12-31',20000000,3),
(4,'Rider tecnico incluido en contrato','2026-01-20','2026-12-31',18000000,4),
(5,'Presentacion especial clausura','2026-02-01','2026-12-31',25000000,5),
(6,'Participacion en apertura del evento','2026-02-05','2026-12-31',10000000,6),
(7,'Contrato estandar sin exclusividad','2026-02-10','2026-12-31',8000000,7),
(8,'Contrato con opcion de renovacion','2026-02-15','2027-12-31',22000000,8),
(9,'Acuerdo de presentacion nocturna','2026-02-20','2026-12-31',30000000,9),
(10,'Contrato de artista invitado','2026-03-01','2026-12-31',9000000,10),
(11,'Presentacion en escenario principal','2026-03-05','2026-12-31',35000000,11),
(12,'Clausula de cancelacion 30 dias','2026-03-10','2026-12-31',14000000,12),
(13,'Contrato con merchandising incluido','2026-03-15','2026-12-31',16000000,13),
(14,'Participacion en dos dias del festival','2026-03-20','2026-12-31',19000000,14),
(15,'Contrato con traslados incluidos','2026-04-01','2026-12-31',28000000,15),
(16,'Clausula de buen comportamiento','2026-04-05','2026-12-31',11000000,16),
(17,'Contrato de artista emergente','2026-04-10','2026-12-31',6000000,17),
(18,'Pago 50 porciento anticipado requerido','2026-04-15','2026-12-31',21000000,18),
(19,'Contrato con hospedaje incluido','2026-04-20','2026-12-31',17000000,19),
(20,'Presentacion familiar hora prime','2026-05-01','2026-12-31',13000000,20),
(21,'Contrato con alimentacion incluida','2026-05-05','2026-12-31',24000000,21),
(22,'Acuerdo de grabacion permitida','2026-05-10','2026-12-31',31000000,22),
(23,'Sin derechos de imagen externos','2026-05-15','2026-12-31',27000000,23),
(24,'Contrato con prensa incluida','2026-05-20','2026-12-31',7000000,24),
(25,'Presentacion apertura y clausura','2026-06-01','2026-12-31',40000000,25),
(26,'Rider hospitalidad nivel premium','2026-06-05','2026-12-31',33000000,26),
(27,'Contrato multi-festival','2026-06-10','2027-06-10',26000000,27),
(28,'Clausula de fuerza mayor incluida','2026-06-15','2026-12-31',23000000,28),
(29,'Acuerdo de streaming en vivo','2026-06-20','2026-12-31',29000000,29),
(30,'Contrato estandar con penalidades','2026-07-01','2026-12-31',32000000,30);
 
-- ESCENARIO
INSERT INTO ESCENARIO VALUES
(1,'Escenario Norte',5000,'Zona Norte - Sector A',1),
(2,'Escenario Sur',4000,'Zona Sur - Sector B',2),
(3,'Escenario Este',3500,'Zona Este - Sector C',3),
(4,'Escenario Oeste',3000,'Zona Oeste - Sector D',4),
(5,'Escenario Central',8000,'Centro - Principal',5),
(6,'Tarima Latina',2000,'Zona Sur - Sector E',6),
(7,'Tarima Rock',6000,'Zona Norte - Sector F',7),
(8,'Tarima Urbana',5500,'Zona Centro - Sector G',8),
(9,'Tarima Electronica',7000,'Zona Este - Sector H',9),
(10,'Tarima Acustica',1500,'Zona Oeste - Sector I',10),
(11,'Carpa Jazz',1000,'Zona Norte - Carpa J',11),
(12,'Carpa Folk',800,'Zona Sur - Carpa K',12),
(13,'Carpa Soul',1200,'Zona Este - Carpa L',13),
(14,'Carpa Funk',1100,'Zona Oeste - Carpa M',14),
(15,'Auditorio Clasico',2500,'Zona Centro - Edificio',15),
(16,'Foro Indie',1800,'Zona Norte - Foro N',16),
(17,'Foro Punk',2200,'Zona Sur - Foro O',17),
(18,'Foro Reggae',2600,'Zona Este - Foro P',18),
(19,'Foro Bossa',900,'Zona Oeste - Foro Q',19),
(20,'Tarima Vallenato',3200,'Zona Norte - Sector R',20),
(21,'Tarima Tango',1400,'Zona Sur - Sector S',21),
(22,'Tarima Caribe',4500,'Zona Este - Sector T',22),
(23,'Tarima Bachata',3800,'Zona Oeste - Sector U',23),
(24,'Escenario Gospel',2100,'Zona Centro - Sector V',24),
(25,'Escenario Kpop',6500,'Zona Norte - Sector W',25),
(26,'Escenario Afro',3300,'Zona Sur - Sector X',26),
(27,'Escenario LatJazz',1700,'Zona Este - Sector Y',27),
(28,'Foro Alternativo',2900,'Zona Oeste - Sector Z',28),
(29,'Tarima Tropical',3600,'Zona Centro - Sector AA',29),
(30,'Foro Urban Soul',2700,'Zona Norte - Sector BB',30);
 
-- IMPLEMENTO
INSERT INTO IMPLEMENTO VALUES
(1,'Consola de mezclas'),(2,'Microfono Shure SM58'),(3,'Monitor de escenario'),
(4,'Amplificador guitarra'),(5,'Bateria profesional'),(6,'Bajo electrico'),
(7,'Teclado sintetizador'),(8,'Torre de sonido'),(9,'Subwoofer 18 pulgadas'),
(10,'Luces LED arco'),(11,'Maquina de humo'),(12,'Proyector laser'),
(13,'Pantalla LED gigante'),(14,'Camara de video HD'),(15,'Drone de filmacion'),
(16,'DI Box'),(17,'Compresor de audio'),(18,'Ecualizador grafico'),
(19,'Interfaz de audio'),(20,'Cable XLR 10m'),(21,'Cable speakon'),
(22,'Pedalera de efectos'),(23,'Microfono condensador'),(24,'Tripode de microfono'),
(25,'Generador electrico'),(26,'Tarima de madera 2x2'),(27,'Carpa 10x10'),
(28,'Silla de artista'),(29,'Atril de partituras'),(30,'Kit iluminacion PAR');
 
-- IMP_ESC
INSERT INTO IMP_ESC VALUES
(1,1),(2,1),(3,2),(4,2),(5,3),(6,3),(7,4),(8,5),(9,5),(10,6),
(11,7),(12,7),(13,8),(14,9),(15,9),(16,10),(17,11),(18,12),(19,13),(20,14),
(21,15),(22,15),(23,16),(24,17),(25,18),(26,19),(27,20),(28,21),(29,22),(30,23);
 
-- STAFF
INSERT INTO STAFF VALUES
(1,'Jorge Pena','Seguridad','2026-07-15','2026-07-16',1),
(2,'Marta Suarez','Sonido','2026-07-15','2026-07-16',1),
(3,'Ricardo Blanco','Iluminacion','2026-07-15','2026-07-16',2),
(4,'Paula Medina','Logistica','2026-07-15','2026-07-16',2),
(5,'Cesar Herrera','Seguridad','2026-07-16','2026-07-17',3),
(6,'Laura Acosta','Produccion','2026-07-16','2026-07-17',3),
(7,'Fernando Gil','Sonido','2026-07-16','2026-07-17',4),
(8,'Monica Castro','Logistica','2026-07-16','2026-07-17',4),
(9,'Alberto Ramos','Iluminacion','2026-07-17','2026-07-18',5),
(10,'Diana Flores','Seguridad','2026-07-17','2026-07-18',5),
(11,'Victor Rios','Sonido','2026-07-17','2026-07-18',6),
(12,'Claudia Vega','Produccion','2026-07-17','2026-07-18',6),
(13,'Eduardo Mora','Logistica','2026-07-18','2026-07-19',7),
(14,'Patricia Leon','Seguridad','2026-07-18','2026-07-19',7),
(15,'Guillermo Salas','Iluminacion','2026-07-18','2026-07-19',8),
(16,'Adriana Nieto','Sonido','2026-07-18','2026-07-19',8),
(17,'Rodrigo Fuentes','Produccion','2026-07-19','2026-07-20',9),
(18,'Bibiana Parra','Logistica','2026-07-19','2026-07-20',9),
(19,'Nicolas Arenas','Seguridad','2026-07-19','2026-07-20',10),
(20,'Juliana Trujillo','Sonido','2026-07-19','2026-07-20',10),
(21,'Mauricio Sierra','Iluminacion','2026-07-20','2026-07-21',11),
(22,'Sandra Cardenas','Produccion','2026-07-20','2026-07-21',11),
(23,'David Montoya','Logistica','2026-07-20','2026-07-21',12),
(24,'Isabel Zapata','Seguridad','2026-07-20','2026-07-21',12),
(25,'Camilo Ossa','Sonido','2026-07-21','2026-07-22',13),
(26,'Daniela Cano','Produccion','2026-07-21','2026-07-22',13),
(27,'Hector Mejia','Iluminacion','2026-07-21','2026-07-22',14),
(28,'Alejandra Rueda','Logistica','2026-07-21','2026-07-22',14),
(29,'Ivan Cardona','Seguridad','2026-07-22','2026-07-23',15),
(30,'Marcela Duque','Sonido','2026-07-22','2026-07-23',15);
 
-- PRESENTACION
INSERT INTO PRESENTACION VALUES
(1,'2026-07-15',1,1,'2026-07-15','2026-07-15'),
(2,'2026-07-15',2,2,'2026-07-15','2026-07-15'),
(3,'2026-07-15',3,3,'2026-07-15','2026-07-15'),
(4,'2026-07-15',4,4,'2026-07-15','2026-07-15'),
(5,'2026-07-15',5,5,'2026-07-15','2026-07-15'),
(6,'2026-07-16',6,6,'2026-07-16','2026-07-16'),
(7,'2026-07-16',7,7,'2026-07-16','2026-07-16'),
(8,'2026-07-16',8,8,'2026-07-16','2026-07-16'),
(9,'2026-07-16',9,9,'2026-07-16','2026-07-16'),
(10,'2026-07-16',10,10,'2026-07-16','2026-07-16'),
(11,'2026-07-17',11,11,'2026-07-17','2026-07-17'),
(12,'2026-07-17',12,12,'2026-07-17','2026-07-17'),
(13,'2026-07-17',13,13,'2026-07-17','2026-07-17'),
(14,'2026-07-17',14,14,'2026-07-17','2026-07-17'),
(15,'2026-07-17',15,15,'2026-07-17','2026-07-17'),
(16,'2026-07-18',16,16,'2026-07-18','2026-07-18'),
(17,'2026-07-18',17,17,'2026-07-18','2026-07-18'),
(18,'2026-07-18',18,18,'2026-07-18','2026-07-18'),
(19,'2026-07-18',19,19,'2026-07-18','2026-07-18'),
(20,'2026-07-18',20,20,'2026-07-18','2026-07-18'),
(21,'2026-07-19',21,21,'2026-07-19','2026-07-19'),
(22,'2026-07-19',22,22,'2026-07-19','2026-07-19'),
(23,'2026-07-19',23,23,'2026-07-19','2026-07-19'),
(24,'2026-07-19',24,24,'2026-07-19','2026-07-19'),
(25,'2026-07-19',25,25,'2026-07-19','2026-07-19'),
(26,'2026-07-20',26,26,'2026-07-20','2026-07-20'),
(27,'2026-07-20',27,27,'2026-07-20','2026-07-20'),
(28,'2026-07-20',28,28,'2026-07-20','2026-07-20'),
(29,'2026-07-20',29,29,'2026-07-20','2026-07-20'),
(30,'2026-07-20',30,30,'2026-07-20','2026-07-20');
 
-- ASISTENTE
INSERT INTO ASISTENTE VALUES
(1,'Laura Ramirez','laura.r@gmail.com','3101234567'),
(2,'Mario Castillo','mcastillo@yahoo.com','3117654321'),
(3,'Camila Ortega','camila.o@outlook.com','3001112233'),
(4,'Felipe Torres','ftorres@gmail.com','3154445566'),
(5,'Valeria Gomez','vale.gomez@hotmail.com','3167778899'),
(6,'Andres Sanchez','asanchez@gmail.com','3209990011'),
(7,'Daniela Vargas','danielav@gmail.com','3132223344'),
(8,'Sebastian Lopez','slopez@hotmail.com','3185556677'),
(9,'Isabella Martinez','isabella.m@gmail.com','3218889900'),
(10,'Santiago Mora','smora@outlook.com','3140001122'),
(11,'Natalia Diaz','ndiaz@gmail.com','3163334455'),
(12,'Julian Herrera','julianh@yahoo.com','3196667788'),
(13,'Valentina Cruz','vacruz@gmail.com','3122220000'),
(14,'Miguel Pinto','mpinto@hotmail.com','3175553333'),
(15,'Gabriela Rojas','grojas@gmail.com','3208886666'),
(16,'Juan Cardenas','jcardenas@gmail.com','3131119999'),
(17,'Sara Medina','smedina@outlook.com','3184442222'),
(18,'Pablo Guerrero','pguerrero@gmail.com','3215555555'),
(19,'Maria Pena','mpena@hotmail.com','3147778888'),
(20,'Diego Salcedo','dsalcedo@gmail.com','3161111111'),
(21,'Ana Benitez','abenitez@gmail.com','3194444444'),
(22,'Carlos Escobar','cescobar@yahoo.com','3127777777'),
(23,'Luisa Acevedo','lacevedo@gmail.com','3170000000'),
(24,'Tomas Arango','tarango@hotmail.com','3203333333'),
(25,'Paula Cifuentes','pcifuentes@gmail.com','3136666666'),
(26,'Esteban Gil','egil@gmail.com','3189999999'),
(27,'Manuela Osorio','mosorio@outlook.com','3212222222'),
(28,'Alejandro Rios','arios@gmail.com','3145555555'),
(29,'Carolina Blanco','cblanco@hotmail.com','3178888888'),
(30,'Hector Montoya','hmontoya@gmail.com','3211111111');
 
-- ASI_PRE
INSERT INTO ASI_PRE VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),
(1,11),(2,12),(3,13),(4,14),(5,15),(6,16),(7,17),(8,18),(9,19),(10,20),
(11,21),(12,22),(13,23),(14,24),(15,25),(16,26),(17,27),(18,28),(19,29),(20,30);
 
-- COMPRA
INSERT INTO COMPRA VALUES
(1,250000,'2026-06-01',1),(2,180000,'2026-06-02',2),(3,320000,'2026-06-03',3),
(4,150000,'2026-06-04',4),(5,400000,'2026-06-05',5),(6,200000,'2026-06-06',6),
(7,175000,'2026-06-07',7),(8,290000,'2026-06-08',8),(9,350000,'2026-06-09',9),
(10,120000,'2026-06-10',10),(11,230000,'2026-06-11',11),(12,310000,'2026-06-12',12),
(13,275000,'2026-06-13',13),(14,195000,'2026-06-14',14),(15,420000,'2026-06-15',15),
(16,160000,'2026-06-16',16),(17,340000,'2026-06-17',17),(18,215000,'2026-06-18',18),
(19,185000,'2026-06-19',19),(20,265000,'2026-06-20',20),(21,300000,'2026-06-21',21),
(22,145000,'2026-06-22',22),(23,390000,'2026-06-23',23),(24,225000,'2026-06-24',24),
(25,170000,'2026-06-25',25),(26,280000,'2026-06-26',26),(27,315000,'2026-06-27',27),
(28,240000,'2026-06-28',28),(29,360000,'2026-06-29',29),(30,130000,'2026-06-30',30);
 
-- BOLETA
INSERT INTO BOLETA VALUES
(1,'2026-06-01',1,1),(2,'2026-06-02',2,2),(3,'2026-06-03',3,3),
(4,'2026-06-04',4,4),(5,'2026-06-05',5,5),(6,'2026-06-06',6,6),
(7,'2026-06-07',7,7),(8,'2026-06-08',8,8),(9,'2026-06-09',9,9),
(10,'2026-06-10',10,10),(11,'2026-06-11',11,11),(12,'2026-06-12',12,12),
(13,'2026-06-13',13,13),(14,'2026-06-14',14,14),(15,'2026-06-15',15,15),
(16,'2026-06-16',16,16),(17,'2026-06-17',17,17),(18,'2026-06-18',18,18),
(19,'2026-06-19',19,19),(20,'2026-06-20',20,20),(21,'2026-06-21',21,21),
(22,'2026-06-22',22,22),(23,'2026-06-23',23,23),(24,'2026-06-24',24,24),
(25,'2026-06-25',25,25),(26,'2026-06-26',26,26),(27,'2026-06-27',27,27),
(28,'2026-06-28',28,28),(29,'2026-06-29',29,29),(30,'2026-06-30',30,30);
 
-- TIPO_BOLETA
INSERT INTO TIPO_BOLETA VALUES
(1,'VIP',1),(2,'General',2),(3,'Preferente',3),(4,'General',4),(5,'VIP',5),
(6,'General',6),(7,'Preferente',7),(8,'VIP',8),(9,'General',9),(10,'Preferente',10),
(11,'VIP',11),(12,'General',12),(13,'Preferente',13),(14,'General',14),(15,'VIP',15),
(16,'General',16),(17,'VIP',17),(18,'Preferente',18),(19,'General',19),(20,'VIP',20),
(21,'Preferente',21),(22,'General',22),(23,'VIP',23),(24,'General',24),(25,'Preferente',25),
(26,'VIP',26),(27,'General',27),(28,'Preferente',28),(29,'VIP',29),(30,'General',30);
 
-- DETALLE_COMPRA
INSERT INTO DETALLE_COMPRA VALUES
(1,2,500000,1,1),(2,1,180000,2,2),(3,3,960000,3,3),(4,1,150000,4,4),
(5,2,800000,5,5),(6,1,200000,6,6),(7,2,350000,7,7),(8,1,290000,8,8),
(9,2,700000,9,9),(10,1,120000,10,10),(11,2,460000,11,11),(12,1,310000,12,12),
(13,3,825000,13,13),(14,1,195000,14,14),(15,2,840000,15,15),(16,1,160000,16,16),
(17,2,680000,17,17),(18,1,215000,18,18),(19,2,370000,19,19),(20,3,795000,20,20),
(21,1,300000,21,21),(22,2,290000,22,22),(23,1,390000,23,23),(24,2,450000,24,24),
(25,1,170000,25,25),(26,3,840000,26,26),(27,2,630000,27,27),(28,1,240000,28,28),
(29,2,720000,29,29),(30,1,130000,30,30);