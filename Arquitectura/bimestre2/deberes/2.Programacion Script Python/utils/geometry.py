import math

def perimetro_cuadrilatero(lado:float):return lado*4

def area_cuadrilatero(l1:float, l2:float):return l1*l2

def perimetro_circulo(radio):return 2*math.pi*radio

def area_circulo(radio):return math.pi*radio**2

def perimetro_triangulo(lado1:float, lado2:float, lado3:float):
    return lado1 + lado2 + lado3

def area_triangulo(lado1:float, lado2:float, lado3:float):
    s = perimetro_triangulo(lado1 = lado1, lado2 = lado2, lado3 = lado3)/2
    area = (s*(s-lado1)*(s-lado2)*(s-lado3))**(1/2)
    return area

def perimetro_rectangulo(lado_horizontal:float, lado_vertical:float):
    return 2*lado_horizontal + 2* lado_vertical

def area_rectangulo(lado_horizontal:float, lado_vertical:float):
    return lado_horizontal*lado_vertical

def print_resultado(nombre_figura, perimetro, area):
    print(f"El perimetro de {nombre_figura} es {perimetro:.2f}")
    print(f"El area de {nombre_figura} es {area:.2f}")
