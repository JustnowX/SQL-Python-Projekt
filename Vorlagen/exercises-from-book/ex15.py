from sys import argv
script, filename = argv
txt = open(filename)

print(f"here your filename {filename}:")
print(txt.read())

print("type the file name again to open it again:")
file_again = input(">>> ")

txt_again = open(file_again)

print(txt_again.read())
