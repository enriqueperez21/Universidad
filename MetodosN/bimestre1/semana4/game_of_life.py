def print_list(rows, columns, list):
    print("Tabla: ")
    for each_row in range(rows):
        current_column = list[each_row]
        for values in current_column:
            print(values, end="")
        print("")

def get_list(rows, columns, list):
    i = 0
    while i < rows:
        list[i] = input().split("")
        i += 1
    print_list(rows, columns, list)


def get_number(message):
    return int(input(message))
    
def get_loop(condition, message):
    value = 0
    while eval(condition):
        try:
            value = get_number(message)
        except ValueError:
            print("el valor debe ser un numero válido")
    return value
        
        
def main():
    print("Ingresa los valores correspondientes: ")
    message1 = "Ingrese la cantidad de filas debe ser mayor o igual a 1: \n"
    n = get_loop("value < 1",message1)
    message2 = "Ingrese la cantidad de columnas debe ser mayor a 1 y menor o igual a 25: \n"
    m = get_loop("value < 1 or value > 25", message2) 
    message3 = "Ingrese la cantidad de iteraciones : \"Mayor a 1 y menor a 10**7\" \n"
    c = get_loop("value < 1 or value > 10**7",message3)
    list = [["-"]*m] * n
    print_list(n,m,list)
    input_list = get_list(n, m, list)


    
main()