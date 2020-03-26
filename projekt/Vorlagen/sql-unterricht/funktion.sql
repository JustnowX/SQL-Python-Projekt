REM @c:\daten\datenbank\skripte\funktion.sql

set linesize 200
set echo on
cl scr

CONN ora1/ora1

SELECT last_name, upper(last_name), lower(last_name)
  FROM employees;

SELECT last_name, length(last_name)
  FROM employees;

SELECT last_name, substr(last_name, 3) AS Teilstring_ab_3
  FROM employees;

SELECT last_name, substr(last_name, 3, 2)
  FROM employees;


REM Kommt im Nachnamen ein 'a' vor?

SELECT last_name, instr(last_name, 'a',1)
  FROM employees;

SELECT last_name, instr(last_name, 'aa',1)
  FROM employees;


SELECT last_name, instr(last_name, 'a',1)
  FROM employees
      UNION
SELECT last_name, instr(last_name, 'u',1)
  FROM employees;



SELECT last_name, instr(last_name,'a',1)
  FROM employees;


SELECT last_name, instr(last_name,'a',5)
  FROM employees;

SELECT '(030) 32799121',
     instr('(030) 32799121', ')', 1)
  FROM dual;

SELECT '(030) 32799121',
     substr('(030) 32799121', instr('(030) 32799121', ')', 1)+2)
  FROM dual;

SELECT last_name, substr(last_name, -3, 2)
  FROM employees;


REM numerische Funktionen

SELECT power (3,2), sqrt (9), power(9, 1/2)
  FROM dual;

SELECT 27, power(27, 1/3)
  FROM dual;

SELECT 3.37, round(3.37,1), round(3.33,1)
  FROM dual;

SELECT 3453.37, round(3453.37,-1), round(3453.37,0)
  FROM dual;


REM Datumsfunktionen

SELECT sysdate
  FROM dual;


REM Konvertierungsfunktionen
REM to_char

SELECT to_char(sysdate)
  FROM dual;

SELECT to_char(sysdate, 'DD.MM.YYYY')
  FROM dual;


SELECT to_char(sysdate, 'HH:MI:SS')
  FROM dual;

SELECT to_char(sysdate, 'HH24:MI:SS')
  FROM dual;

SELECT to_char(sysdate, 'DD.MM.YYYY HH24:MI:SS')
  FROM dual;


SELECT to_char(sysdate, 'SS  SSSSS')
  FROM dual;

SELECT to_char(sysdate, 'D   DD  DDD')
  FROM dual;

SELECT to_char(sysdate, 'MM/DD/YYYY')
  FROM dual;
