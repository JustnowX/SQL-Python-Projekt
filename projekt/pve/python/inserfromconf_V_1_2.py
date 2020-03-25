import pysftp
import os
import pysftp
import cx_Oracle

db_connection_string = 'ora1/ora1'
con = cx_Oracle.connect(db_connection_string)

run = 1
stop = 0



def get_configs():
        ##
        with pysftp.Connection('$', username='root', password='Hanns-G') as sftp:
            sftp.get_d('/etc/pve/lxc', r'C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\projekt\pve\python\configs\confpull')
            sftp.get('/etc/hostname', r'C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\projekt\pve\python\configs\confpull')


def database_update():
    # Gets List of VMs
    ##
    vm_list = os.listdir(r"/etc/pve/lxc/")
    vm_list.remove("inserfromconf_V0_3.py")
    for i in vm_list:
        config = open(i)

        #Zeilen in variable speichern
        line1 = config.readline()
        line2 = config.readline()
        line3 = config.readline()
        line4 = config.readline()
        line5 = config.readline()
        line6 = config.readline()
        line7 = config.readline()
        line8 = config.readline()
        line9 = config.readline()

        # passenden ausszug [slice(x,x)] übergeben
        arch = line1[slice(6, 20)]
        cores = line2[slice(7, 20)]
        hostname  = line3[slice(10, 40)]
        memory  = line4[slice(8, 20)]
        net = line5[slice(23, 28)]
        ip = line5[slice(83, 96)]
        ostype  = line6[slice(8, 40)]
        vmid = line7[slice(18, 24)]
        hdd = line7[slice(37, 45)]
        swap  = line8[slice(6, 20)]
        unprivileged  = line9[slice(14, 20)]

    config.close()
    # Gets Hostname
    ##
    f = open("/etc/hostname", "r")
    hostname = f.readline()
    f.close

    # Writes data in DB
    cursor.execute(f"""
        INSERT
            INTO t_client (VMID,     OS_Type,    cIP,     RAM, cores,  Hostname,    disk_space, Clientname)
            VALUES        ('{vmid}', '{ostype}', '{ip}','{ram}','{cores}', '{Hostname}','{disk_space}',   '{clientname}')
        """)

    cursor.execute(f"""
        INSERT
            INTO clientSubnet
            VALUES      ('{SubnetID}','{vmid}' )
    """)
    con.commit()

## Resets databases
def database_reset():
    cursor.execute(f"""
        DROP TABLE t_client
        """)

    cursor.execute(f"""
        DROP TABLE t_host
        """)

    cursor.execute(f"""
        CREATE TABLE t_host
            (
                hid     VARCHAR2(30)     CONSTRAINT conhostid_thost PRIMARY KEY,
                fqdn    VARCHAR2(30)  CONSTRAINT nn_confqdn NOT NULL
                                        CONSTRAINT uni_confqdn UNIQUE
            )
    """)

    cursor.execute(f"""
        CREATE TABLE t_client
            (
                cid          VARCHAR2(30)        CONSTRAINT conclientid_tclient PRIMARY KEY,
                cHostname    VARCHAR2(30)        CONSTRAINT confqdn_nn_tclient NOT NULL
                                                 CONSTRAINT confqdn_uniq_tclient UNIQUE,
                ip           VARCHAR2(30)        CONSTRAINT conip_tclient UNIQUE,
                sysart       VARCHAR2(30)        CONSTRAINT consysart_nn_tclient NOT NULL,
                hid          VARCHAR2(30),
                CONSTRAINT hostid_thost_tclient FOREIGN KEY (hid) REFERENCES t_host (hid)
            )
    """)
    cursor.execute(f"""
        INSERT
            INTO t_host
            VALUES (111, 'test.host.xxx')
    """)
#######################################################################################
#######################################################################################


while run == 1:
    while stop == 0:
        print("Willkommen im Hauptmenue, sie haben folgende Auswahlmöglichkeiten")
        print(
                """
                    1. Eintrag aendern
                    2. Datenbank aktualisieren
                    3. Datenbank zurücksetzen

                    """)

        userinput = input(":> ")
    ##
        if userinput == 1:
            os.system("sqlplus")

        elif userinput == 2:
            print("Datenbank aktualisieren? (y/n)")
            choice = input(":> ")
            if choice == y:
                database_update()
                print("Datenbank aktualisiert")
                print("Zurueck zum Hauptmenue? (y/n)")
                choice = input(":> ")
                if choice == y:
                    break
                else:
                    exit()

            else:
                exit()

        elif userinput == 3:
            print("Datenbank zuruecksetzen? (y/n)")
            choice = input(":> ")
            if choice == y:
                database_reset()
                print("Datenbank zurueckgesetzt.")
                print("Zurueck zum Hauptmenue? (y/n)")
                choice = input(":> ")
                if choice == y:
                    database()
                    print("Datenbank zurueckgesetzt.")
                    print("Zurueck zum Hauptmenue? (y/n)")
                    choice = input(":> ")
                    if choice == y:
                        break
                    else:
                        exit()

                else:
                    break

        else:
            print("Falsche Eingabe, versuchen sie es erneut")
