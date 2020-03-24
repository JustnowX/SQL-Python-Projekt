config = open("100.conf", "r")

# s = "".join(config.read())


x = slice(6, 20)




line1 = config.readline()
line2 = config.readline()
line3 = config.readline()
line4 = config.readline()
line5 = config.readline()
line6 = config.readline()
line7 = config.readline()
line8 = config.readline()
line9 = config.readline()

arch = line1[slice(6, 20)]
cores = line2[slice(7, 20)]
hostname  = line3[slice(10, 40)]
memory  = line4[slice(8, 20)]
net = line5[slice(43, 53)]
ip = line5[slice(43, 56)]
ostype  = line6[slice(8, 40)]
vmid = line7[slice(18, 24)]
hdd = line7[slice(37, 45)]
swap  = line8[slice(6, 20)]
unprivileged  = line9[slice(14, 20)]

print(line5)
print('##############')
print(net)

config.close()
