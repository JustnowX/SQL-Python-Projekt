REM @C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\proxmoxdb\db\sqlselect\select_hosts.sql
cl scr
set linesize 300
conn ora1/ora1

SELECT *
FROM t_hosts;
ORDER BY Hostname;
pause
exit
