REM @C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\projekt\pve\sql\insert_test.sql

set NULL 'N/A'
set linesize 200
set echo on
cl scr

conn ora1/ora1

REM Test insert -----------------------------------

INSERT
  INTO t_host
  VALUES (111, 'test.xxx');

INSERT
  INTO t_host
  VALUES (222, 'anushost.xxx');

INSERT
  INTO t_client (cid, cfqdn,            ip,               sysart,  hid)
  VALUES        (101, 'testclient.xxx', '192.168.1.101', 'debian', 111);

INSERT
  INTO t_client (cid, cfqdn,            ip,               sysart,  hid)
  VALUES        (102, 'hammel.xxx', '192.168.1.102', 'debian', 111);

INSERT
  INTO t_client (cid, cfqdn,            ip,               sysart,  hid)
  VALUES        (103, 'windows10.xxx', '192.168.1.103', 'Win10', 111);

INSERT
  INTO t_client (cid, cfqdn,            ip,               sysart,  hid)
  VALUES        (104, 'ubuntu1.xxx', '192.168.1.104', 'ubuntu', 222);

  INSERT
    INTO t_client (cid, cfqdn,            ip,               sysart,  hid)
    VALUES        (105, 'ubuntu2.xxx', '192.168.1.105', 'ubuntu', 222);
