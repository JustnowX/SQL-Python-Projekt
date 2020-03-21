REM @c:\daten\datenbank\skripte\group_by.sql

set linesize 80
set echo on
cl scr

CONN ora1/ora1

SELECT employee_id, last_name, department_id
  FROM employees;


SELECT count(*)
  FROM employees;

SELECT count(*)
  FROM employees
  GROUP BY ();


REM Wie viele Mitarbeiter gibt es pro Abteilung.

SELECT department_id, count(nvl(department_id,0))
  FROM employees
  GROUP BY department_id;


REM Wie viele Manager gibt es.

SELECT manager_id,
  count(nvl(manager_id,0)) AS "Anzahl der Untergebenen"
  FROM employees
  GROUP BY manager_id;


SELECT department_id, manager_id,
    count(nvl(department_id,0)), count(nvl(manager_id,0))
  FROM employees
  GROUP BY department_id, manager_id;



