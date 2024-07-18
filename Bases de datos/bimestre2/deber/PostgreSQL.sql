DO $$
BEGIN
	UPDATE Productos
            SET unidad = '37'
            WHERE nombre_prod LIKE 'Blusa';
			INSERT INTO Facturas 
			VALUES (31, (
				SELECT (3*(
					SELECT precio_unit 
					FROM Productos 
					WHERE nombre_prod = 'Blusa'
					) + 10.80)
				),
				10.80,CURRENT_DATE, (
					SELECT id_cliente 
					FROM Clientes
					WHERE nombre_cli LIKE 'Ver%'));				 
			INSERT INTO Items 
			VALUES (3, 31, 10);
EXCEPTION
    WHEN others THEN
        RAISE NOTICE 'Ocurrió un error durante la transacción: %', SQLERRM;
END $$;