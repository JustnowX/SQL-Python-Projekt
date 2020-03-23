import pysftp

# Gets directory and files from host
with pysftp.Connection('192.168.1.107', username='root', password='Hanns-G') as sftp:
    sftp.get_d('/etc/pve/lxc', r'C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\projekt\pve\python\configs\confpull')
    sftp.get('/etc/hostname', r'C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\projekt\pve\python\configs\confpull')
