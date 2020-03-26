REM @c:\daten\datenbank\skripte\aufgabe3.sql

set linesize 200
set echo on
cl scr

CONN ora1/ora1

REM 1.
REM Gib alle Mitarbeiter (Vor- und Nachname) aus,
REM die ein 5-Stelliges Gehalt erhalten.

SELECT first_name, last_name, salary
  FROM employees
  WHERE salary LIKE '_____';

SELECT first_name, last_name, salary
  FROM employees
  WHERE salary >= 10000
    AND salary <= 99999;

SELECT first_name, last_name, salary
  FROM employees
  WHERE salary BETWEEN 10000 AND 99999;


REM 2.
REM Gib jede Stadt (city) absteigend sortiert aus.

SELECT city
  FROM locations
  ORDER BY city DESC;


REM 3.
REM Gib alle Mitarbeiter (Vor- und Nachname) aus,
REM die keine Provision (commission_pct) erhalten.

SELECT  first_name, last_name, commission_pct
  FROM  employees
  WHERE commission_pct IS NULL;


REM 4.
REM Gib alle Mitarbeiter (Vor- und Nachname) aus,
REM aufsteigend sortiert nach der Telefonnummer
REM (phone_number).

SELECT first_name, last_name, phone_number
  FROM employees
  ORDER BY phone_number;


REM 5.
REM Welche Abteilung (Abteilungsname) hat
REM keine Mitarbeiter.
REM a) Lösung mit manager_id
REM b) Lösung ohne manager_id

REM a)
SELECT  department_name
  FROM  departments
  WHERE manager_id IS NULL;

REM b)
SELECT  first_name, last_name, d.department_name
  FROM  employees e RIGHT JOIN departments d
        ON (e.department_id = d.department_id)
  WHERE first_name IS NULL;

SELECT  first_name, last_name, d.department_name
  FROM  employees e RIGHT JOIN departments d
        ON (e.department_id = d.department_id)
  WHERE last_name IS NULL;

SELECT  first_name, last_name, d.department_name
  FROM  employees e RIGHT JOIN departments d
        ON (e.department_id = d.department_id)
  WHERE e.employee_id IS NULL;


REM 6.
REM Gib alle (!) Abteilungsnamen,
REM den Vor- und Nachnamen von jedem Mitarbeiter aus,
REM aber aufsteigend sortiert nach dem Abteilungsnamen und
REM bei gleichen Abteilungsnamen absteigend sortiert
REM nach dem Gehalt.

select first_name, last_name, department_name, salary
    from employees RIGHT JOIN departments USING (department_id)
    order by department_name, salary desc;





