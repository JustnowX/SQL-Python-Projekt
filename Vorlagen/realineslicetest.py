config = open("lxc.conf", "r")

# s = "".join(config.read())


x = slice(6, 11)




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

cores = line2[slice(6, 11)]
hostname  = line3[slice(6, 11)]
memory  = line4[slice(6, 11)]
ostype  = line6[slice(6, 11)]
vmid = line7[slice(1, 10)]
swap  = line8[slice(6, 11)]
unprivileged  = line9[slice(6, 11)]

print(arch)
print(cores)
print(hostname)
print(memory)
print(ostype)
print(vmid)
print(swap)
print(unprivileged)



print(arch)
config.close()
