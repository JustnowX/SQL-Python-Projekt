from random import *
from sys import argv
script, pwdlengh = argv
array = []
for i in range(int(pwdlengh)):
    array.append((str(chr(randint(32,126)))))
print("".join(array))
