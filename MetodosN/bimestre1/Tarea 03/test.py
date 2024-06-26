def lado_derecho(x):
    return (1 + 2*x) / (1 + x + x**2)

def termino_izquierdo(x, n):
    numerador = (1 - 2*x) * (2**n * x**(2**n - 1))
    denominador = 1 - x**(2**n) + x**(2**(n+1))
    return numerador / denominador

def calcular_terminos_necesarios(x, tolerancia=1e-6):
    suma_parcial = 0
    valor_lado_derecho = lado_derecho(x)
    n = 0
    
    while True:
        termino = termino_izquierdo(x, n)
        suma_parcial += termino
        
        if abs(suma_parcial - valor_lado_derecho) < tolerancia:
            return n + 1  # Devuelve el número de términos necesarios
        
        n += 1

# Valor de x dado
x = 0.25
tolerancia = 1e-6

# Calcular el número de términos necesarios
terminos_necesarios = calcular_terminos_necesarios(x, tolerancia)
print("Número de términos necesarios:", terminos_necesarios)