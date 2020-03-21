# C:\Users\Surface\Python\projekt\pve\python\insertfrom.py
import cx_Oracle
db_connection_string = 'ora1/ora1'
con = cx_Oracle.connect(db_connection_string)

#zeiger auf db_connection_string
cursor = con.cursor()

print("To add a Host press 'C'To add a Client press 'C'")

choice = input('?')

#open config file
file =  open('100.conf','r')
#in halt von file in einen string umwandeln
filestr = "".join(file.read())

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
    # passenden ausszug [slice(x,x)] übergeben
    cid = filestr[slice(194,197)]
    cfqdn = f"{filestr[slice(31,35)]}.xxx"
    cip = filestr[slice(131,144)]
    sysart = filestr[slice(166,172)]
    chid = input('Enter HostID:')

    # Insert in die tabelle
    cursor.execute(f"""
            INSERT
                INTO t_client (cid,     fqdn,      ip,      sysart,    hid)
                VALUES        ({cid}, '{cfqdn}', '{cip}', '{sysart}', {chid})
        """)
else :
    print('error error error layer 8 problem erkannt')

con.commit()

#test insert --------------------------------------------------
#INSERT
#  INTO t_host
#  VALUES (111, 'test.host.xxx');

#INSERT
#  INTO t_client (cid, fqdn,            ip,               sysart,  hid)
#  VALUES        (101, 'testclient.xxx', '192.168.1.101', 'debian', 111);
