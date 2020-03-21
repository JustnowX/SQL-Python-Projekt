REM @C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\projekt\pve\sql\create_t.sql
C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\projekt\pve\sql

set NULL 'N/A'
set linesize 200
set echo on
cl scr

conn ora1/ora1



CREATE TABLE t_host
(
  hid     VARCHAR2(5)     CONSTRAINT conhostid_thost PRIMARY KEY,
  fqdn    VARCHAR2(30)  CONSTRAINT nn_confqdn NOT NULL
                        CONSTRAINT uni_confqdn UNIQUE
);

CREATE TABLE t_client
(
  cid     VARCHAR2(5)     CONSTRAINT conclientid_tclient PRIMARY KEY,
  fqdn    VARCHAR2(30)  CONSTRAINT confqdn_nn_tclient NOT NULL
                        CONSTRAINT confqdn_uniq_tclient UNIQUE,
  ip      VARCHAR2(30)  CONSTRAINT conip_tclient UNIQUE,
  sysart  VARCHAR2(30)  CONSTRAINT consysart_nn_tclient NOT NULL,
  hid     VARCHAR2(5),
  CONSTRAINT hostid_thost_tclient FOREIGN KEY (hid) REFERENCES t_host (hid)
);

/* Test insert -----------------------------------
INSERT
  INTO t_host
  VALUES (111, 'test.host.xxx');

INSERT
  INTO t_client (cid, fqdn,            ip,               sysart,  hid)
  VALUES        (101, 'testclient.xxx', '192.168.1.101', 'debian', 111);
*/
  COMMIT;
