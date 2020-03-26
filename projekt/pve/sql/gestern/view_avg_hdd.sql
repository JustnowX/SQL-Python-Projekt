REM @C:\Users\Surface\Documents\GitHub\SQL-Python-Projekt\projekt\pve\sql\view_avg_hdd.sql
cl scr

conn ora1/ora1

SELECT AVG(disk_space)
FROM t_client;
