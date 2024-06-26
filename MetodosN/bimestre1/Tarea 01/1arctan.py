import sys
import arctanFunctions

[x0, y0, x1, y1] = arctanFunctions.get_values(sys.argv[1:])

result_1_1 = arctanFunctions.arctan(x0,y0)
result_1_2 = arctanFunctions.funct(x0/y0)
print(f"Arctan: {result_1_1}")
print(f"Function: {result_1_2}")

result_2_1 = arctanFunctions.arctan(x1,y1)
result_2_2 = arctanFunctions.funct(x1/y1)
r1 = 4*(result_1_1 + result_2_1)
r2 = 4*(result_1_2 + result_2_2)
print(f"Arctan: {result_2_1}")
print(f"Result 2: {result_2_2}")
print(f"1: {r1}\n2: {r2}")