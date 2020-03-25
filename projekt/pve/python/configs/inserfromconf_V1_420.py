# C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\projekt\pve\python\configs\inserfromconf_V1_420.py
#import libaries
import cx_Oracle
import os
import pysftp
# Gets directory and conf files from host via sftp-----------------------------------
with pysftp.Connection('192.168.1.107', username='root', password='Hanns-G') as sftp:
    sftp.get_d('/etc/pve/lxc',  r'C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\projekt\pve\python\bin')
    sftp.get  ('/etc/hostname', r'C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\projekt\pve\python\bin\hostconf')

#cx_Oracle Connect funktion----------------------------------------------------------
db_connection_string = 'ora1/ora1'
con = cx_Oracle.connect(db_connection_string)
#zeiger auf db_connection_string
cursor = con.cursor()
#Grunddaten in datenbank einpflegen (INSERT)-----------------------------------------
cursor.execute(f"""
    INSERT
      INTO t_host
      VALUES ('192.168.1.10', 'pve')
""")

cursor.execute(f"""
    INSERT
      INTO HDDs
      VALUES        ('local-lvm','pve')
""")
cursor.execute(f"""
    INSERT
      INTO HDDs
      VALUES        ('local','pve')
""")

cursor.execute(f"""
    INSERT
      INTO Subnet
      VALUES        ('192.168.1.0/24')
""")
cursor.execute(f"""
    INSERT
      INTO Subnet
      VALUES        ('192.168.2.0/24')
""")
cursor.execute(f"""
    INSERT
      INTO Subnet
      VALUES        ('192.168.3.0/24')
""")
cursor.execute(f"""
    INSERT
      INTO hostSubnet
      VALUES        ('192.168.1.0/24', 'pve')
""")
con.commit()
#------------------------------------------------------------------------------------

# Gets List of VMs-------------------------------------------------------------------
vm_list = os.listdir(r"C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\projekt\pve\python\configs")
vm_list.remove("inserfromconf_V1_420.py")
vm_list.remove("hostconf")
vm_list.remove(".100.conf.swp")
#------------------------------------------------------------------------------------
#readline, slice und INSERT für jede config datei------------------------------------
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
    cores = line2[slice(7, 20)]
    clientname  = line3[slice(10, 40)]
    ram  = line4[slice(8, 20)]
    ip = line5[slice(83, 96)]
    ostype  = line6[slice(8, 40)]
    vmid = line7[slice(21, 24)]
    disk_space = line7[slice(37, 45)]
    SubnetID  = f"{line5[slice(43, 53)]}0/24"
    #testprint--------------------------------------------
    print(vmid)
    print(SubnetID)
    #übergeben der sauberen daten in die datenbank--------
    cursor.execute(f"""
        INSERT
            INTO t_client (VMID,     OS_Type,     cIP,    RAM,    cores,   Hostname, disk_space,   Clientname)
            VALUES        ('{vmid}', '{ostype}', '{ip}','{ram}','{cores}', 'pve',    '{disk_space}','{clientname}')
        """)
    cursor.execute(f"""
        INSERT
            INTO clientSubnet
            VALUES       ('{SubnetID}','{vmid}' )
    """)
    con.commit()
