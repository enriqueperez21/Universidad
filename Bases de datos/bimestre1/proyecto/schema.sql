CREATE TABLE "clientes"( 
	id_cliente SERIAL, 
	dni INT UNIQUE NOT NULL, 
	nombre_completo VARCHAR(50) NOT NULL, 
	direccion VARCHAR(50) NOT NULL, 
	telefono INT NOT NULL, 
	avalado  Boolean NOT NULL, 
	avalador INT NOT NULL
	PRIMARY KEY(id_cliente),
	FOREIGN KEY(avalador) REFERENCES "clientes"(id_cliente)
);

CREATE TABLE "coches" ( 
	id_coche SERIAL PRIMARY KEY, 
	garaje VARCHAR(20) NOT NULL, 
	matricula CHAR(8) UNIQUE NOT NULL, 
	modelo VARCHAR(30) NOT NULL, 
	color VARCHAR(20) NOT NULL, 
	marca VARCHAR(20) NOT NULL,
	entregado BOOL NOT NULL
); 

CREATE TABLE "agencias" ( 
	id_agencia SERIAL PRIMARY KEY, 
	nombre_agencia VARCHAR(30) NOT NULL, 
	direccion VARCHAR(40) NOT NULL 
); 

CREATE TABLE "reservas" ( 
	id_reserva SERIAL PRIMARY KEY, 
	id_cliente INT NOT NULL, 
	fecha_inicio TIMESTAMP NOT NULL DEFAULT now(), 
	fecha_final TIMESTAMP NOT NULL, 
	costo_total NUMERIC (8,2) NOT NULL CHECK ( "costo_total" > 0), 
	id_agencia INT NOT NULL, 
	FOREIGN KEY ("id_cliente") REFERENCES "clientes"(id_cliente), 
	FOREIGN KEY ("id_agencia") REFERENCES "agencias"(id_agencia) 
); 

CREATE TABLE "coches_reservados"( 
	id_reserva INT NOT NULL, 
	id_coche INT NOT NULL, 
	precio_alquiler NUMERIC(8,2) NOT NULL CHECK ("precio_alquiler" > 0), 
	gasolina_deposito_lt INT NOT NULL,
	FOREIGN KEY("id_reserva") REFERENCES "reservas"(id_reserva), 
	FOREIGN KEY("id_coche") REFERENCES "coches"(id_coche) 
);