REM @C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\projekt\pve\sql\create_t.sql

set NULL 'N/A'
set linesize 200
set echo on
cl scr

conn ora1/ora1

DROP TABLE clientSubnet;
DROP TABLE hostsubnet;
DROP TABLE Subnet;
DROP TABLE HDDs;
DROP TABLE t_client;
DROP TABLE t_host;

CREATE TABLE t_host
(
  hIP         VARCHAR2(20),
  Hostname    VARCHAR2(20)    CONSTRAINT PK_hHostname      PRIMARY KEY
);

CREATE TABLE t_client
(
  VMID          VARCHAR2(6)   CONSTRAINT PK_VMID              PRIMARY KEY,
  OS_Type       VARCHAR2(16)  CONSTRAINT OSType_nn_tclient    NOT NULL,
  cIP           VARCHAR2(20)  CONSTRAINT conip_tclient        UNIQUE,
  RAM           VARCHAR2(5)   CONSTRAINT consysart_nn_tclient NOT NULL,
  Hostname      VARCHAR2(20),
  disk_space    VARCHAR2(20)  CONSTRAINT disk_space_nn        NOT NULL,
  Clientname    VARCHAR2(20)  CONSTRAINT Clientname_nn        NOT NULL,
                CONSTRAINT Hostname_FK_tclient FOREIGN KEY (Hostname) REFERENCES t_host (Hostname)
);

CREATE TABLE HDDs
(
  HDD_ID        VARCHAR2(20),
  Hostname      VARCHAR2(20),
                CONSTRAINT   FK_HDDs  FOREIGN KEY (Hostname) REFERENCES t_host (Hostname)
);

CREATE TABLE Subnet
(
  SubnetID      VARCHAR2(20)  CONSTRAINT pk_subnet  PRIMARY KEY
);

CREATE TABLE hostsubnet
(
  SubnetID    VARCHAR2(20),
  Hostname    VARCHAR2(20),
              CONSTRAINT    subnetID_fk   FOREIGN KEY (SubnetID) REFERENCES Subnet (SubnetID),
              CONSTRAINT    VMID_fk       FOREIGN KEY (Hostname) REFERENCES t_host (Hostname),
              CONSTRAINT    PK_hostsubnet PRIMARY KEY (SubnetID, Hostname)
);

CREATE TABLE clientSubnet
(
  SubnetID    VARCHAR2(20),
  VMID        VARCHAR2(6),
              CONSTRAINT    subnetID_fk_client     FOREIGN KEY (SubnetID) REFERENCES Subnet (SubnetID),
              CONSTRAINT    VMID_fk_2              FOREIGN KEY (VMID)     REFERENCES t_client (VMID),
              CONSTRAINT    PK_clientsubnet        PRIMARY KEY (SubnetID, VMID)
);

COMMIT;
