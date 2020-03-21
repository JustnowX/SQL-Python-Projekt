
#kopie von stackoverflow
#with open('100.conf') as f:
#  s = "".join([x.strip() for x in f])
#print(s)

#sl = slice(24, 35)

#print(s[sl])

#----------------------------------------------------

#datei wird im lese modus 'r' geöfnet
file = open('100.conf','r')
#inhalt der datei wird gelesen und in einen string umgewandelt
xx = "".join(file.read())

print (xx)
#definierte stelle des strings wird übergeben
sl = slice(31,35)

print(xx[sl])

#--------------------------------------------
#kurzfasung

#file = "".join(open('100.conf','r').read())
#print(file)

#------------------------------------------
#a = ["a","b"]

#p = "".join(a)

#print(p)
#hammel bla  IP adress: (192.168.1.1) Hostname: (anus.fqdn)
