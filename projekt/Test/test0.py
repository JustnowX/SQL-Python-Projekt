with open('100.conf') as f:
  s = "".join([x.strip() for x in f])

print(s)

sl = slice(24, 35)
print(s[sl])
