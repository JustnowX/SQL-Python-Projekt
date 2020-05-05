# C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\projekt\pve\python\configs\inserfromconf_V1_420.py
#import libaries
import curses
import cx_Oracle
import os
import pysftp

#avg = []


#cx_Oracle Connect funktion----------------------------------------------------------
db_connection_string = 'ora1/ora1'
con = cx_Oracle.connect(db_connection_string)
#zeiger auf db_connection_string
cursor = con.cursor()
#------------------------------------------------------------------------------------
#Grunddaten in datenbank einpflegen (INSERT)-----------------------------------------
def ini_insert():
    cursor.execute(f"""
        INSERT
        INTO t_host
        VALUES ('192.168.1.10', 'pve')
        """)

    cursor.execute(f"""
        INSERT
        INTO t_HDDs
        VALUES        ('local-lvm','pve')
        """)
    cursor.execute(f"""
        INSERT
        INTO t_HDDs
        VALUES        ('local','pve')
        """)

    cursor.execute(f"""
        INSERT
        INTO t_Subnet
        VALUES        ('192.168.1.0/24')
        """)
    cursor.execute(f"""
        INSERT
        INTO t_Subnet
        VALUES        ('192.168.2.0/24')
        """)
    cursor.execute(f"""
        INSERT
        INTO t_Subnet
        VALUES        ('192.168.3.0/24')
        """)
    cursor.execute(f"""
        INSERT
        INTO t_hostSubnet
        VALUES        ('192.168.1.0/24', 'pve')
        """)
    con.commit()
# Gets directory and conf files from host via sftp-----------------------------------
def get_conf():
    with pysftp.Connection('192.168.1.107', username='root', password='Hanns-G') as sftp:
        sftp.get_d('/etc/pve/lxc',  r'C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\Projekt_Final\Beta')
        sftp.get  ('/etc/hostname', r'C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\Projekt_Final\Beta\hostconf')
#------------------------------------------------------------------------------------
# Gets List of VMs-------------------------------------------------------------------
def sliceandinsert():
    vm_list = os.listdir(r"C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\Projekt_Final\Beta")
    vm_list.remove("inserfromconf_V1_840.py")
    vm_list.remove("hostconf")
    vm_list.remove(".100.conf.swp")
    #----------------------------------------------------------------------------
    #readline, slice und INSERT für jede config datei----------------------------
    for i in vm_list:
        config = open(i)

        #Zeilen in variable speichern-------------------------
        line1 = config.readline()
        line2 = config.readline()
        line3 = config.readline()
        line4 = config.readline()
        line5 = config.readline()
        line6 = config.readline()
        line7 = config.readline()
        line8 = config.readline()
        line9 = config.readline()

        config.close()
        # passenden ausszug [slice(x,x)] übergeben-----------
        cores =         line2[slice(7, 20)]
        clientname  =   (line3[slice(10, 40)])[slice(-1)]
        ram  =          line4[slice(8, 20)]
        ip =            line5[slice(83, 96)]
        ostype  =       (line6[slice(8, 40)])[slice(-1)]
        vmid =          line7[slice(21, 24)]
        disk_space =    line7[slice(37, 45)]
        SubnetID  =     f"{line5[slice(43, 53)]}0/24"
        #testprint--------------------------------------------
        #print(f"##{vmid}##")
        #print(f"##{clientname}##")
        # print(SubnetID)
        # print(f"##{ostype}##")
        #übergeben der sauberen daten in die datenbank--------
        cursor.execute(f"""
            INSERT
                INTO t_client (VMID,     OS_Type,     cIP,    RAM,    cores,   Hostname, disk_space,   Clientname)
                VALUES        ({vmid}, '{ostype}', '{ip}',{ram},{cores}, 'pve',    '{disk_space}','{clientname}')
                """)
        cursor.execute(f"""
            INSERT
                INTO t_clientSubnet
                VALUES       ('{SubnetID}','{vmid}' )
                """)
        con.commit()
# Drop Table und Create-----------------------------------------------------------------------
def database_reset():
    os.system(r"sqlplus /nolog @C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\Projekt_Final\SQL_Ordnerstuktur\create.sql")

#----------------------------------------------------------------------------------------------
def database_add_client():
    print("Geforderte Reihenfolge:")
    print("VMID, OS Typ, IP, RAM, Cores, Hostname, Disk Space, Clientname")
    input_string = input("Gib alle Werte getrennt von leerzeichen ein! :> ")
    insert_list = input_string.split()


    print("Sollen folgende Eingaben gespeichert werden?")
    print(f"VMID: {insert_list[0]}, OS Typ: {insert_list[1]}, IP: {insert_list[2]}, RAM: {insert_list[3]}, Cores: {insert_list[4]}, Hostname: {insert_list[5]}, Disk Space: {insert_list[6]}, CLientname: {insert_list[7]}")
    choice = input("Sollen die Daten geschrieben werden (y/n)")
    if choice == 'y':
        cursor.execute(f"""
            INSERT
                INTO t_client (VMID,     OS_Type,    cIP,     RAM, cores,  Hostname,    disk_space, Clientname)
                VALUES        ({insert_list[0]}, '{insert_list[1]}', '{insert_list[2]}',{insert_list[3]},{insert_list[4]}, '{insert_list[5]}','{insert_list[6]}',   '{insert_list[7]}')
            """)
        con.commit()
        print('Daten wurden erfolgreich geschpeichert')
    else:
        break
#----------------------------------------------------------------------------------------------
def database_add_host():
    print("Geforderte Reihenfolge:")
    print("Host ID, Host IP")
    input_string = input("Gib alle Werte getrennt von leerzeichen ein! :> ")
    insert_list = input_string.split()


    print("Sollen folgende Eingaben gespeichert werden?")
    print(f"Host ID: {insert_list[0]}, IP: {insert_list[1]}")
    choice = input("Sollen die Daten geschrieben werden (y/n)")
    if choice == 'y':
        cursor.execute(f"""
            INSERT
            INTO t_host (hIP,  Hostname)
            VALUES       ('{insert_list[1]}','{insert_list[0]}' )
            """)
        con.commit()
    else:
        break
#---------------------


while 1:
    while 1:
        os.system("cls")
        print("Willkommen im SuperDopeTool, sie haben folgende Auswahlmöglichkeiten")
        print("""
################################################################
##  1. SQL*Plus Menue                                         ##
##  2. Datenbank aktualisieren (Configs auslesen und Insert)  ##
##  3. Datenbank zurücksetzen  (Drop Table & Create new)      ##
##  4. Client Manuel Hinzufügen                               ##
##  5. Host Manuel Hinzufügen                                 ##
##  6. Daten ausgeben                                         ##
##  7. SQL*Plus starten                                       ##
################################################################
             Gebe [1]  ,  [2]  ...  [7] ein!
             """)

        userinput = input(":> ")

        if userinput == "1":
            os.system(r"sqlplus /nolog @C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\Projekt_Final\SQL_Ordnerstuktur\mainmenu.sql")

        elif userinput == "2":
            print("Config-Dateien auslesen und in Datenbank übertagen? (y/n)")
            choice = input(":> ")
            if choice == "y":
                get_conf()
                sliceandinsert()
                print("Datenbank aktualisiert")
                print("Zurueck zum Hauptmenue? (y/n)")
                choice = input(":> ")
                if choice == "y":
                    break
                else:
                    exit()
            else:
                exit()

        elif userinput == "3":
            print("Datenbank zuruecksetzen? (y/n)")
            choice = input(":> ")
            if choice == "y":
                database_reset()
                ini_insert()
                print("Datenbank zurueckgesetzt.")
                print("Zurueck zum Hauptmenue? (y/n)")
                choice = input(":> ")
                if choice == "y":
                    break
                else:
                        exit()
            else:
                    break
        elif userinput == '4':
            database_add_client()

        elif userinput == '5':
            database_add_host()

        elif userinput == '6':
            os.system("cls")
            print("Willkommen im SuperDopeTool, sie haben folgende Auswahlmöglichkeiten")
            print("""
################################################################
##  1. Alle Clients                                           ##
##  2. Alle Hosts                                             ##
################################################################
                Gebe [1] oder [2]  ein!
                                """)
            choice = input(":> ")
            if choice == '1':
                os.system(r"sqlplus /nolog @C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\Projekt_Final\SQL_Ordnerstuktur\db\sqlselect\select_clients.sql")

            elif choice == '4':
                cursor.execute("SELECT AVG(cores) FROM t_client")
                avg.append(cursor.fetchall())
                cursor.execute("SELECT AVG(RAM) FROM t_client")
                avg.append(cursor.fetchall())
                print("AVG Cores: {avg[0]} \n AVG RAM: {avg[1]}")

            elif choice == '3':
                cursor.execute("SELECT COUNT(VMID) FROM t_client")
                cockx = cursor.fetchall()
                print(cockx)
                f"".join(cockx)

            elif choice == '2':
                os.system(r"sqlplus /nolog @C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\Projekt_Final\SQL_Ordnerstuktur\db\sqlselect\select_hosts.sql")

            elif choice == '5':
                print("Function not implemented yet.")


            else:
                print("Falsche Eingabe, versuchen sie es erneut")

        elif userinput == '7':
            os.system("sqlplus ora1/ora1")


        else:
            print("Falsche Eingabe, versuchen sie es erneut")
