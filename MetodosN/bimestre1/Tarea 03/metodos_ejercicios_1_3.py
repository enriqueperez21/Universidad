import math

def truncar(num, cant_digitos):
    multiplicador = 10 ** cant_digitos
    return math.trunc(num * multiplicador)/multiplicador

def calcular_en_orden(my_function, maximo):
    print("Calculo en orden")
    resultado = 0
    for i in range(1, maximo+1):
        temp_result = my_function(i)
        temp_result = truncar(temp_result, 3)
        print(f"{i}: {temp_result}", end= " - ")
        resultado += temp_result
    print()
    return resultado

def calcular_contra_orden(my_function, maximo):
    print("Calculo al revés")
    resultado = 0
    for i in range(0, maximo):
        value = (maximo)-i
        temp_result = my_function(value)
        temp_result = truncar(temp_result,3)
        print(f"{i}: {temp_result}", end= " - ")
        resultado += temp_result
    print()
    return resultado

def Main():
    my_function_1 = lambda i: (1/i**2)
    my_function_2 = lambda i: (1/i**3)
    result_1 = calcular_en_orden(my_function_1, 10)
    result_1_contra = calcular_contra_orden(my_function_1, 10)
    result_2 = calcular_en_orden(my_function_2, 10)
    result_2_contra = calcular_contra_orden(my_function_2, 10)
    print(f"Result 1: normal:{result_1} - contra:{result_1_contra}")
    print(f"Result 2: normal:{result_2} - contra:{result_2_contra}")

Main()