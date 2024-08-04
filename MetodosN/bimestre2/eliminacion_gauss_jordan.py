class Matriz:
    def __init__(self, filas, columnas):
        self.filas = filas
        self.columnas = columnas
        self.data = [[0 for _ in range(columnas)] for _ in range(filas)]

    def __str__(self):
        return '\n'.join(['\t'.join(map(str, fila)) for fila in self.data])

    def __add__(self, otra):
        if self.filas != otra.filas or self.columnas != otra.columnas:
            raise ValueError("Las matrices deben tener las mismas dimensiones para la suma")
        resultado = Matriz(self.filas, self.columnas)
        for i in range(self.filas):
            for j in range(self.columnas):
                resultado.data[i][j] = self.data[i][j] + otra.data[i][j]
        return resultado

    def __sub__(self, otra):
        if self.filas != otra.filas or self.columnas != otra.columnas:
            raise ValueError("Las matrices deben tener las mismas dimensiones para la resta")
        resultado = Matriz(self.filas, self.columnas)
        for i in range(self.filas):
            for j in range(self.columnas):
                resultado.data[i][j] = self.data[i][j] - otra.data[i][j]
        return resultado

    def __mul__(self, escalar):
        resultado = Matriz(self.filas, self.columnas)
        for i in range(self.filas):
            for j in range(self.columnas):
                resultado.data[i][j] = self.data[i][j] * escalar
        return resultado

    def __matmul__(self, otra):
        if self.columnas != otra.filas:
            raise ValueError("El número de columnas de la primera matriz debe ser igual al número de filas de la segunda")
        resultado = Matriz(self.filas, otra.columnas)
        for i in range(self.filas):
            for j in range(otra.columnas):
                suma = 0
                for k in range(self.columnas):
                    suma += self.data[i][k] * otra.data[k][j]
                resultado.data[i][j] = suma
        return resultado

    def transpuesta(self):
        resultado = Matriz(self.columnas, self.filas)
        for i in range(self.filas):
            for j in range(self.columnas):
                resultado.data[j][i] = self.data[i][j]
        return resultado

# Ejemplo de uso
A = Matriz(2, 3)
A.data = [[1, 2, 3],
         [4, 5, 6]]

B = Matriz(3, 2)
B.data = [[7, 8],
         [9, 10],
         [11, 12]]

C = A + A
D = A - B.transpuesta()
E = 2 * A
F = A @ B  # Multiplicación de matrices
G = A.transpuesta()

print("Suma:\n", C)
print("Resta:\n", D)
print("Multiplicación por escalar:\n", E)
print("Multiplicación de matrices:\n", F)
print("Transpuesta:\n", G)