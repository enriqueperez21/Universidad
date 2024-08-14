import requests
import os
import csv
from datetime import datetime


QUITO_LAT = -0.2299
QUITO_LONGITUDE = -78.5249
API_KEY = "2d0126e794e76199a4aecf1ac87d4f78"
FILE_NAME = "clima-quito-hoy.csv"


def get_weather(lat, lon, api):
    url = f"https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={api}"
    response = requests.get(url)
    data = response.json()
    return(data)

def write2csv(json_response, csv_filename):
    file_exists = os.path.isfile(csv_filename)
    
    with open(csv_filename, mode='a', newline='') as file:
        writer = csv.DictWriter(file, fieldnames=json_response.keys())
        
        if not file_exists:
            writer.writeheader()
        
        writer.writerow(json_response)


def process(json):
    sunrise = json.get("sys", {}).get("sunrise")
    sunset = json.get("sys", {}).get("sunset")

    normalized_dict = {
        "date": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
        "city": json.get("name"),
        "latitude": json.get("coord", {}).get("lat"),
        "longitude": json.get("coord", {}).get("lon"),
        "temperature": json.get("main", {}).get("temp"),
        "feels_like": json.get("main", {}).get("feels_like"),
        "temp_min": json.get("main", {}).get("temp_min"),
        "temp_max": json.get("main", {}).get("temp_max"),
        "pressure": json.get("main", {}).get("pressure"),
        "humidity": json.get("main", {}).get("humidity"),
        "sea_level_pressure": json.get("main", {}).get("sea_level"),
        "ground_level_pressure": json.get("main", {}).get("grnd_level"),
        "weather_main": json.get("weather", [{}])[0].get("main"),
        "weather_description": json.get("weather", [{}])[0].get("description"),
        "weather_icon": json.get("weather", [{}])[0].get("icon"),
        "visibility": json.get("visibility"),
        "wind_speed": json.get("wind", {}).get("speed"),
        "wind_deg": json.get("wind", {}).get("deg"),
        "wind_gust": json.get("wind", {}).get("gust"),
        "cloudiness": json.get("clouds", {}).get("all"),
        "sunrise": datetime.utcfromtimestamp(sunrise).strftime('%Y-%m-%d %H:%M:%S') if sunrise else None,
        "sunset": datetime.utcfromtimestamp(sunset).strftime('%Y-%m-%d %H:%M:%S') if sunset else None,
        "timezone": json.get("timezone"),
        "country": json.get("sys", {}).get("country"),
    }
    return normalized_dict


def main():
    print("===== Bienvenido a Quito-Clima =====")
    quito_weather = get_weather(lat=QUITO_LAT, lon=QUITO_LONGITUDE, api=API_KEY)
    if quito_weather['cod']!=404:
        processed_data = process(quito_weather)
        write2csv(processed_data, FILE_NAME)
        
    else:
        print("Ciudad no disponible o API KEY no válida")


if __name__ == '__main__':
    main()