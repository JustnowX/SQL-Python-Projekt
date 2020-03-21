REM @c:\daten\datenbank\skripte\unterabfrage.sql

connect ora1/ora1

set echo on
cl scr

SELECT employee_id, first_name, last_name,
       salary, job_id
   FROM employees;


REM Welche Mitarbeiter (first_name, last_name)
REM erhalten ein größeres Gehalt
REM als Taylor (employee_id 176)?

REM Welche Mitarbeiter (first_name, last_name)

SELECT first_name, last_name
  FROM employees;

REM Gehalt von Taylor (employee_id 176)

SELECT  salary
  FROM  employees
  WHERE employee_id = 176;

REM ein größeres Gehalt als Taylor

SELECT  first_name, last_name, salary
  FROM  employees
  WHERE salary > ( SELECT  salary
                     FROM  employees
                     WHERE employee_id = 176
                 )
;



REM Welche Mitarbeiter (first_name, last_name)
REM erhalten ein größeres Gehalt
REM als ein Mitarbeiter des Jobs IT_PROG?

REM Welche Mitarbeiter (first_name, last_name)

SELECT first_name, last_name, salary
  FROM employees;

REM Gehalt von Mitarbeitern des Jobs IT_PROG

SELECT  salary
  FROM  employees
  WHERE job_id = 'IT_PROG';

REM ein größeres Gehalt als 

SELECT first_name, last_name, salary
  FROM employees
  WHERE salary > ( SELECT  salary
                     FROM  employees
                     WHERE job_id = 'IT_PROG'
                 )
;

REM Lösung mit min()

SELECT first_name, last_name, salary
  FROM employees
  WHERE salary > ( SELECT  min(salary)
                     FROM  employees
                     WHERE job_id = 'IT_PROG'
                 )
;

REM Lösung ohne min()

SELECT first_name, last_name, salary
  FROM employees
  WHERE salary >ANY ( SELECT  salary
                        FROM  employees
                        WHERE job_id = 'IT_PROG'
                    )
;


REM Welche Mitarbeiter (first_name, last_name)
REM erhalten das größte Gehalt von allen?

REM Welche Mitarbeiter (first_name, last_name)

SELECT first_name, last_name, salary
  FROM employees;

REM das größte Gehalt von allen

SELECT max(salary)
  FROM employees;

REM erhalten das größte Gehalt

REM Lösung mit max()

SELECT  first_name, last_name, salary
  FROM  employees
  WHERE salary >= ( SELECT max(salary)
                      FROM employees
                  )
;

REM Lösung ohne max()

SELECT  first_name, last_name, salary
  FROM  employees
  WHERE salary >=ALL ( SELECT salary
                         FROM employees
                     )
;


REM Gib alle Mitarbeiter (first_name, last_name) aus,
REM die in den selben Abteilungen (department_id)
REM wie die Mitarbeiter Fay und Whalen arbeiten.

REM Gib alle Mitarbeiter (first_name, last_name) aus,
 
SELECT  first_name, last_name, department_id
  FROM  employees;

REM Abteilungen (department_id) von
REM Mitarbeiter Fay und Whalen

SELECT  department_id
  FROM  employees
  WHERE last_name = 'Fay'
    OR  last_name = 'Whalen';

REM die in den selben Abteilungen

SELECT  first_name, last_name, department_id
  FROM  employees
  WHERE department_id =ANY( SELECT  department_id
                              FROM  employees
                              WHERE last_name = 'Fay'
                                OR  last_name = 'Whalen'
                          )
;

SELECT  first_name, last_name, department_id
  FROM  employees
  WHERE department_id IN( SELECT  department_id
                            FROM  employees
                            WHERE last_name = 'Fay'
                              OR  last_name = 'Whalen'
                        )
;

SELECT  first_name, last_name, department_id
  FROM  employees
  WHERE department_id IN( SELECT  department_id
                            FROM  employees
                            WHERE last_name IN ('Fay', 'Whalen')
                        )
;


REM Welche Mitarbeiter (first_name, last_name)
REM erhalten das zweit-größte Gehalt von allen?

REM Welche Mitarbeiter (first_name, last_name)

SELECT first_name, last_name, salary
  FROM employees;

REM größte Gehalt von allen

SELECT max(salary)
  FROM employees;

REM Mitarbeiter die weniger als das größte Gehalt
REM erhalen

SELECT  salary
  FROM  employees
  WHERE salary < ( SELECT max(salary)
                     FROM employees
                 )
;

SELECT  max(salary)
  FROM  employees
  WHERE salary < ( SELECT max(salary)
                     FROM employees
                 )
;


REM Mitarbeiter mit dem zweit-größten

SELECT  first_name, last_name, salary
  FROM  employees
  WHERE salary = ( SELECT  max(salary)
                     FROM  employees
                     WHERE salary < ( SELECT max(salary)
                                        FROM employees
                                    )
                  )
;


REM Gib die Anzahl der mitglieder-stärksten Abteilung aus.

SELECT  first_name, last_name, department_id
  FROM  employees
  ORDER BY department_id;

REM jede Abteilung genau einmal ausgeben

SELECT department_id
  FROM employees
  GROUP BY department_id;

REM Abteilung und deren Anzahl ausgeben

SELECT department_id, count(*)
  FROM employees
  GROUP BY department_id;

REM die größte Mitglieder-Anzahl

SELECT  max(count(*))
  FROM  employees
  GROUP BY department_id;


REM Welche Abteilungen (department_id und Anzahl) sind
REM die mitglieder-stärksten Abteilungen.

SELECT department_id, count(*) AS anzahl
  FROM employees
  GROUP BY department_id;


REM die größte Mitglieder-Anzahl

SELECT  max(count(*))
  FROM  employees
  GROUP BY department_id;

REM Ausgabe der Anzahl gleich der größten Anzahl

SELECT  department_id, count(*) AS anzahl
  FROM  employees
  GROUP BY department_id
  HAVING count(*) = ( SELECT  max(count(*))
                        FROM  employees
                       GROUP BY department_id
                    )
;


REM Welche Abteilungen (department_name und Anzahl) sind
REM die mitglieder-stärksten Abteilungen.

SELECT  department_name, count(*) AS anzahl
  FROM  employees JOIN departments USING (department_id)
  GROUP BY department_id
  HAVING count(*) = ( SELECT  max(count(*))
                        FROM  employees
                       GROUP BY department_id
                    )
;

SELECT  department_name, count(*) AS anzahl
  FROM  employees JOIN departments USING (department_id)
  GROUP BY department_name
  HAVING count(*) = ( SELECT  max(count(*))
                        FROM  employees
                       GROUP BY department_id
                    )
;



