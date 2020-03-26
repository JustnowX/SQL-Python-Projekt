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

SELECT to_char(sysdate, 'DD.MM.YYYY  HH24:MI:SS')
  FROM dual;


SELECT to_char(sysdate, 'SS  SSSSS')
  FROM dual;

SELECT to_char(sysdate, 'D   DD  DDD')
  FROM dual;

SELECT to_char(sysdate, 'MM/DD/YYYY')
  FROM dual;

SELECT to_char(sysdate, 'Q  W  WW')
  FROM dual;

SELECT to_char(sysdate, 'J')
  FROM dual;


SELECT sysdate - 5
  FROM dual;


SELECT to_char(sysdate, '"Heute ist "Day", der "DD.MM.YYYY')
  FROM dual;


REM to_date

SELECT to_date ('03.07.1894', 'DD.MM.YYYY')
  FROM dual;

SELECT to_char(to_date ('03.07.1894', 'DD.MM.YYYY'), 'DD.MM.YYYY')
  FROM dual;


REM to_number

SELECT to_number ('1,234.56', '9,999.09')
  FROM dual;


SELECT to_number ('199,999.56', '99,999.09')
  FROM dual;


REM L - lokales Währungssymbol

SELECT to_char(123.45, '999.99L')
  FROM dual;



REM nvl()

SELECT NULL / 0
  FROM dual;

SELECT last_name, salary, commission_pct,
       salary + commission_pct
  FROM employees;

SELECT last_name, salary, commission_pct,
       salary + nvl(commission_pct, -100)
  FROM employees;

SELECT first_name, nvl(first_name, 'unbekannt')
  FROM employees;

SELECT last_name, department_id, nvl(department_id, 'unbekannt')
  FROM employees;

SELECT last_name, department_id, nvl(department_id, -1)
  FROM employees;


cl scr

REM Gruppenfunktionen

SELECT last_name, salary
  FROM employees;


REM Gib das größte und das keinste Gehalt
REM aller Mitarbeiter aus.

SELECT max(salary) AS maximum, min(salary) as minimum
  FROM employees;

SELECT sum(salary) AS summe, avg(salary) AS durchschnitt
  FROM employees;


REM Gib den größten und
REM den kleinsten Nachnamen aus.

SELECT max(last_name) AS maximum, min(last_name) as minimum
  FROM employees;


UPDATE employees
  SET  last_name = 'abel'
  WHERE employee_id = 174;

SELECT max(last_name) AS maximum, min(last_name) as minimum
  FROM employees;

ROLLBACK;

SELECT last_name, lower(last_name), initcap(lower(last_name))
  FROM employees;


REM Gib die Länge des kürzesten und
REM des längsten Nachnamen aus.

SELECT min(length(last_name)) , max (length(last_name))
  FROM employees;


REM Wie viele Mitarbeiter gibt es?

SELECT count(*), count(*) || ' rows selected.'
  FROM employees;

SELECT count(*), count(employee_id),
       count(department_id), count(nvl(department_id,0))
  FROM employees;


SELECT count(1), count('Idiot')
  FROM employees;


REM Wie viele Mitarbeiter gibt es?

SELECT count(*), sum (employee_id), sum(1)
  FROM employees;


REM NULL-Datensätze

DROP TABLE t_null;

CREATE TABLE t_null
(id number);

INSERT INTO t_null VALUES (NULL);

INSERT INTO t_null VALUES (NULL);

INSERT INTO t_null VALUES (NULL);

INSERT INTO t_null VALUES (NULL);

INSERT INTO t_null VALUES (NULL);

INSERT INTO t_null VALUES (NULL);

COMMIT;


REM NULL-Wert sichtbar machen

SET NULL <null>


SELECT * FROM t_null;


SELECT count(*) FROM t_null;


INSERT INTO t_null VALUES (1);

INSERT INTO t_null VALUES (1);

COMMIT;

SELECT *
  FROM t_null;

SELECT rowid, id
  FROM t_null;

DELETE FROM t_null
  WHERE rowid = 'AAAFK/AAEAAABtfAAG';




