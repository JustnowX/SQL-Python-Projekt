from sys import argv

script, username = argv
promt = '>>> '

print(f"hi {username}, i'm the {script} script.")
print("i'd like to ask you a few qestions.")

print(f"Do you like me {username}?")
likes = input(promt)

print(f"where are you {username}?")
lives = input(promt)

if likes == "yes":
    print("You say you like me :D!")
elif likes == "no":
    print("Why do you dont like me?")
else:
    print(f"You said {likes} to liking me.")

print(f"You said you live in {lives}")
