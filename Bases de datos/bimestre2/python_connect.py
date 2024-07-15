""" import pg8000.native
conect = pg8000.connect(user="postgres",host="127.0.0.1",database="db_class",port=5432,password="kyk21")
strComm = "Select nombre_prod FROM productos"
cur = conect.cursor()
datos = cur.execute(strComm)
for fila in datos:
    print(fila) 

 """
import pg8000

# Datos de conexión
host = "localhost"
port = 5432
database = "db_class"
user = "postgres"
password = "kyk21"

# Conectarse a la base de datos
try:
    conn = pg8000.connect(
        host=host,
        port=port,
        database=database,
        user=user,
        password=password
    )
    print("Conexión exitosa")

    # Crear un cursor
    cursor = conn.cursor()

    # Ejecutar una consulta de prueba
    datos = cursor.execute("Select nombre_prod FROM productos")
    for filas in datos:
        print(filas)
    # Obtener el resultado de la consulta
    version = cursor.fetchone()
    print(f"Versión de PostgreSQL: {version}")

    # Cerrar el cursor y la conexión
    cursor.close()
    conn.close()
    print("Conexión cerrada")

except Exception as e:
    print(f"Error de conexión: {e}")