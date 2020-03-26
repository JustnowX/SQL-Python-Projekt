REM @c:\daten\datenbank\skripte\aufgabe4.sql

set linesize 80
set echo on
cl scr

CONN ora1/ora1

REM 1.
REM Gib die Abteilungs-ID und
REM die Anzahl der Mitarbeiter aus,
REM aber aufsteigend sortiert
REM nach der Anzahl der Mitarbeiter.

SELECT department_id,
       count(*) AS "Anzahl der Mitarbeiter"
  FROM employees
  GROUP BY department_id
  ORDER BY count(*);

SELECT department_id, count(employee_id)
  FROM employees
  GROUP BY department_id
  ORDER BY count(employee_id);

REM 2.
REM Gib den Abteilungsname und
REM die Anzahl der Mitarbeiter aus,
REM aber aufsteigend sortiert
REM nach der Anzahl der Mitarbeiter.
REM Hinweis: Die Abteilungsnamen sind eindeutig.

SELECT d.department_name, count(e.employee_id)
  FROM employees e RIGHT JOIN departments d
       ON (d.department_id =e.department_id)
  GROUP by d.department_name
  ORDER BY count(employee_id);


REM 3.
REM Wie viele europäische Mitarbeiter gibt es?
REM Regionname ist 'Europe'

SELECT count(e.employee_id)
  FROM regions r JOIN countries c   ON r.region_id = c.region_id
                 JOIN locations l   ON l.country_id = c.country_id
                 JOIN departments d ON d.location_id = l.location_id
                 JOIN employees e   ON e.department_id = d.department_id
  WHERE r.region_name = 'Europe';


REM 4.
REM Wie viele Mitarbeiter erhalten ein Gehalt,
REM das kleiner als 8700 ist.

SELECT  count(employee_id)
  FROM  employees
  WHERE salary < 8700;

SELECT  count(employee_id)
  FROM  employees
  WHERE salary < 8700
  GROUP BY();


REM 5.
REM In wie vielen Abteilungen sind Mitarbeiter
REM tätig?
REM Lösung: 8

SELECT department_id
  FROM employees;

SELECT department_id
  FROM employees
  GROUP BY department_id;

SELECT count(department_id)
  FROM employees
  GROUP BY department_id;

SELECT count(nvl(department_id, 1))
  FROM employees
  GROUP BY department_id;

SELECT count(count(nvl(department_id, 1))) AS Anzahl
  FROM employees
  GROUP BY department_id;





