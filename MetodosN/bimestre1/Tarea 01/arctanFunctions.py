import math

def funct(x):
    return x - (1/3)*x**3 + (1/5)*x**5

def arctan(x, y):
    return math.atan2(x, y)

def get_values(list):
    values = []
    for arg in (list):
        values.append(float(arg))
    return values