# C:\Users\Surface\Python\projekt\pve\python\insert.py
import cx_Oracle
db_connection_string = 'ora1/ora1'
con = cx_Oracle.connect(db_connection_string)

cursor = con.cursor()

print("To add a Host press 'C'To add a Client press 'C'")
choice = input('?')


if choice == 'H' :
    print('Enter HostID:')
    hid = input()
    print("Enter FQDN:")
    hfqdn = input()

    cursor.execute(f"""
        INSERT
          INTO t_host
          VALUES ({hid}, '{hfqdn}')
    """)

elif choice == 'C' :
    cid = input('Enter ClientID:')
    cfqdn = input('Enter Client FQDN:')
    cip = input('Enter IP-adress:')
    sysart = input('Enter Operating System name:')
    chid = input('Enter HostID:')

    cursor.execute(f"""
            INSERT
                INTO t_client (cid,     fqdn,      ip,      sysart,    hid)
                VALUES        ({cid}, '{cfqdn}', '{cip}', '{sysart}', {chid})
        """)
else :
    print('error error error layer 8 problem erkannt')
con.commit()
#INSERT
#  INTO t_host
#  VALUES (111, 'test.host.xxx');

#INSERT
#  INTO t_client (cid, fqdn,            ip,               sysart,  hid)
#  VALUES        (101, 'testclient.xxx', '192.168.1.101', 'debian', 111);
