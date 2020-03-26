from sys import argv
script, filename = argv

txt = open(filename)

print(f"hier die ausgabe deiner text datei:\n\n{txt.read()}")
