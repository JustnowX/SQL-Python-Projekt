# C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\projekt\pve\python\configs\inserfromconf_V1_0.py
import cx_Oracle
import os

db_connection_string = 'ora1/ora1'
con = cx_Oracle.connect(db_connection_string)

#zeiger auf db_connection_string
cursor = con.cursor()

# Gets List of VMs
vm_list = os.listdir(r"C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\projekt\pve\python\configs")
vm_list.remove("inserfromconf_V1_0.py")
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
    clientname  = line3[slice(10, 40)]
    ram  = line4[slice(8, 20)]
    ip = line5[slice(83, 96)]
    ostype  = line6[slice(8, 40)]
    vmid = line7[slice(21, 24)]
    disk_space = line7[slice(37, 45)]
    SubnetID  = '192.168.1.1/24'
    Hostname = 'hostxxx'


    cursor.execute(f"""
        INSERT
            INTO t_client (VMID,     OS_Type,    cIP,     RAM,   Hostname,    disk_space, Clientname)
            VALUES        ('{vmid}', '{ostype}', '{ip}','{ram}', '{Hostname}','{disk_space}',   '{clientname}'  )
        """)
    print('hallo')
    cursor.execute(f"""
        INSERT
            INTO clientSubnet
            VALUES      ('{SubnetID}','{vmid}' )
    """)

con.commit()
config.close()
#test insert --------------------------------------------------


#INSERT
#  INTO t_client (cid, fqdn,            ip,               sysart,  hid)
#  VALUES        (101, 'testclient.xxx', '192.168.1.101', 'debian', 111);
