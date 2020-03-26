from sys import argv
script, filename = argv

print(f"We're going to erase {filename}.")
print("if you don't want that hit CTRL-C (^C).")
print("if you do want that, hit RETUIRN.")

input("?")

print("opening the file..")
target = open(filename, 'w')

print("Truncating the file.goodbye!")
target.truncate()

print("now I'm going to ask you for three lines.")

line1 = input("line 1: ")
line2 = input("line 2: ")
line3 = input("line 3: ")

print("I'm ggoing to write these to the file. du opfer")

target.write(f"{line1}\n{line2}\n{line3}\n")
#target.write("\n")
#target.write(line2)
#target.write("\n")
#target.write(line3)
#target.write("\n")

print("And finally, we close the file.")
target.close()
