# C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\projekt\pve\python\getconf.py
import pysftp
import cx_Oracle


# Gets directory and files from host
with pysftp.Connection('192.168.1.107', username='root', password='Hanns-G') as sftp:
    sftp.get_d('/etc/pve/lxc', r'C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\projekt\pve\python\configs')
    sftp.get('/etc/hostname', r'C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\projekt\pve\python\configs\hostconf')

db_connection_string = 'ora1/ora1'
con = cx_Oracle.connect(db_connection_string)

#zeiger auf db_connection_string
cursor = con.cursor()
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
