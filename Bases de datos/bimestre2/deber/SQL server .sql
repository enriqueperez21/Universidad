BEGIN TRY
	BEGIN TRANSACTION
		UPDATE Productos 
		SET unidad= '37'
		WHERE nombre_prod='Blusa';
			
		INSERT INTO Facturas 
		VALUES (31, 
			(SELECT (3*(
				SELECT precio_unit 
				FROM Productos 
				WHERE nombre_prod = 'Blusa')
				+ 10.80)),
			10.80,'2024-07-16',
			(SELECT id_cliente 
			FROM Clientes
			WHERE nombre_cli LIKE 'Ver%'));
									 
		INSERT INTO Items 
		VALUES (3, 31, 10);
		
	COMMIT TRANSACTION
	print 'Transacción realizada correctamente'
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	print 'Ocurrió un ERROR- Deshaciendo transacción'
END CATCH