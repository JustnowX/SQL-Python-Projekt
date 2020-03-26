REM @c:\daten\datenbank\skripte\mengen.sql

set linesize 200
set echo on
cl scr

CONN ora1/ora1


REM Ausgabe der derzeitigen Jobs

SELECT employee_id, first_name, last_name, job_id
  FROM employees;


REM Ausgabe der früheren Jobs

SELECT *
  FROM job_history;


REM Welche Mitarbeiter haben in der Firma gearbeitet
REM (jetzt nicht mehr)
REM oder arbeiten immer noch in der Firma?
REM Ausgabe nur der employee_id

SELECT employee_id
  FROM job_history
     UNION
SELECT employee_id
  FROM employees;


REM Welche aktuellen Mitarbeiter haben in der Firma
REM den Job schon mal gewechselt?
RE+M Ausgabe nur der employee_id

SELECT employee_id
  FROM employees
     INTERSECT
SELECT employee_id
  FROM job_history;


REM Welche Mitarbeiter (employee_id) haben in der Firma gearbeitet,
REM jetzt aber nicht mehr?


SELECT employee_id
  FROM job_history
     MINUS
SELECT employee_id
  FROM employees;


REM Gib von allen Mitarbeitern (employee_id)
REM den jetzigen und die früheren Jobs (job_id) aus.

SELECT employee_id, job_id
  FROM job_history
     UNION
SELECT employee_id, job_id
  FROM employees;


SELECT employee_id, job_id
  FROM job_history
     UNION ALL
SELECT employee_id, job_id
  FROM employees;

SELECT employee_id, job_id
  FROM job_history
     UNION ALL
SELECT employee_id, job_id
  FROM employees
ORDER BY employee_id;


REM Welche Mitarbeiter haben den Job in der Firma gewechselt und
REM arbeiten wieder in ihrem alten Job?

SELECT employee_id, job_id
  FROM job_history
     INTERSECT
SELECT employee_id, job_id
  FROM employees;



REM Gib alle aktuellen Mitarbeiter aus,
REM die ihren Job noch nie gewechselt haben und
REM alle ehemaligen Mitarbeiter.

REM Gib alle aktuellen Mitarbeiter aus,
REM die ihren Job noch nie gewechselt haben und

SELECT employee_id
  FROM employees;

REM Wer hat den Job gewechselt?

SELECT employee_id
  FROM job_history;


REM 15 Mitarbeiter

SELECT employee_id
  FROM employees
    MINUS
SELECT employee_id
  FROM job_history;


REM alle ehemaligen Mitarbeiter.

REM 2 Mitarbeiter

SELECT employee_id
  FROM job_history
    MINUS
SELECT employee_id
  FROM employees;


REM Gesamtergebnis

(
SELECT employee_id
  FROM employees
    MINUS
SELECT employee_id
  FROM job_history
)
   UNION
(
SELECT employee_id
  FROM job_history
    MINUS
SELECT employee_id
  FROM employees
)
;
