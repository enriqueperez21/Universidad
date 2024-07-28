import argparse
from utils import geometry 

def main(figura):
    print("=====Programa Geometría=====")
    print("=Autor: Enrique Pérez S=")

    perimetro = 0
    area = 0
    
    match(figura):
        case "cuadrado":
            lado = input("Ingrese el valor del lado: ")
            lado = float(lado)
            perimetro = geometry.perimetro_cuadrilatero(lado=lado)
            area = geometry.area_cuadrilatero(l1=lado, l2=lado)

        case "rectangulo":
            lado_horizontal = input("Ingrese el valor del lado horizontal: ")
            lado_horizontal = float(lado_horizontal)
            lado_vertical = input("Ingrese el valor del lado vertical: ")
            lado_vertical = float(lado_vertical)
            perimetro = geometry.perimetro_rectangulo(lado_horizontal=lado_horizontal,lado_vertical=lado_vertical)
            area = geometry.area_rectangulo(lado_horizontal=lado_horizontal,lado_vertical=lado_vertical)
        
        case "circulo":
            radio = input("Ingrese el valor del radio: ")
            radio = float(radio)
            perimetro = geometry.perimetro_circulo(radio)
            area = geometry.area_circulo(radio)
        
        case "triangulo":
            lado1 = input("Ingrese el valor del lado1 ")
            lado1 = float(lado1)
            lado2 = input("Ingrese el valor del lado2 ")
            lado2 = float(lado2)
            lado3 = input("Ingrese el valor de la lado3 ")
            lado3 = float(lado1)
            perimetro = geometry.perimetro_triangulo(lado1 = lado1, lado2 = lado2, lado3 = lado3)
            area = geometry.area_triangulo(lado1 = lado1, lado2 = lado2, lado3 = lado3)
        
        case _:
            print("Ingrese una figura geometrica escribiendo python main.py --fig <nombre de la figura>")

    geometry.print_resultado(nombre_figura=figura,perimetro=perimetro,area=area)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--fig", default="cuadrado", help="Utilizando --fig 'Cuadrado/circulo' podrás calcular el perímetro y el area")
    args = parser.parse_args()
    main(figura=args.fig)
