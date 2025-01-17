CREATE TABLE Hoteles (
  cod_h INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre_hotel TEXT NOT NULL,
  capacidad INTEGER NOT NULL
);

CREATE TABLE Salas (
  sala_id INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre_hotel TEXT NOT NULL,
  entradas_vendidas INTEGER NOT NULL,
  capacidad INTEGER NOT NULL,
  medios TEXT NOT NULL,
  FOREIGN KEY (nombre_hotel) REFERENCES Hoteles(nombre_hotel)
);

CREATE TABLE Paises (
  pais_id INTEGER PRIMARY KEY,
  nombre TEXT NOT NULL,
  cantidad_clubes INTEGER NOT NULL
);

CREATE TABLE Arbitros (
  arbitro_id INTEGER PRIMARY KEY AUTOINCREMENT,
  num_asociado INTEGER NOT NULL,
  nombre TEXT NOT NULL,
  pais_id INTEGER NOT NULL,
  FOREIGN KEY (pais_id) REFERENCES Paises(pais_id)
);

CREATE TABLE Jugadores (
  jugador_id INTEGER PRIMARY KEY AUTOINCREMENT,
  num_asociado INTEGER NOT NULL,
  nombre TEXT NOT NULL,
  pais_id INTEGER NOT NULL,
  FOREIGN KEY (pais_id) REFERENCES Paises(pais_id)
);

CREATE TABLE Partidas (
  cod_p INTEGER PRIMARY KEY AUTOINCREMENT,
  fecha DATE NOT NULL,
  jugador_p_blanco INTEGER NOT NULL,
  jugador_p_negro INTEGER NOT NULL,
  arbitro_id INTEGER NOT NULL,
  sala_id INTEGER NOT NULL,
  FOREIGN KEY (jugador_p_blanco) REFERENCES Jugadores(jugador_id),
  FOREIGN KEY (jugador_p_negro) REFERENCES Jugadores(jugador_id),
  FOREIGN KEY (arbitro_id) REFERENCES Arbitros(arbitro_id),
  FOREIGN KEY (sala_id) REFERENCES Salas(sala_id)
);

CREATE TABLE Jornadas (
  jornada_id INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre TEXT NOT NULL,
  fecha DATE NOT NULL,
  cod_h INTEGER NOT NULL,
  FOREIGN KEY (cod_h) REFERENCES Hoteles(cod_h)
);

CREATE TABLE Alojamientos (
  alojamiento_id INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre_hotel INTEGER NOT NULL,
  fecha DATE NOT NULL,
  persona_id INTEGER NOT NULL,
  FOREIGN KEY (nombre_hotel) REFERENCES Hoteles(cod_h),
  FOREIGN KEY (persona_id) REFERENCES Jugadores(jugador_id)
);

CREATE TABLE Clubes (
  club_id INTEGER PRIMARY KEY AUTOINCREMENT,
  codigo INTEGER NOT NULL,
  nombre TEXT NOT NULL,
  pais_id INTEGER NOT NULL,
  FOREIGN KEY (pais_id) REFERENCES Paises(pais_id)
);

CREATE TABLE Jugadores_pertenecen_a_Clubes (
  jugador_id INTEGER NOT NULL,
  club_id INTEGER NOT NULL,
  PRIMARY KEY (jugador_id, club_id),
  FOREIGN KEY (jugador_id) REFERENCES Jugadores(jugador_id),
  FOREIGN KEY (club_id) REFERENCES Clubes(club_id)
);

CREATE TABLE Partidas_se_juegan_en_Jornadas (
  cod_p INTEGER NOT NULL,
  jornada_id INTEGER NOT NULL,
  PRIMARY KEY (cod_p, jornada_id),
  FOREIGN KEY (cod_p) REFERENCES Partidas(cod_p),
  FOREIGN KEY (jornada_id) REFERENCES Jornadas(jornada_id)
);

CREATE TABLE Registro_de_Partida (  -- Assuming Registro_partida table exists elsewhere
  registro_id INTEGER NOT NULL,
  cod_p INTEGER NOT NULL,
  movimiento_code TEXT NOT NULL,
  comanterio TEXT NOT NULL,
  PRIMARY KEY (registro_id),
  FOREIGN KEY (cod_p) REFERENCES Partidas(cod_p)
);