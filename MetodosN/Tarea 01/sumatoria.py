import sys

def factorial(n):
  if n == 0:
    return 1
  else:
    return n * factorial(n - 1)

max_num = int(sys.argv[1])
values = []
for n in range(max_num+1):
    value = 1/factorial(n)
    print(value, end=" ")
    values.append(value)

print(f"\nSumatoria: {sum(values)}")
