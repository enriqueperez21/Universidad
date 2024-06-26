from typing import Callable

def newton_raphson(
    x: float,
    equation: Callable[[float], float],
    derivate: Callable[[float], float],
    tol: float,
    N: int
) -> float:
    return