REM @c:\daten\datenbank\skripte\where.sql

set linesize 200
set echo on
cl scr

CONN ora1/ora1

SELECT last_name, salary
  FROM employees
;

REM Gib alle Mitarbeiter aus,
REM die ein größeres Geahlt als 5000 bekommen.

SELECT last_name, salary
  FROM employees
  WHERE salary > 5000
;


REM Gib alle Mitarbeiter aus,
REM die ein größeres Geahlt als 5000 und
REM ein kleineres Gehalt als 8700 bekommen.

SELECT last_name, salary
  FROM employees
  WHERE salary > 5000
    AND salary < 8700
;


REM Gib alle Mitarbeiter
REM (first_name, last_name, department_id) 
REM aus den Abteilungen 50 und 60 aus.

SELECT last_name, department_id
  FROM employees
  WHERE department_id = 50
    OR  department_id = 60
;



