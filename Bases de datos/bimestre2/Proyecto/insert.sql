INSERT INTO "clientes" (dni, nombre_completo, direccion, telefono, avalado, avalador) 
VALUES 
(12345678, 'Juan Perez', 'Calle Falsa 123', 987654321, TRUE, 1),
(87654321, 'Ana Gómez', 'Avenida Siempreviva 742', 123456789, FALSE, 2),
(11223344, 'Carlos Ruiz', 'Boulevard de los Sueños Rotos 101', 456123789, TRUE, 1),
(44332211, 'Laura Fuentes', 'Plaza de la Luna 202', 789123456, FALSE, 3);

INSERT INTO "coches" (garaje, matricula, modelo, color, marca, entregado) 
VALUES 
('Garaje A', 'ABC1234D', 'Model S', 'Rojo', 'Tesla', TRUE),
('Garaje B', 'XYZ5678F', 'Mustang', 'Azul', 'Ford', FALSE),
('Garaje C', 'LMN9101G', 'Civic', 'Negro', 'Honda', TRUE),
('Garaje D', 'JKL1122H', 'Corolla', 'Blanco', 'Toyota', FALSE);

INSERT INTO "agencias" (nombre_agencia, direccion) 
VALUES 
('Agencia Central', 'Calle Principal 123'),
('Agencia Norte', 'Avenida Norte 456'),
('Agencia Sur', 'Boulevard del Sur 789'),
('Agencia Este', 'Plaza del Este 101');

INSERT INTO "reservas" (id_cliente, fecha_inicio, fecha_final, costo_total, id_agencia) 
VALUES 
(1, '2023-06-01 10:00:00', '2023-06-10 10:00:00', 500.00, 1),
(2, '2023-06-05 12:00:00', '2023-06-15 12:00:00', 750.00, 2),
(3, '2023-06-10 09:00:00', '2023-06-20 09:00:00', 300.00, 3),
(4, '2023-06-15 14:00:00', '2023-06-25 14:00:00', 450.00, 4);

-- Insert initial data
INSERT INTO "clientes" (dni, nombre_completo, direccion, telefono, avalado, avalador) 
VALUES 
(12345678, 'Juan Perez', 'Calle Falsa 123', 987654321, TRUE, 1);

-- Update the 'avalador' field
UPDATE "clientes" SET avalador = id_cliente WHERE nombre_completo = 'Juan Perez';