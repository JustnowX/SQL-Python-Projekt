REM @C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\projekt\pve\sql\insert_test.sql

set NULL 'N/A'
set linesize 200
set echo on
cl scr

conn ora1/ora1

REM Test insert -----------------------------------

INSERT
  INTO t_host
  VALUES ('192.168.1.222', 'pve');

INSERT
  INTO t_host
  VALUES ('192.168.1.111', 'hostxxx');

INSERT
  INTO t_client (VMID, OS_Type,         cIP, cores,       RAM,  Hostname, disk_space, Clientname)
  VALUES        ('101', 'debian', '192.168.1.101', '2', '500', 'hostxxx', '500', 'client101');

INSERT
  INTO t_client (VMID, OS_Type,         cIP,  cores,     RAM,  Hostname, disk_space, Clientname)
  VALUES        ('102', 'anusoo', '192.168.1.102','3', '500', 'pve', '500', 'client102');

INSERT
  INTO t_client (VMID, OS_Type,         cIP,   cores,    RAM,  Hostname, disk_space, Clientname)
  VALUES        ('201', 'ubuntu', '192.168.1.201','3', '500', 'pve', '30', 'client201');

INSERT
  INTO t_client (VMID, OS_Type,         cIP,  cores,     RAM,  Hostname, disk_space, Clientname)
  VALUES        ('333', 'ubuntu', '192.168.1.333','2', '500', 'hostxxx', '50', 'client333');

INSERT
  INTO HDDs
  VALUES        ('local-lvm','pve');

INSERT
  INTO HDDs
  VALUES        ('local-lvm','hostxxx');

INSERT
  INTO Subnet
  VALUES        ('192.168.1.0/24');

INSERT
  INTO hostSubnet
  VALUES        ('192.168.1.0/24', 'pve');

INSERT
  INTO hostSubnet
  VALUES        ('192.168.1.0/24', 'hostxxx');

INSERT
  INTO clientSubnet
  VALUES        ('192.168.1.0/24', '101');

INSERT
  INTO clientSubnet
  VALUES        ('192.168.1.0/24', '102');

INSERT
  INTO clientSubnet
  VALUES        ('192.168.1.0/24', '201');

INSERT
  INTO clientSubnet
  VALUES        ('192.168.1.0/24', '333');

COMMIT;
