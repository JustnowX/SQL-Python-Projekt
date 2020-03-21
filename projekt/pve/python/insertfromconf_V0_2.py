# C:\Users\Surface\Python\projekt\pve\python\insertfrom.py
import cx_Oracle

config = open("lxc.conf", "r")
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

db_connection_string = 'ora1/ora1'
con = cx_Oracle.connect(db_connection_string)

#zeiger auf db_connection_string
cursor = con.cursor()


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
            cid     VARCHAR2(30)         CONSTRAINT conclientid_tclient PRIMARY KEY,
            fqdn    VARCHAR2(30)        CONSTRAINT confqdn_nn_tclient NOT NULL
                                        CONSTRAINT confqdn_uniq_tclient UNIQUE,
            ip      VARCHAR2(30)        CONSTRAINT conip_tclient UNIQUE,
            sysart  VARCHAR2(30)        CONSTRAINT consysart_nn_tclient NOT NULL,
            hid     VARCHAR2(30),
            CONSTRAINT hostid_thost_tclient FOREIGN KEY (hid) REFERENCES t_host (hid)
        )
""")
cursor.execute(f"""
    INSERT
        INTO t_host
        VALUES (111, 'test.host.xxx')
""")


# s = "".join(config.read())

print(arch)
print(cores)
print(hostname)
print(memory)
print(ostype)
print(vmid)
print(swap)
print(unprivileged)


print(arch)



print("To add a Host press 'H'To add a Client press 'C'")

choice = input('?')

# #open config file
# file =  open('100.conf','r')
# #in halt von file in einen string umwandeln
# filestr = "".join(file.read())

if choice == 'H' :
    print('Enter HostID:')
    hid = input()
    print("Enter FQDN:")
    hfqdn = input()

    # Insert in die tabelle
    cursor.execute(f"""
        INSERT
          INTO t_host
          VALUES ({hid}, '{hfqdn}')
    """)

elif choice == 'C' :
    chid = input('Enter HostID:')
    # Insert in die tabelle
    cursor.execute(f"""
            INSERT
                INTO t_client (cid,     fqdn,      ip,      sysart,    hid)
                VALUES        ('{vmid}', '{hostname}', '{ip}', '{ostype}', {chid})
        """)

else :
    print('error error error layer 8 problem erkannt')

con.commit()
config.close()
#test insert --------------------------------------------------


#INSERT
#  INTO t_client (cid, fqdn,            ip,               sysart,  hid)
#  VALUES        (101, 'testclient.xxx', '192.168.1.101', 'debian', 111);
