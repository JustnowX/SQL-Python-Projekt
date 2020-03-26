import cx_Oracle
db_connection_string = 'oral/oral@192.168.1.107'
con = cx_Oracle.connect(db_connection_string)

cursor = con.cursor()

print("Willkommen in der Berliner Weedbank")
print("Möchten sie eine Sorten(A\)bfrage starten oder einen neuen (E\)intrag erstellen?")
choice = input("?")

cursor.execute(f"""
    DROP TABLE sorten
""")

cursor.execute(f"""
CREATE TABLE sorten
(
familie varchar2(20),
name varchar2(20) PRIMARY KEY,
thc number(10),
cbd number(10)
)
""")

if choice == 'E' :
    print("Indica, Sativa oder Ruderalis")
    familie = input()
    print("Name?")
    name = input()
    print("THC")
    thc = input()
    print("CBD")
    cbd = input()

    print(f"{name}, {familie}, THC {thc}%, CBD {cbd}%")
    print("Datensatz in die Datenbank eintrage? ^C zum Canceln")
    input("?")
    print("Screibe Datensatz...")

    cursor.execute(f"""
    INSERT
    INTO sorten (familie, name, thc, cbd)
    VALUES      ('{familie}', '{name}', {thc}, {cbd})
    """)


elif choice == "A" :
    print("ficker")

else:
    print("Falsche Eingabe du Hurensohn")
# ausgabe = cursor.execute(f"""
#         SELECT * FROM sorten
#     """)



con.commit()
con.close()
