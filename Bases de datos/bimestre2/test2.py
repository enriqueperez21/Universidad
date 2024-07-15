import pg8000

# Datos de conexión
host = "localhost"
port = 5432
database = "db_class"
user = "postgres"
password = "kyk21"

conn = pg8000.connect(host=host,port=port,database=database,user=user,password=password)
print("Conexión exitosa")

strComm = "SELECT nombre_prod, precio_unit, id_tipo FROM productos"
# Crear un cursor
cursor = conn.cursor()

# Ejecutar una consulta de prueba
datos = cursor.execute(strComm)
lista = []

for filas in datos:
    filas[1] = float(filas[1])
    lista.append(filas)

print(lista)

cursor.close()
conn.close()
print("Conexión cerrada")