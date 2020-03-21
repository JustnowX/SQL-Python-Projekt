a = ["Karl","Simone","jan"]
print(len(a))
a.append("jan")
b = "jan"
print (b)
a.insert(1,"jan")
print(a.count("jan"))
print(len(a))
s=",".join(a)
print(s)
for i in range(2,19):
    print("hello",i)
for i in range(len(a)):
    print("hello",i)
for i in [0,1,2]:
    print("hello",i)
for freund in a:
    print(freund)
