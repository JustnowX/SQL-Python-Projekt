REM @c:\daten\datenbank\skripte\order_by.sql

set linesize 200
set echo on
cl scr

CONN ora1/ora1

REM Gib die Mitarbeiter (first_name, last_name)
REM aufsteigend sortiert nach dem Nachnamen aus.

SELECT first_name, last_name
  FROM employees
  ORDER BY last_name;

SELECT first_name, last_name AS Nachname
  FROM employees
  ORDER BY last_name;

SELECT first_name, last_name AS Nachname
  FROM employees
  ORDER BY nachname;


REM Gib die Mitarbeiter (first_name, last_name)
REM absteigend sortiert nach dem Gehalt aus.

SELECT first_name, last_name AS Nachname, salary
  FROM employees
  ORDER BY salary DESC;

SELECT first_name, last_name AS Nachname
  FROM employees
  ORDER BY salary DESC;



REM Gib die Abteilungsnummer, den Nachnamen und
REM den Vornamen aus, aufsteigend sortiert
REM nach der Abteilungsnummer und innerhalb jeder Abteilungsnummer
REM erfolgt eine aufsteigende Sortierung nach dem Nachnamen.

SELECT department_id, last_name, first_name
  FROM employees
  ORDER BY department_id, last_name;












REM Wie wird sortiert (1 Antwort)?
REM A) Aufsteigende Sortierung nach Nachname und Vorname
REM B) Absteigende Sortierung nach Nachname und Vorname
REM C) Absteigende Sortierung nach Nachname und
REM    aufsteigende Sortierung nach Vorname
REM D) aufsteigende Sortierung nach Nachname und
REM    absteigende Sortierung nach Vorname
REM E) Fehler, da in der SELECT-Klausel AS bei Nachname
REM    vergessen wurde
REM F) aufsteigende Sortierung nach Nachname und
REM    innerhalb gleicher Nachnamen erfolgt eine
REM    absteigende Sortierung nach dem Vornamen
REM G) Fehler, da in der SELECT-Klausel Nachname bzw.
REM    Vorname groß geschrieben wurde, aber
REM    bei ORDER BY wurde vorname und nachname
REM    in Kleinbuchstaben angegeben.


SELECT     last_name Nachname, first_name AS Vorname
  FROM     employees
  ORDER BY nachname, vorname DESC;

SELECT     last_name Nachname, first_name AS Vorname
  FROM     employees
  ORDER BY nachname ASC, vorname DESC;

REM richtige Antwort: F

SELECT     department_id, last_name Nachname
  FROM     employees;

SELECT     department_id, last_name Nachname
  FROM     employees
  ORDER BY department_id;

SELECT     department_id, last_name Nachname
  FROM     employees
  ORDER BY department_id, last_name DESC;

