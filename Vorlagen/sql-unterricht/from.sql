REM @c:\daten\datenbank\skripte\from.sql

set linesize 200
set echo on
cl scr

CONN ora1/ora1

SELECT *
  FROM regions;

SELECT *
  FROM countries;


REM Kreuzprodukt
REM 16 Zeilen

SELECT *
  FROM regions CROSS JOIN countries;

SELECT *
  FROM regions , countries;


REM INNER JOIN

SELECT *
  FROM regions INNER JOIN countries
       ON (regions.region_id = countries.region_id);

SELECT  *
  FROM  regions , countries
  WHERE regions.region_id = countries.region_id;


SELECT *
  FROM regions JOIN countries
       ON (regions.region_id = countries.region_id);

SELECT *
  FROM regions r JOIN countries c
       ON (r.region_id = c.region_id);

SELECT *
  FROM regions r JOIN countries c
       USING (region_id);

SELECT *
  FROM regions JOIN countries
       USING (region_id);


REM Outer Join

SELECT first_name, last_name, department_id
  FROM employees;

SELECT department_id, department_name
  FROM departments;

SELECT first_name, last_name, department_name
  FROM employees e JOIN departments d
       ON e.department_id = d.department_id;

SELECT first_name, last_name, department_name
  FROM employees e LEFT JOIN departments d
       ON e.department_id = d.department_id;


SELECT first_name, last_name, department_name
  FROM employees e RIGHT JOIN departments d
       ON e.department_id = d.department_id;



SELECT first_name, last_name, department_name
  FROM employees e FULL JOIN departments d
       ON e.department_id = d.department_id;

SELECT first_name, last_name, department_name
  FROM employees e FULL JOIN departments d
       USING (department_id);


REM Join über mehrere Tabellen

SELECT region_name, first_name, last_name
  FROM regions r JOIN countries c   ON r.region_id = c.region_id
                 JOIN locations l   ON l.country_id = c.country_id
                 JOIN departments d ON d.location_id = l.location_id
                 JOIN employees e   ON e.department_id = d.department_id
 ;

REM Aufgabe: Es sollen alle Mitarbeiter ausgegeben werden!

SELECT region_name, first_name, last_name
  FROM regions r JOIN countries c       ON r.region_id = c.region_id
                 JOIN locations l       ON l.country_id = c.country_id
                 JOIN departments d     ON d.location_id = l.location_id
                 RIGHT JOIN employees e ON e.department_id = d.department_id
;


REM Optimierung der Performance

SELECT r.region_name, e.first_name, e.last_name
  FROM regions r JOIN countries c       ON r.region_id = c.region_id
                 JOIN locations l       ON l.country_id = c.country_id
                 JOIN departments d     ON d.location_id = l.location_id
                 RIGHT JOIN employees e ON e.department_id = d.department_id
;


REM auch das ist erlaubt

SELECT r.region_name, e.first_name, e.last_name
  FROM regions r JOIN employees e ON e.department_id = r.region_id
;


