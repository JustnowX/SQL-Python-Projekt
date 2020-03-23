import pysftp
import shutil

userdir = r"C:\Users\client\proxmox"

# Deletes and recreates proxmox directory

print("Attention! {userdir} will be deleted!")
input("?")
shutil.rmtree(userdir)

# Gets directory and files from host
with pysftp.Connection('hostname', username='root', password='Hanns-G') as sftp:
    sftp.get_d('/etc/pve/lxc', userdir)
    sftp.get('/etc/hostname', userdir.hostname)
