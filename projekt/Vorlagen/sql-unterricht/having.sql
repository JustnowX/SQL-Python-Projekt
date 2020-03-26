REM @c:\daten\datenbank\skripte\having.sql

set linesize 80
set echo on
cl scr

CONN ora1/ora1

SELECT department_id, count(department_id)
  FROM employees
  GROUP BY department_id;

SELECT department_id, count(department_id)
  FROM employees
  GROUP BY department_id
  HAVING count(department_id) > 1;


REM Gib alle Abteilungsgruppen (department_id) aus,
REM die jeweils 2 Mitarbeiter haben.

SELECT department_id, count(department_id)
  FROM employees
  GROUP BY department_id
  HAVING count(department_id) = 2;

REM In welchen Abteilungen ist
REM die Summe der Gehälter pro Abteilung größer 7500?

SELECT department_id, salary
  FROM employees;


SELECT department_id, sum(salary)
  FROM employees
  GROUP BY department_id
  HAVING  SUM (salary) > 7500; 


/*
SELECT department_id, sum(salary), last_name
  FROM employees
  GROUP BY department_id, last_name
  HAVING  SUM (salary) > 7500; 
*/


SELECT department_id, sum(salary)
  FROM employees
  GROUP BY department_id
  HAVING SUM (salary) > 7500
    AND  department_id = 50; 


SELECT department_id, sum(salary)
  FROM employees
  WHERE  department_id = 50
  GROUP BY department_id
  HAVING SUM (salary) > 7500; 


REM Fehler: Gruppenfunktion in der WHERE-Klausel verboten

SELECT department_id, sum(salary)
  FROM employees
  WHERE  department_id = 50
    AND  SUM (salary) > 7500
  GROUP BY department_id; 


REM 

SELECT department_id, sum(salary)
  FROM employees
  WHERE  last_name = 'King'
  GROUP BY department_id
  HAVING  SUM (salary) > 7500
; 


REM Fehler: Kein Gruppenausdruck: last_name

SELECT department_id, sum(salary)
  FROM employees
  GROUP BY department_id
  HAVING  SUM (salary) > 7500
    AND   last_name = 'King'
; 




