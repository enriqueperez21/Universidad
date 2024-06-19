-- Inserting into Hoteles
INSERT INTO Hoteles (nombre_hotel, capacidad) VALUES
("Gran Hotel", 200),
("Hotel Oasis", 150);

-- Inserting into Salas
INSERT INTO Salas (nombre_hotel, entradas_vendidas, capacidad, medios) VALUES
("Gran Hotel", 0, 50, "Proyector, Pizarra"),
("Hotel Oasis", 10, 30, "Pizarra");

-- Inserting into Paises
INSERT INTO Paises (nombre, cantidad_clubes) VALUES
("Argentina", 10),
("Rusia", 8);

-- Inserting into Arbitros
INSERT INTO Arbitros (num_asociado, nombre, pais_id) VALUES
(1234, "Carlos Lopez", (SELECT pais_id FROM Paises WHERE nombre = "Argentina")),
(5678, "Ivan Petrov", (SELECT pais_id FROM Paises WHERE nombre = "Rusia"));

-- Inserting into Jugadores
INSERT INTO Jugadores (num_asociado, nombre, pais_id) VALUES
(9012, "Lionel Messi", (SELECT pais_id FROM Paises WHERE nombre = "Argentina")),
(3456, "Vladimir Kramnik", (SELECT pais_id FROM Paises WHERE nombre = "Rusia"));

-- Inserting into Partidas
INSERT INTO Partidas (fecha, jugador_p_blanco, jugador_p_negro, arbitro_id, sala_id) VALUES
("2024-05-20",
 (SELECT jugador_id FROM Jugadores WHERE nombre = "Lionel Messi"),
 (SELECT jugador_id FROM Jugadores WHERE nombre = "Vladimir Kramnik"),
 (SELECT arbitro_id FROM Arbitros WHERE nombre = "Carlos Lopez"),
 (SELECT sala_id FROM Salas WHERE nombre_hotel = "Gran Hotel")),

("2024-05-21",
 (SELECT jugador_id FROM Jugadores WHERE nombre = "Vladimir Kramnik"),
 (SELECT jugador_id FROM Jugadores WHERE nombre = "Lionel Messi"),
 (SELECT arbitro_id FROM Arbitros WHERE nombre = "Ivan Petrov"),
 (SELECT sala_id FROM Salas WHERE nombre_hotel = "Hotel Oasis"));

-- Inserting into Jornadas
INSERT INTO Jornadas (nombre, fecha, cod_h) VALUES
("Jornada 1", "2024-05-20", (SELECT cod_h FROM Hoteles WHERE nombre_hotel = "Gran Hotel")),
("Jornada 2", "2024-05-21", (SELECT cod_h FROM Hoteles WHERE nombre_hotel = "Hotel Oasis"));

-- Linking Partidas with Jornadas
INSERT INTO Partidas_se_juegan_en_Jornadas (cod_p, jornada_id) VALUES
((SELECT cod_p FROM Partidas WHERE fecha = "2024-05-20"),
 (SELECT jornada_id FROM Jornadas WHERE nombre = "Jornada 1")),

((SELECT cod_p FROM Partidas WHERE fecha = "2024-05-21"),
 (SELECT jornada_id FROM Jornadas WHERE nombre = "Jornada 2"));

-- Inserting into Alojamientos
INSERT INTO Alojamientos (nombre_hotel, fecha, persona_id) VALUES
("Gran Hotel", "2024-05-19", (SELECT jugador_id FROM Jugadores WHERE nombre = "Lionel Messi")),
("Hotel Oasis", "2024-05-19", (SELECT jugador_id FROM Jugadores WHERE nombre = "Vladimir Kramnik"));

-- Inserting into Clubes
INSERT INTO Clubes (codigo, nombre, pais_id) VALUES
(1234, "FC Barcelona", (SELECT pais_id FROM Paises WHERE nombre = "Argentina")),
(5678, "CSKA Moscow", (SELECT pais_id FROM Paises WHERE nombre = "Rusia"));

-- Linking Jugadores with Clubes (Assuming these are existing players and clubs)
INSERT INTO Jugadores_pertenecen_a_Clubes (jugador_id, club_id) VALUES
((SELECT jugador_id FROM Jugadores WHERE nombre = "Lionel Messi"), (SELECT club_id FROM Clubes WHERE nombre = "FC Barcelona")),
((SELECT jugador_id FROM Jugadores WHERE nombre = "Vladimir Kramnik"), (SELECT club_id FROM Clubes WHERE nombre = "CSKA Moscow"));