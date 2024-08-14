import os                                                                                                                                        
import pandas as pd
import matplotlib.pyplot as plt                                                                                                                  
import matplotlib.dates as mdates               

df = pd.read_csv('/home/kikeykarina/Documents/Universidad/Arquitectura/bimestre2/proyecto/CityWeather/clima-quito-hoy.csv')
# Define el tamaño de la figura de salida                                                                                                        
fig = plt.figure(figsize=(8,6))                                                                                                                  
plt.plot(df['date'], df['humidity']) # dibuja las variables dt y temperatura                                                                      
# ajuste para presentacion de fechas en la imagen                                                                                                
plt.gca().xaxis.set_major_locator(mdates.DayLocator(interval=2))                                                                                 
# plt.gca().xaxis.set_major_formatter(mdates.DateFormatter('%Y-%m-%d'))                                                                          
plt.grid()                                                                                                                                       
# Titulo que obtiene el nombre de la ciudad del DataFrame
plt.title(f'Main Temp vs Time in {next(iter(set(df.name)))}')                                                                                    
plt.xticks(rotation=40) # rotación de las etiquetas 40°                                                                                          
fig.tight_layout()                                                                                                                               
fname = '../public/images/humidity.png'                                                                                                       
plt.savefig(fname)