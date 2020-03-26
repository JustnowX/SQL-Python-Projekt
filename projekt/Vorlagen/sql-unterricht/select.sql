REM @c:\daten\datenbank\skripte\select.sql

set linesize 200
set echo on
cl scr

CONN ora1/ora1

SELECT *
  FROM employees;

SELECT first_name, last_name
  FROM employees;


SELECT first_name vorname, last_name AS nachname
  FROM employees;


SELECT last_name, salary, salary
  FROM employees;


SELECT last_name, salary, salary * 1.05
  FROM employees;

SELECT employee_id, employee_id * employee_id
  FROM employees;


SELECT 3 / 4
  FROM employees;


SELECT 3 / 4, 3 * 4, 3 + 4, 3 - 4
  FROM dual;


REM DISTINCT

SELECT department_id
  FROM employees;

SELECT DISTINCT department_id
  FROM employees;

SELECT DISTINCT department_id, employee_id
  FROM employees;






