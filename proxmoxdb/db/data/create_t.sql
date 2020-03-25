<<<<<<< HEAD
REM @C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\proxmoxdb\db\data\create_t.sql

set NULL 'N/A'
set linesize 200
set echo on
cl scr

conn ora1/ora1

DROP TABLE t_clientSubnet;
DROP TABLE t_hostsubnet;
DROP TABLE t_Subnet;
DROP TABLE t_HDDs;
DROP TABLE t_client;
DROP TABLE t_host;

CREATE TABLE t_host
(
  hIP         VARCHAR2(20)    CONSTRAINT hostip_thost      UNIQUE,
  Hostname    VARCHAR2(20)    CONSTRAINT PK_hHostname      PRIMARY KEY
);

CREATE TABLE t_client
(
  VMID          NUMBER        CONSTRAINT PK_VMID              PRIMARY KEY,
  OS_Type       VARCHAR2(16)  CONSTRAINT OSType_nn_tclient    NOT NULL,
  cIP           VARCHAR2(20)  CONSTRAINT conip_tclient        UNIQUE,
  RAM           NUMBER        CONSTRAINT consysart_nn_tclient NOT NULL,
  cores         NUMBER        CONSTRAINT cores_t_client       NOT NULL,
  Hostname      VARCHAR2(20),
  disk_space    VARCHAR2(20)  CONSTRAINT disk_space_nn        NOT NULL,
  Clientname    VARCHAR2(20)  CONSTRAINT Clientname_nn        NOT NULL,
                CONSTRAINT Hostname_FK_tclient FOREIGN KEY (Hostname) REFERENCES t_host (Hostname)
);

CREATE TABLE t_HDDs
(
  HDD_ID        VARCHAR2(20),
  Hostname      VARCHAR2(20),
                CONSTRAINT   FK_HDDs  FOREIGN KEY (Hostname) REFERENCES t_host (Hostname),
                CONSTRAINT   PK_Hdds  PRIMARY KEY (HDD_ID, Hostname)
);

CREATE TABLE t_Subnet
(
  SubnetID      VARCHAR2(20)  CONSTRAINT pk_subnet  PRIMARY KEY
);

CREATE TABLE t_hostsubnet
(
  SubnetID    VARCHAR2(20),
  Hostname    VARCHAR2(20),
              CONSTRAINT    subnetID_fk   FOREIGN KEY (SubnetID) REFERENCES t_Subnet (SubnetID),
              CONSTRAINT    VMID_fk       FOREIGN KEY (Hostname) REFERENCES t_host (Hostname),
              CONSTRAINT    PK_hostsubnet PRIMARY KEY (SubnetID, Hostname)
);

CREATE TABLE t_clientSubnet
(
  SubnetID    VARCHAR2(20),
  VMID        NUMBER,
              CONSTRAINT    subnetID_fk_client     FOREIGN KEY (SubnetID) REFERENCES t_Subnet (SubnetID),
              CONSTRAINT    VMID_fk_2              FOREIGN KEY (VMID)     REFERENCES t_client (VMID),
              CONSTRAINT    PK_clientsubnet        PRIMARY KEY (SubnetID, VMID)
);

COMMIT;
REM exit


CL SCR

@&pfad.\db\data\0.sql
=======
REM @C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\projekt\pve\sql\create_t.sql
cl scr
set NULL 'N/A'

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
  hIP         VARCHAR2(20)    CONSTRAINT hostip_thost      UNIQUE,
  Hostname    VARCHAR2(20)    CONSTRAINT PK_hHostname      PRIMARY KEY
);

CREATE TABLE t_client
(
  VMID          NUMBER        CONSTRAINT PK_VMID              PRIMARY KEY,
  OS_Type       VARCHAR2(16)  CONSTRAINT OSType_nn_tclient    NOT NULL,
  cIP           VARCHAR2(20)  CONSTRAINT conip_tclient        UNIQUE,
  RAM           VARCHAR2(5)   CONSTRAINT consysart_nn_tclient NOT NULL,
  cores         VARCHAR2(3)   CONSTRAINT cores_t_client       NOT NULL,
  Hostname      VARCHAR2(20),
  disk_space    VARCHAR2(20)  CONSTRAINT disk_space_nn        NOT NULL,
  Clientname    VARCHAR2(20)  CONSTRAINT Clientname_nn        NOT NULL,
                CONSTRAINT Hostname_FK_tclient FOREIGN KEY (Hostname) REFERENCES t_host (Hostname)
);

CREATE TABLE t_HDDs
(
  HDD_ID        VARCHAR2(20),
  Hostname      VARCHAR2(20),
                CONSTRAINT   FK_HDDs  FOREIGN KEY (Hostname) REFERENCES t_host (Hostname),
                CONSTRAINT   PK_Hdds  PRIMARY KEY (HDD_ID, Hostname)
);

CREATE TABLE t_Subnet
(
  SubnetID      VARCHAR2(20)  CONSTRAINT pk_subnet  PRIMARY KEY
);

CREATE TABLE t_hostsubnet
(
  SubnetID    VARCHAR2(20),
  Hostname    VARCHAR2(20),
              CONSTRAINT    subnetID_fk   FOREIGN KEY (SubnetID) REFERENCES Subnet (SubnetID),
              CONSTRAINT    VMID_fk       FOREIGN KEY (Hostname) REFERENCES t_host (Hostname),
              CONSTRAINT    PK_hostsubnet PRIMARY KEY (SubnetID, Hostname)
);

CREATE TABLE t_clientSubnet
(
  SubnetID    VARCHAR2(20),
  VMID        NUMBER,
              CONSTRAINT    subnetID_fk_client     FOREIGN KEY (SubnetID) REFERENCES Subnet (SubnetID),
              CONSTRAINT    VMID_fk_2              FOREIGN KEY (VMID)     REFERENCES t_client (VMID),
              CONSTRAINT    PK_clientsubnet        PRIMARY KEY (SubnetID, VMID)
);

CL SCR

COMMIT;

CL SCR

@&pfad.\db\data\0.sql
>>>>>>> 5f6d60341d613f47c695bbc058c671e76bd7e95e
