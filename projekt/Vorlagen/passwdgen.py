from random import *
array = []
for i in range(int(input("wie viele zeichen?"))):
    ascii = (str(chr(randint(32,126))))
    array.append(ascii)
print("".join(array))
