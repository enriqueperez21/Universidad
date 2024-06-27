CREATE TABLE Clientes(
	id_cliente int NOT NULL PRIMARY KEY,
	nombre_cli varchar(25) NOT NULL,
	dir_cli varchar(22) NOT NULL,
	tel_cli varchar(10) NULL,
	fecha_nac date NULL
);
CREATE TABLE Facturas(
	num_factura int NOT NULL PRIMARY KEY,
	total decimal(9, 2) NOT NULL,
	iva decimal(9, 2) NOT NULL,
	fecha_fact date NOT NULL,
	id_cliente int NOT NULL,
        CONSTRAINT FK_clie FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente)
                   ON DELETE CASCADE
);
CREATE TABLE Items(
	cant int NOT NULL,
	num_factura int NOT NULL,
	id_producto int NOT NULL
);
CREATE TABLE Productos(
	id_producto int NOT NULL PRIMARY KEY,
	nombre_prod varchar(30) NOT NULL,
	precio_unit decimal(7, 2) NOT NULL,
	unidad varchar(20) NULL,
	id_tipo int NOT NULL,
	id_proveedor int NOT NULL
);
CREATE TABLE Proveedores(
	id_proveedor int NOT NULL PRIMARY KEY,
	nombre_prov varchar(20) NOT NULL,
	ciudad_prov varchar(11) NOT NULL,
	dir_prov varchar(20) NULL
);
CREATE TABLE Tipos(
	id_tipo int NOT NULL PRIMARY KEY,
	tipo varchar(20) NOT NULL
);

INSERT INTO Clientes (id_cliente, nombre_cli, dir_cli, tel_cli, fecha_nac) VALUES (1, N'Verònica Còrdova', N'18 de noviembre', N'0996558715', CAST(N'1989-07-15' AS Date));
INSERT INTO Clientes (id_cliente, nombre_cli, dir_cli, tel_cli, fecha_nac) VALUES (2, N'Fabricio Pèrez', N'Shyris ', N'0975823558', CAST(N'1994-02-15' AS Date));
INSERT INTO Clientes (id_cliente, nombre_cli, dir_cli, tel_cli, fecha_nac) VALUES (3, N'Silvana Jimènez', N'Maximiliano Rodrìguez', N'0995763221', CAST(N'1997-11-18' AS Date));
INSERT INTO Clientes (id_cliente, nombre_cli, dir_cli, tel_cli, fecha_nac) VALUES (4, N'Cèsar Catillo', N'Colòn', N'0992351478', CAST(N'1992-03-10' AS Date));
INSERT INTO Clientes (id_cliente, nombre_cli, dir_cli, tel_cli, fecha_nac) VALUES (5, N'Pablo Aguilar', N'Acacias', N'0951396578', CAST(N'1970-12-23' AS Date));
INSERT INTO Clientes (id_cliente, nombre_cli, dir_cli, tel_cli, fecha_nac) VALUES (6, N'Katherine Àvila', N'Rìo Bobonaza', N'0965147896', CAST(N'1969-05-19' AS Date));
INSERT INTO Clientes (id_cliente, nombre_cli, dir_cli, tel_cli, fecha_nac) VALUES (7, N'Jesika Tamayo', N'Eloy Alfaro', N'0985632148', CAST(N'1991-11-03' AS Date));
INSERT INTO Clientes (id_cliente, nombre_cli, dir_cli, tel_cli, fecha_nac) VALUES (8, N'jesika ;nzalez', N'San Pedro', N'0978512369', CAST(N'1993-12-07' AS Date));
INSERT INTO Clientes (id_cliente, nombre_cli, dir_cli, tel_cli, fecha_nac) VALUES (9, N'Lucrecia Calvas', N'Solanda', N'0997512369', CAST(N'1958-04-28' AS Date));
INSERT INTO Clientes (id_cliente, nombre_cli, dir_cli, tel_cli, fecha_nac) VALUES (10, N'Nancy Erazo', N'Ciudadela Zamora', N'0995478962', CAST(N'1986-07-21' AS Date));
INSERT INTO Clientes (id_cliente, nombre_cli, dir_cli, tel_cli, fecha_nac) VALUES (11, N'Nathaly Guaricela ', N'Rodrìguez Witt', N'0998523155', CAST(N'1982-06-14' AS Date));
INSERT INTO Clientes (id_cliente, nombre_cli, dir_cli, tel_cli, fecha_nac) VALUES (12, N'Patricia Chàvez', N'10 de A;sto', N'0971125896', CAST(N'1996-05-17' AS Date));
INSERT INTO Clientes (id_cliente, nombre_cli, dir_cli, tel_cli, fecha_nac) VALUES (13, N'Diana Jàcome ', N'Universitaria 12-31', N'0982135698', CAST(N'1999-08-02' AS Date));
INSERT INTO Clientes (id_cliente, nombre_cli, dir_cli, tel_cli, fecha_nac) VALUES (14, N'Alberto Hurtado', N'Mercadillo', N'0952147896', CAST(N'2002-01-05' AS Date));
INSERT INTO Clientes (id_cliente, nombre_cli, dir_cli, tel_cli, fecha_nac) VALUES (15, N'Galo Yèpez', N'Los Arupos', N'0987547144', CAST(N'2000-04-11' AS Date));
INSERT INTO Clientes (id_cliente, nombre_cli, dir_cli, tel_cli, fecha_nac) VALUES (16, N'Alex Alvarez', N'Rocafuerte', N'0952147824', CAST(N'1996-09-13' AS Date));
INSERT INTO Clientes (id_cliente, nombre_cli, dir_cli, tel_cli, fecha_nac) VALUES (17, N'Antonio Criollo', N'La Loma', N'0952147362', CAST(N'1990-10-02' AS Date));
INSERT INTO Clientes (id_cliente, nombre_cli, dir_cli, tel_cli, fecha_nac) VALUES (18, N'Daniel Beltràn ', N'Conocoto', N'0942254118', CAST(N'1987-07-13' AS Date));
INSERT INTO Clientes (id_cliente, nombre_cli, dir_cli, tel_cli, fecha_nac) VALUES (19, N'Alejandra Briones', N'Portete', N'0985362147', NULL);
INSERT INTO Clientes (id_cliente, nombre_cli, dir_cli, tel_cli, fecha_nac) VALUES (20, N'Erika Lòpez', N'Portovelis', N'0965214785', NULL);
INSERT INTO Facturas (num_factura, total, iva, fecha_fact, id_cliente) VALUES (1, CAST(20.00 AS Decimal(9, 2)), CAST(2.40 AS Decimal(9, 2)), CAST(N'2021-02-16' AS Date), 1);
INSERT INTO Facturas (num_factura, total, iva, fecha_fact, id_cliente) VALUES (2, CAST(55.00 AS Decimal(9, 2)), CAST(6.60 AS Decimal(9, 2)), CAST(N'2020-07-18' AS Date), 1);
INSERT INTO Facturas (num_factura, total, iva, fecha_fact, id_cliente) VALUES (3, CAST(80.00 AS Decimal(9, 2)), CAST(9.60 AS Decimal(9, 2)), CAST(N'2021-01-10' AS Date), 1);
INSERT INTO Facturas (num_factura, total, iva, fecha_fact, id_cliente) VALUES (4, CAST(10.00 AS Decimal(9, 2)), CAST(1.20 AS Decimal(9, 2)), CAST(N'2020-04-09' AS Date), 2);
INSERT INTO Facturas (num_factura, total, iva, fecha_fact, id_cliente) VALUES (5, CAST(450.00 AS Decimal(9, 2)), CAST(54.00 AS Decimal(9, 2)), CAST(N'2020-09-01' AS Date), 2);
INSERT INTO Facturas (num_factura, total, iva, fecha_fact, id_cliente) VALUES (6, CAST(1000.00 AS Decimal(9, 2)), CAST(120.00 AS Decimal(9, 2)), CAST(N'2021-03-08' AS Date), 3);
INSERT INTO Facturas (num_factura, total, iva, fecha_fact, id_cliente) VALUES (7, CAST(335.00 AS Decimal(9, 2)), CAST(40.20 AS Decimal(9, 2)), CAST(N'2020-01-02' AS Date), 4);
INSERT INTO Facturas (num_factura, total, iva, fecha_fact, id_cliente) VALUES (8, CAST(2500.00 AS Decimal(9, 2)), CAST(300.00 AS Decimal(9, 2)), CAST(N'2021-04-25' AS Date),5);
INSERT INTO Facturas (num_factura, total, iva, fecha_fact, id_cliente) VALUES (9, CAST(98.00 AS Decimal(9, 2)), CAST(11.76 AS Decimal(9, 2)), CAST(N'2021-03-19' AS Date), 6);
INSERT INTO Facturas (num_factura, total, iva, fecha_fact, id_cliente) VALUES (10, CAST(80.00 AS Decimal(9, 2)), CAST(9.60 AS Decimal(9, 2)), CAST(N'2020-12-23' AS Date), 7);
INSERT INTO Facturas (num_factura, total, iva, fecha_fact, id_cliente) VALUES (11, CAST(400.00 AS Decimal(9, 2)), CAST(48.00 AS Decimal(9, 2)), CAST(N'2021-01-11' AS Date), 8);
INSERT INTO Facturas (num_factura, total, iva, fecha_fact, id_cliente) VALUES (12, CAST(189.00 AS Decimal(9, 2)), CAST(22.68 AS Decimal(9, 2)), CAST(N'2020-12-30' AS Date), 9);
INSERT INTO Facturas (num_factura, total, iva, fecha_fact, id_cliente) VALUES (13, CAST(75.00 AS Decimal(9, 2)), CAST(9.00 AS Decimal(9, 2)), CAST(N'2020-07-18' AS Date), 10);
INSERT INTO Facturas (num_factura, total, iva, fecha_fact, id_cliente) VALUES (14, CAST(455.00 AS Decimal(9, 2)), CAST(54.60 AS Decimal(9, 2)), CAST(N'2021-01-10' AS Date), 10);
INSERT INTO Facturas (num_factura, total, iva, fecha_fact, id_cliente) VALUES (15, CAST(500.00 AS Decimal(9, 2)), CAST(60.00 AS Decimal(9, 2)), CAST(N'2020-04-09' AS Date), 11);
INSERT INTO Facturas (num_factura, total, iva, fecha_fact, id_cliente) VALUES (16, CAST(750.00 AS Decimal(9, 2)), CAST(90.00 AS Decimal(9, 2)), CAST(N'2020-09-01' AS Date), 11);
INSERT INTO Facturas (num_factura, total, iva, fecha_fact, id_cliente) VALUES (17, CAST(900.00 AS Decimal(9, 2)), CAST(108.00 AS Decimal(9, 2)), CAST(N'2021-03-08' AS Date), 12);
INSERT INTO Facturas (num_factura, total, iva, fecha_fact, id_cliente) VALUES (18, CAST(225.00 AS Decimal(9, 2)), CAST(27.00 AS Decimal(9, 2)), CAST(N'2020-01-02' AS Date), 12);
INSERT INTO Facturas (num_factura, total, iva, fecha_fact, id_cliente) VALUES (19, CAST(2000.00 AS Decimal(9, 2)), CAST(240.00 AS Decimal(9, 2)), CAST(N'2021-04-25' AS Date), 12);
INSERT INTO Facturas (num_factura, total, iva, fecha_fact, id_cliente) VALUES (20, CAST(390.00 AS Decimal(9, 2)), CAST(46.80 AS Decimal(9, 2)), CAST(N'2021-03-19' AS Date), 13);
INSERT INTO Facturas (num_factura, total, iva, fecha_fact, id_cliente) VALUES (21, CAST(600.00 AS Decimal(9, 2)), CAST(72.00 AS Decimal(9, 2)), CAST(N'2020-12-23' AS Date), 14);
INSERT INTO Facturas (num_factura, total, iva, fecha_fact, id_cliente) VALUES (22, CAST(145.00 AS Decimal(9, 2)), CAST(17.40 AS Decimal(9, 2)), CAST(N'2021-01-11' AS Date), 14);
INSERT INTO Facturas (num_factura, total, iva, fecha_fact, id_cliente) VALUES (23, CAST(770.00 AS Decimal(9, 2)), CAST(92.40 AS Decimal(9, 2)), CAST(N'2020-12-30' AS Date), 15);
INSERT INTO Facturas (num_factura, total, iva, fecha_fact, id_cliente) VALUES (24, CAST(490.00 AS Decimal(9, 2)), CAST(58.80 AS Decimal(9, 2)), CAST(N'2021-01-11' AS Date), 16);
INSERT INTO Facturas (num_factura, total, iva, fecha_fact, id_cliente) VALUES (25, CAST(525.00 AS Decimal(9, 2)), CAST(63.00 AS Decimal(9, 2)), CAST(N'2021-01-11' AS Date), 17);
INSERT INTO Facturas (num_factura, total, iva, fecha_fact, id_cliente) VALUES (26, CAST(689.00 AS Decimal(9, 2)), CAST(82.68 AS Decimal(9, 2)), CAST(N'2020-12-30' AS Date), 18);
INSERT INTO Facturas (num_factura, total, iva, fecha_fact, id_cliente) VALUES (27, CAST(99.00 AS Decimal(9, 2)), CAST(11.88 AS Decimal(9, 2)), CAST(N'2020-12-30' AS Date), 18);
INSERT INTO Facturas (num_factura, total, iva, fecha_fact, id_cliente) VALUES (28, CAST(633.00 AS Decimal(9, 2)), CAST(75.96 AS Decimal(9, 2)), CAST(N'2020-07-18' AS Date), 19);
INSERT INTO Facturas (num_factura, total, iva, fecha_fact, id_cliente) VALUES (29, CAST(875.00 AS Decimal(9, 2)), CAST(105.00 AS Decimal(9, 2)), CAST(N'2021-01-10' AS Date), 20);
INSERT INTO Facturas (num_factura, total, iva, fecha_fact, id_cliente) VALUES (30, CAST(934.00 AS Decimal(9, 2)), CAST(112.08 AS Decimal(9, 2)), CAST(N'2020-04-09' AS Date), 20);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (2, 1, 1);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (10, 1, 2);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (15, 1, 3);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (8, 1, 4);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (5, 1, 5);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (6, 2, 1);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (10, 2, 2);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (3, 2, 4);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (9, 2, 6);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (4, 2, 7);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (7, 2, 9);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (1, 3, 11);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (2, 3, 12);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (4, 3, 24);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (7, 3, 33);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (3, 3, 34);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (2, 4, 2);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (4, 4, 3);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (6, 4, 6);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (10, 4, 8);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (8, 5, 10);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (12, 5, 12);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (5, 5, 14);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (10, 5, 15);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (13, 5, 1);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (20, 6, 2);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (15, 6, 3);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (9, 6, 22);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (10, 6, 27);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (2, 6, 33);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (5, 7, 5);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (7, 7, 7);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (16, 7, 9);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (20, 8, 39);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (25, 8, 40);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (2, 8, 1);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (10, 8, 10);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (15, 9, 25);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (5, 9, 11);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (35, 9, 29);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (40, 10, 14);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (50, 10, 38);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (60, 10, 6);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (20, 11, 17);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (10, 11, 24);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (15, 11, 33);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (30, 11, 7);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (45, 12, 16);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (5, 12, 19);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (28, 12, 26);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (15, 13, 40);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (25, 13, 28);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (80, 14, 32);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (70, 15, 34);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (100, 16, 2);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (90, 16, 3);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (10, 17, 8);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (15, 17, 37);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (45, 18, 36);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (15, 19, 35);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (20, 19, 40);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (100, 20, 9);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (70, 20, 18);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (50, 21, 20);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (5, 22, 1);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (60, 22, 10);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (20, 23, 25);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (10, 23, 34);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (80, 24, 11);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (50, 24, 14);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (100, 25, 1);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (200, 26, 29);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (30, 27, 38);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (60, 28, 27);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (10, 29, 24);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (40, 29, 23);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (70, 30, 21);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (50, 30, 19);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (20, 30, 17);
INSERT INTO Items (cant, num_factura, id_producto) VALUES (100, 30, 16);
;
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (1, N'Jabòn', CAST(0.30 AS Decimal(7, 2)), N'20', 1, 1);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (2, N'Shampoo', CAST(2.50 AS Decimal(7, 2)), N'15', 2, 1);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (3, N'Pasta Dental', CAST(1.00 AS Decimal(7, 2)), N'10', 2, 1);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (4, N'Lava Platos', CAST(2.00 AS Decimal(7, 2)), N'15', 1, 1);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (5, N'Desodorante', CAST(4.50 AS Decimal(7, 2)), N'30', 3, 2);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (6, N'Medias', CAST(2.00 AS Decimal(7, 2)), N'25', 4, 2);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (7, N'Camiseta', CAST(12.00 AS Decimal(7, 2)), N'35', 5, 2);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (8, N'Pantalòn Jean', CAST(20.00 AS Decimal(7, 2)), N'40', 6, 2);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (9, N'Camisa', CAST(25.00 AS Decimal(7, 2)), N'15', 7, 3);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (10, N'Blusa', CAST(30.00 AS Decimal(7, 2)), N'40', 7, 3);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (11, N'Chompa', CAST(45.00 AS Decimal(7, 2)), N'30', 8, 3);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (12, N'Chaleco', CAST(15.00 AS Decimal(7, 2)), N'15', 9, 3);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (13, N'Perfume', CAST(20.00 AS Decimal(7, 2)), N'10', 10, 4);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (14, N'Alcohol', CAST(3.50 AS Decimal(7, 2)), N'50', 11, 4);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (15, N'Mascarilla', CAST(0.25 AS Decimal(7, 2)), N'100', 11, 4);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (16, N'Avena', CAST(1.00 AS Decimal(7, 2)), N'60', 12, 4);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (17, N'Azúcar', CAST(1.25 AS Decimal(7, 2)), N'75', 12, 5);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (18, N'Café', CAST(3.00 AS Decimal(7, 2)), N'25', 13, 5);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (19, N'Cereales', CAST(4.50 AS Decimal(7, 2)), N'70', 13, 5);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (20, N'Harina', CAST(2.75 AS Decimal(7, 2)), N'40', 13, 5);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (21, N'Sal', CAST(0.50 AS Decimal(7, 2)), N'30', 13, 6);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (22, N'Catsup', CAST(1.75 AS Decimal(7, 2)), N'45', 12, 6);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (23, N'Mayonesa', CAST(1.50 AS Decimal(7, 2)), N'80', 12, 6);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (24, N'Mermelada', CAST(5.00 AS Decimal(7, 2)), N'25', 13, 7);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (25, N'Miel', CAST(6.00 AS Decimal(7, 2)), N'30', 13, 7);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (26, N'Vinagre', CAST(0.80 AS Decimal(7, 2)), N'20', 11, 7);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (27, N'Fideo', CAST(0.75 AS Decimal(7, 2)), N'100', 12, 7);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (28, N'Aceitunas', CAST(3.25 AS Decimal(7, 2)), N'50', 14, 8);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (29, N'Champiñones enteros', CAST(2.30 AS Decimal(7, 2)), N'25', 14, 8);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (30, N'Frijoles enlatados', CAST(3.75 AS Decimal(7, 2)), N'30', 15, 8);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (31, N'Sardinas', CAST(5.00 AS Decimal(7, 2)), N'20', 16, 8);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (32, N'Sopa en lata', CAST(3.00 AS Decimal(7, 2)), N'70', 17, 9);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (33, N'Atún en agua/aceite', CAST(1.50 AS Decimal(7, 2)), N'55', 18, 9);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (34, N'Leche condesada', CAST(2.00 AS Decimal(7, 2)), N'80', 19, 9);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (35, N'Leche deslactosada', CAST(1.75 AS Decimal(7, 2)), N'90', 19, 9);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (36, N'Leche en polvo', CAST(2.30 AS Decimal(7, 2)), N'100', 20, 10);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (37, N'Leche evaporada', CAST(2.10 AS Decimal(7, 2)), N'75', 20, 10);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (38, N'Leche pasteurizada', CAST(0.80 AS Decimal(7, 2)), N'80', 21, 10);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (39, N'Yoghurt', CAST(2.80 AS Decimal(7, 2)), N'90', 22, 10);
INSERT INTO Productos (id_producto, nombre_prod, precio_unit, unidad, id_tipo, id_proveedor) VALUES (40, N'Mantequilla', CAST(1.50 AS Decimal(7, 2)), N'40', 23, 10);
;
INSERT INTO Proveedores (id_proveedor, nombre_prov, ciudad_prov, dir_prov) VALUES (1, N'Los Andes', N'Quito', N'Quitumbe');
INSERT INTO Proveedores (id_proveedor, nombre_prov, ciudad_prov, dir_prov) VALUES (2, N'Grupo 100', N'Loja', N'Las Peñas');
INSERT INTO Proveedores (id_proveedor, nombre_prov, ciudad_prov, dir_prov) VALUES (3, N'Asturias', N'Cuenca', N'Remigio');
INSERT INTO Proveedores (id_proveedor, nombre_prov, ciudad_prov, dir_prov) VALUES (4, N'ANG Corp', N'Guayaquil', N'Alborada');
INSERT INTO Proveedores (id_proveedor, nombre_prov, ciudad_prov, dir_prov) VALUES (5, N'Grupo Galtor', N'Portoviejo', N'Velez y Roman');
INSERT INTO Proveedores (id_proveedor, nombre_prov, ciudad_prov, dir_prov) VALUES (6, N'JyC', N'Loja', N'Rocafuerte');
INSERT INTO Proveedores (id_proveedor, nombre_prov, ciudad_prov, dir_prov) VALUES (7, N'Flanco Norte', N'Tulcàn', N'Pìo Jaramillo');
INSERT INTO Proveedores (id_proveedor, nombre_prov, ciudad_prov, dir_prov) VALUES (8, N'Pist & Pist', N'Quito', N'Kennedy');
INSERT INTO Proveedores (id_proveedor, nombre_prov, ciudad_prov, dir_prov) VALUES (9, N'Los Vencedores', N'Zamora', N'Av. 12 de Febrero');
INSERT INTO Proveedores (id_proveedor, nombre_prov, ciudad_prov, dir_prov) VALUES (10, N'Plateados', N'Machala', N'Calle 05 de Julio ');
INSERT INTO Tipos (id_tipo, tipo) VALUES (1, N'A-i1');
INSERT INTO Tipos (id_tipo, tipo) VALUES (2, N'A-i2');
INSERT INTO Tipos (id_tipo, tipo) VALUES (3, N'A-i3');
INSERT INTO Tipos (id_tipo, tipo) VALUES (4, N'A-i4');
INSERT INTO Tipos (id_tipo, tipo) VALUES (5, N'A-i5');
INSERT INTO Tipos (id_tipo, tipo) VALUES (6, N'B-i1');
INSERT INTO Tipos (id_tipo, tipo) VALUES (7, N'B-i2');
INSERT INTO Tipos (id_tipo, tipo) VALUES (8, N'B-I3');
INSERT INTO Tipos (id_tipo, tipo) VALUES (9, N'B-i4');
INSERT INTO Tipos (id_tipo, tipo) VALUES (10, N'B-i5');
INSERT INTO Tipos (id_tipo, tipo) VALUES (11, N'C-i1');
INSERT INTO Tipos (id_tipo, tipo) VALUES (12, N'C-i2');
INSERT INTO Tipos (id_tipo, tipo) VALUES (13, N'C-i3');
INSERT INTO Tipos (id_tipo, tipo) VALUES (14, N'C-i4');
INSERT INTO Tipos (id_tipo, tipo) VALUES (15, N'C-i5');
INSERT INTO Tipos (id_tipo, tipo) VALUES (16, N'D-i1');
INSERT INTO Tipos (id_tipo, tipo) VALUES (17, N'D-i2');
INSERT INTO Tipos (id_tipo, tipo) VALUES (18, N'D-i3');
INSERT INTO Tipos (id_tipo, tipo) VALUES (19, N'D-i4');
INSERT INTO Tipos (id_tipo, tipo) VALUES (20, N'D-i5');
INSERT INTO Tipos (id_tipo, tipo) VALUES (21, N'E-i1');
INSERT INTO Tipos (id_tipo, tipo) VALUES (22, N'E-i2');
INSERT INTO Tipos (id_tipo, tipo) VALUES (23, N'E-i3');
INSERT INTO Tipos (id_tipo, tipo) VALUES (24, N'E-i4');
INSERT INTO Tipos (id_tipo, tipo) VALUES (25, N'E-i5');
-- ALTER TABLE Facturas ADD CONSTRAINT fk_factura_cliente FOREIGN KEY(id_cliente)
-- REFERENCES Clientes(id_cliente) ON DELETE CASCADE;

ALTER TABLE Items ADD CONSTRAINT "fk_item_factura" FOREIGN KEY(num_factura)
REFERENCES Facturas(num_factura) ON DELETE CASCADE;
ALTER TABLE Items ADD CONSTRAINT fk_item_producto FOREIGN KEY(id_producto)
REFERENCES Productos(id_producto) ON DELETE CASCADE;
ALTER TABLE Productos ADD  CONSTRAINT producto_proveedor FOREIGN KEY(id_proveedor)
REFERENCES Proveedores(id_proveedor) ON DELETE CASCADE;
ALTER TABLE Productos ADD CONSTRAINT fk_producto_tipo FOREIGN KEY(id_tipo)
REFERENCES Tipos(id_tipo) ON DELETE CASCADE;