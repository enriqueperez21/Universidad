import numpy as np

def eliminacion_gaussiana(A, b):
  """
  Realiza la eliminación gaussiana para resolver un sistema de ecuaciones lineales.

  Args:
    A: Matriz de coeficientes (numpy.ndarray).
    b: Vector de términos independientes (numpy.ndarray).

  Returns:
    Vector solución (numpy.ndarray).
  """

  n = len(A)
  augmented_matrix = np.hstack((A, b.reshape(n, 1)))

  for i in range(n):
    # Encontrar el pivote
    pivot = augmented_matrix[i:, i].argmax() + i
    augmented_matrix[[i, pivot], :] = augmented_matrix[[pivot, i], :]

    # Hacer ceros debajo del pivote
    for j in range(i+1, n):
      factor = augmented_matrix[j, i] / augmented_matrix[i, i]
      augmented_matrix[j, :] -= factor * augmented_matrix[i, :]

  # Sustitución hacia atrás
  x = np.zeros(n)
  for i in range(n-1, -1, -1):
    x[i] = (augmented_matrix[i, -1] - np.dot(augmented_matrix[i, i+1:], x[i+1:])) / augmented_matrix[i, i]

  return x

# Ejemplo de uso
A = np.array([[2, -1, 1],
              [1, 1, 1],
              [3, 1, -1]])
b = np.array([8, 2, -2])

x = eliminacion_gaussiana(A, b)
print(x)
