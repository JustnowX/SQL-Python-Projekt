REM @C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\projekt\pve\sql\view_avg_hdd.sql
cl scr
set linesize 300
conn ora1/ora1

SELECT *
FROM t_client
ORDER BY clientname;
pause
exit
