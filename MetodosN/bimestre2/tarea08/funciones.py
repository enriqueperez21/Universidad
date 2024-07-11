import numpy as np
import sympy as sp
import pandas as pd

def calcular_exponencial(exponente):
    return np.exp(exponente)

def log_natural(x):
    return np.log(x)

def sumatoria(a):
    return np.sum(a)

def grado2(df):
    # Sumatorias necesarias
    x_sum = sumatoria(df['x'])
    y_sum = sumatoria(df['y'])
    xy_sum = sumatoria(df['x'] * df['y'])
    x2_sum = sumatoria(df['x'] ** 2)

    # Número de puntos
    n = len(df)

    # Definimos las incógnitas
    b0, b1 = sp.symbols('b0 b1')

    # Definimos las dos ecuaciones basadas en la minimización de errores
    eq1 = sp.Eq(n * b0 + b1 * x_sum, y_sum)
    eq2 = sp.Eq(b0 * x_sum + b1 * x2_sum, xy_sum)

    # Resolvemos el sistema de ecuaciones
    solution = sp.solve((eq1, eq2), (b0, b1))
    return solution

def grado3(df):
    # Sumatorias necesarias
    x_sum = sumatoria(df['x'])
    y_sum = sumatoria(df['y'])
    xy_sum = sumatoria(df['x'] * df['y'])
    x2_sum = sumatoria(df['x'] ** 2)
    x3_sum = sumatoria(df['x'] ** 3)
    x4_sum = sumatoria(df['x'] ** 4)
    x2y_sum = sumatoria(df['x'] ** 2 * df['y'])

    # Número de puntos
    n = len(df)

    # Definimos las incógnitas
    a, b, c = sp.symbols('a b c')

    # Definimos las ecuaciones basadas en la minimización de errores
    eq1 = sp.Eq(a * x2_sum + b * x_sum + c * n, y_sum)
    eq2 = sp.Eq(a * x3_sum + b * x2_sum + c * x_sum, xy_sum)
    eq3 = sp.Eq(a * x4_sum + b * x3_sum + c * x2_sum, x2y_sum)

    # Resolvemos el sistema de ecuaciones
    solution = sp.solve((eq1, eq2, eq3), (a, b, c))
    return solution

def grado4(df):
    # Sumatorias necesarias
    x_sum = sumatoria(df['x'])
    y_sum = sumatoria(df['y'])
    xy_sum = sumatoria(df['x'] * df['y'])
    x2_sum = sumatoria(df['x'] ** 2)
    x3_sum = sumatoria(df['x'] ** 3)
    x4_sum = sumatoria(df['x'] ** 4)
    x5_sum = sumatoria(df['x'] ** 5)
    x6_sum = sumatoria(df['x'] ** 6)
    x2y_sum = sumatoria(df['x'] ** 2 * df['y'])
    x3y_sum = sumatoria(df['x'] ** 3 * df['y'])

    # Número de puntos
    n = len(df)

    # Definimos las incógnitas
    a, b, c, d = sp.symbols('a b c d')

    # Definimos las ecuaciones basadas en la minimización de errores
    eq1 = sp.Eq(a * x3_sum + b * x2_sum + c * x_sum + d * n, y_sum)
    eq2 = sp.Eq(a * x4_sum + b * x3_sum + c * x2_sum + d * x_sum,  xy_sum)
    eq3 = sp.Eq(a * x5_sum + b * x4_sum + c * x3_sum + d * x2_sum, x2y_sum)
    eq4 = sp.Eq(a * x6_sum + b * x5_sum + c * x4_sum + d * x3_sum, x3y_sum)

    # Resolvemos el sistema de ecuaciones
    solution = sp.solve((eq1, eq2, eq3, eq4), (a, b, c, d))
    return solution

def resolver_d(df):
    x = (df['x'])
    x_sum = sumatoria(x)
    x2_sum = sumatoria(x**2)
    y = (df['y'])
    Y_log = log_natural(df['y'])
    Y_log_sum = sumatoria(Y_log)
    XY_log_sum = sumatoria(x*Y_log)
    # Número de puntos
    n = len(df)

    # Definimos las incógnitas
    B_log, a = sp.symbols('B_log a')

    # Definimos las dos ecuaciones basadas en la minimización de errores
    eq1 = sp.Eq(n * B_log + a * x_sum, Y_log_sum)
    eq2 = sp.Eq(B_log * x_sum + a * x2_sum, XY_log_sum)

    # Resolvemos el sistema de ecuaciones
    solution = sp.solve((eq1, eq2), (B_log, a))
    a = list(solution.values())
    b = float(a[0])
    a = float(a[1])
    b = np.exp(b)
    return {'a': a,'b':b}