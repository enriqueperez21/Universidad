def detectar_signo(numero_str):
    if numero_str[0] == '-':
        return -1, numero_str[1:]
    elif numero_str[0] == '+':
        return 1, numero_str[1:]
    else:
        return 1, numero_str

def entero_a_binario(numero):
    if numero == 0:
        return "0"
    binario = ""
    while numero > 0:
        binario = str(numero % 2) + binario
        numero = numero // 2
    return binario

def fraccion_a_binario(fraccion, precision=23):
    binario = "0."
    while fraccion > 0 and len(binario) - 2 < precision:  # len(binario) - 2 para descontar "0."
        fraccion *= 2
        if fraccion >= 1:
            binario += '1'
            fraccion -= 1
        else:
            binario += '0'
    return binario

# Ejemplo de uso
numero_str = "+6.56"
signo, numero_sin_signo = detectar_signo(numero_str)
numero = float(numero_sin_signo)
parte_entera = int(numero)
parte_fraccionaria = numero - parte_entera

binario_entero = entero_a_binario(parte_entera)
binario_fraccion = fraccion_a_binario(parte_fraccionaria)

signo_str = "positivo" if signo == 1 else "negativo"
print(f"El número es {signo_str}")
print(f"Parte entera: {parte_entera} en binario es {binario_entero}")
print(f"Parte fraccionaria: {parte_fraccionaria} en binario es {binario_fraccion}")
