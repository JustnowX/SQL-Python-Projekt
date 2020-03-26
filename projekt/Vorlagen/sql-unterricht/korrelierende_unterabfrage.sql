REM @c:\daten\datenbank\skripte\korrelierende_unterabfrage.sql

connect ora1/ora1

set echo on
cl scr


REM temporäre Gehaltserhöhung

UPDATE employees
  SET  salary = 6000
  WHERE employee_id = 124;


SELECT first_name, last_name, salary, department_id
  FROM employees;


REM Gib von jeder Abteilung diejenigen Mitarbeiter aus,
REM die in ihren jeweiligen Abteilungen das größte Gehalt
REM beziehen.

REM Gib von jeder Abteilung diejenigen Mitarbeiter aus,

SELECT first_name, last_name, salary, department_id
  FROM employees;

REM jeweiligen Abteilungen das größte Gehalt

SELECT max(salary), department_id
  FROM employees
  GROUP BY department_id;

SELECT max(salary)
  FROM employees
  GROUP BY department_id;

REM die in ihren jeweiligen Abteilungen das größte Gehalt erhalten

REM logischer Fehler
REM Es werden alle Mitarbeiter ausgegeben, die ein Gehalt
REM beziehen, dass dem größten Gehalt irgend einer 
REM Abteilung entspricht.
REM Abteilung 50: größte Gehalt ist 6000

SELECT  first_name, last_name, salary, department_id
  FROM  employees
  WHERE salary IN ( SELECT max(salary)
                      FROM employees
                     GROUP BY department_id
                  )
;


REM richtige Antwort

SELECT  first_name, last_name, salary, department_id
  FROM  employees haupt
  WHERE salary IN ( SELECT  max(salary)
                      FROM  employees unter
                      WHERE unter.department_id = haupt.department_id
                      GROUP BY department_id
                  )
;


SELECT  first_name, last_name, salary, department_id
  FROM  employees haupt
  WHERE salary IN ( SELECT  max(salary)
                      FROM  employees unter
                      WHERE unter.department_id = haupt.department_id
                  )
;

SELECT  first_name, last_name, salary, department_id
  FROM  employees haupt
  WHERE salary = ( SELECT  max(salary)
                     FROM  employees unter
                     WHERE unter.department_id = haupt.department_id
                 )
;


ROLLBACK;

cl scr

SELECT employee_id, first_name, last_name, manager_id
  FROM employees;


REM Gib alle Mitarbeiter (first_name, last_name) aus,
REM die Manager/Vorgesetzte (manager_id) sind.


REM Gib alle Mitarbeiter (first_name, last_name) aus,

SELECT employee_id, first_name, last_name
  FROM employees;


REM die Manager/Vorgesetzte ermitteln

SELECT manager_id
  FROM employees;

SELECT DISTINCT manager_id
  FROM employees;

REM die Manager/Vorgesetzten

SELECT  employee_id, first_name, last_name
  FROM  employees
  WHERE employee_id IN ( SELECT DISTINCT manager_id
                           FROM employees
                       )
;

SELECT  employee_id, first_name, last_name
  FROM  employees aussen
  WHERE EXISTS ( SELECT manager_id
                   FROM employees innen
                  WHERE innen.manager_id = aussen.employee_id
               )
;

SELECT  employee_id, first_name, last_name
  FROM  employees aussen
  WHERE EXISTS ( SELECT 'Idiot'
                   FROM employees innen
                  WHERE innen.manager_id = aussen.employee_id
               )
;

REM Gib alle Mitarbeiter (first_name, last_name) aus,
REM die nicht Manager/Vorgesetzte (manager_id) sind.

SELECT  employee_id, first_name, last_name
  FROM  employees aussen
  WHERE NOT EXISTS ( SELECT 'Idiot'
                       FROM employees innen
                      WHERE innen.manager_id = aussen.employee_id
                   )
;


REM anderes Beispiel

SELECT  department_name, count(*) AS anzahl
  FROM  employees JOIN departments (department_id)
  GROUP BY department_id
  HAVING count(*) = ( SELECT  max(count(*))
                        FROM  employees
                       GROUP BY department_id
                    )
;

REM Lösung funktioniert nur, wenn
REM es keine 2 unterschiedliche Abteilungen gibt,
REM die denselben Namen besitzen.

SELECT  department_name, count(*) AS anzahl
  FROM  employees JOIN departments (department_id)
  GROUP BY department_name
  HAVING count(*) = ( SELECT  max(count(*))
                        FROM  employees
                       GROUP BY department_id
                    )
;


REM Lösung funktioniert nur immer

SELECT  department_name, count(*) AS anzahl
  FROM  employees
  GROUP BY department_id
  HAVING count(*) = ( SELECT  max(count(*))
                        FROM  employees
                       GROUP BY department_id
                    )
;


SELECT  (SELECT department_name
           FROM departments innen
           WHERE innen.department_id = haupt.department_id), count(*) AS anzahl
  FROM  employees  haupt
  GROUP BY department_id
  HAVING count(*) = ( SELECT  max(count(*))
                        FROM  employees
                       GROUP BY department_id
                    )
;


REM Inline-View

SELECT last_name
  FROM (SELECT last_name
          FROM employees
       )
;

SELECT teil.last_name
  FROM (SELECT last_name
          FROM employees
       ) teil
;


SELECT teil.last_name
  FROM (SELECT last_name
          FROM employees JOIN departments USING (department_id)
       ) teil
;

SELECT teil.last_name
  FROM (SELECT employee_id, last_name
          FROM employees JOIN departments USING (department_id)
       ) teil JOIN job_history USING (employee_id)
;


