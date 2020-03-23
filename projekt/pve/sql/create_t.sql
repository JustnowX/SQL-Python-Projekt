REM @C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\projekt\pve\sql\create_t.sql

set NULL 'N/A'
set linesize 200
set echo on
cl scr

conn ora1/ora1

DROP TABLE t_client;
DROP TABLE t_host;


CREATE TABLE t_host
(
  hid          VARCHAR2(5)     CONSTRAINT conhostid_thost   PRIMARY KEY,
  hHostname    VARCHAR2(30)    CONSTRAINT nn_hHostname      NOT NULL
                               CONSTRAINT uni_confqdn       UNIQUE
);

CREATE TABLE t_client
(
  cid           VARCHAR2(5)   CONSTRAINT conclientid_tclient  PRIMARY KEY,
  cHostname     VARCHAR2(30)  CONSTRAINT confqdn_nn_tclient   NOT NULL
                              CONSTRAINT confqdn_uniq_tclient UNIQUE,
  ip            VARCHAR2(30)  CONSTRAINT conip_tclient        UNIQUE,
  sysart        VARCHAR2(30)  CONSTRAINT consysart_nn_tclient NOT NULL,
  hid           VARCHAR2(5),
                CONSTRAINT hostid_thost_tclient FOREIGN KEY (hid) REFERENCES t_host (hid)
);

COMMIT;
