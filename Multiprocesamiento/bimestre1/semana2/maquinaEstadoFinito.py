# Máquina de estado finito para lavadora.

# Estado inicial: Apagado.
# Estado después encendido.
# Programación: Lavado - Enguaje - Secado.
# Botón añade opción.

def encendido(): 
    print("Encendido")

def end():
    print("fin de la máquina.")

def WashButton(press):
    if(press):
        print("Lavado añadido.")
    else:
        print("No añadido")
    return press

def RinseButton(press):
    if(press):
        print("Enjuage programado.")
    else:
        print("No añadido")
    return press

def DryterButton(press):
    if(press):
        print("Secado programado.")
    else:
        print("No añadido")
    return press
    
def InputOption(button, message):
    option = input(f"{message} (y/n)")
    return button(option.lower() == "y")

def execute(wash, rinse, dryer):
    if(wash):
        print("Lavando ropa")
        print("Ropa lavada")
    if(rinse):
        print("Enjuagando ropa")
        print("Ropa enjuagada")
    if(dryer):
        print("Secando ropa")
        print("Ropa secada.")

def main():
    option = input("Desea prender el equipo? (y/n) ")
    on = (option.lower() == "y")

    if on:
        encendido()
        wash = InputOption(WashButton,"Lavar ropa? ")
        rinse = InputOption(RinseButton,"Enjuagar ropa ?")
        dryer = InputOption(DryterButton, "Secar ropa ?")
        print(f"Estados: lavar: {wash}, enjuagar: {rinse}, secar: {dryer}")
        execute(wash, rinse, dryer)
        end()
    else:
        end()

main()