REM @c:\daten\datenbank\skripte\constraints.sql

set echo on
cl scr

REM Tabellen löschen

DROP TABLE t_adresse;

DROP TABLE t_person;



REM Tabellen erstellen

CREATE TABLE t_person
(
  id       number       CONSTRAINT pk_person_id PRIMARY KEY
                        CONSTRAINT nn_person_id NOT NULL,
  vorname  varchar2(20) CONSTRAINT uni_person_vorname UNIQUE,
  nachname varchar2(20) CONSTRAINT nn_person_nachname NOT NULL
                        CONSTRAINT uni_person_nachname UNIQUE,
  alt      number(3)    CONSTRAINT chk_person_alt CHECK (alt >= 0),
  CONSTRAINT uni_person_name UNIQUE (vorname, nachname)
);

/*
CREATE TABLE t_adresse
(
  aid      number       CONSTRAINT pk_adresse_aid PRIMARY KEY,
  ortsname varchar2(20),
  pid       number,
  CONSTRAINT fk_adresse_id FOREIGN KEY (pid) REFERENCES t_person (id)
);
*/

CREATE TABLE t_adresse
(
  aid      number       CONSTRAINT pk_adresse_aid PRIMARY KEY,
  ortsname varchar2(20),
  pid       number      CONSTRAINT fk_adresse_id REFERENCES t_person (id)
);




set echo off

/*
REM Primärschlüssel über die beiden Spalten
REM vorname und nachname

CREATE TABLE t_person
(
  id       number      ,
  vorname  varchar2(20) CONSTRAINT pk_person_name PRIMARY KEY,
  nachname varchar2(20) CONSTRAINT pk_person_name PRIMARY KEY,
  alt      number(3)
);

CREATE TABLE t_person
(
  id       number      ,
  vorname  varchar2(20),
  nachname varchar2(20),
  alt      number(3),
  CONSTRAINT pk_person_name PRIMARY KEY (vorname , nachname)
);
*/

set echo on




