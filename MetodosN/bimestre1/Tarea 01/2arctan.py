import sys
import arctanFunctions

[x0, y0, x1, y1] = arctanFunctions.get_values(sys.argv[1:])

result_1_1 = arctanFunctions.arctan(x0,y0)
result_1_2 = arctanFunctions.funct(x0/y0)
print(f"Arctan: {result_1_1}")
print(f"Function: {result_1_2}")
_2result_1_1 = 16*result_1_1
_2result_1_2 = 16*result_1_2
print(f"Arctan:   16*{_2result_1_1}")
print(f"Function: 16*{_2result_1_2}")

result_2_1 = arctanFunctions.arctan(x1,y1)
result_2_2 = arctanFunctions.funct(x1/y1)
print(f"Arctan: {result_2_1}")
print(f"Function: {result_2_2}")
_2result_2_1 = 4*result_2_1
_2result_2_2 = 4*result_2_2
print(f"Arctan:   4*{_2result_2_1}")
print(f"Function: 4*{_2result_2_2}")

r1 = _2result_1_1 - _2result_2_1
r2 = _2result_1_2 - _2result_2_2
print(f"R: Arctan:   {r1}")
print(f"R. Function: {r2}")